class QuestionSuper

  def find_by_id
    thing = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        '#{self.to_s}'s
      WHERE
        id = ?
    SQL
  end

  def self.all

  end

end
