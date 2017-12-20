require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Question


  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        associated_author_id = ?
    SQL

    return nil if questions.length == 0
    questions.map { |question| Question.new(question) }
  end




  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @associated_author_id = options['associated_author_id']
  end

  def author
    user = QuestionsDatabase.instance.execute(<<-SQL, @associated_author_id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = @associated_author_id
    SQL

    user.first['fname'] + " " + user.first['lname']
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

end

class User

  def self.find_by_name(fname,lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    return nil if users.empty?

    User.new(users.first)
  end


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname= options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    questionIDS = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        (COUNT(question_likes.user_id)/COUNT(DISTINCT(questions.id)))

      FROM
        questions
      LEFT OUTER JOIN question_likes ON question_id = questions.id
      WHERE
        user_id = ?
    SQL
    questionIDS[0].values.first
  end

  def save
    user = QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      UPDATE
        users
      SET
        fname = ?, lname = ?
    SQL
  end

end

class Reply

  def self.find_by_user_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
    @question_id = options['question_id']

  end

  def question
    question = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
  SQL
    return nil if question.empty?
    Question.new(question.first)
  end

  def parent_reply
    parent = QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if @parent_reply_id == nil
    Reply.new(parent.first)
  end

  def child_replies
    child = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
       *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    return nil if child.empty?
    child.map { |reply| Reply.new(reply) }
  end

end

class QuestionFollow

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
       *
      FROM
        users
      JOIN question_follows ON user_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil if followers.empty?
    followers.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN question_follows ON questions.id = question_id
      WHERE
        user_id = ?
    SQL

    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN question_follows ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT ?
    SQL

    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end
end

class QuestionLike


  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN question_likes ON user_id = users.id
      WHERE
        question_id = ?
    SQL

    return nil if likers.empty?
    likers.map {|ppl| Users.new(ppl)}
  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      GROUP BY
        question_id
      HAVING
        question_id = ?
    SQL

    return nil if num_likes.empty?

    num_likes[0].values.first
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN question_likes ON question_id = questions.id
      WHERE
        question_likes.user_id = ?
    SQL

    return nil if questions.empty?
    questions.map { |quest| Question.new(quest) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN question_likes ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT ?
    SQL

    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def initialize (options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

user1 = User.find_by_name('Bob', 'Smith')
# p user1.authored_replies
# p user1.authored_questions

user2 = User.find_by_name('John', 'Miller')
# replies = user2.authored_replies
# p replies
# p replies.first.child_replies
# p replies.last.child_replies
# user2.authored_questions
# p QuestionFollow.most_followed_questions(1)
# p QuestionLike.num_likes_for_question_id(3)

 user1.average_karma
