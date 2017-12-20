DROP TABLE IF EXISTS users;

CREATE TABLE users (
  fname TEXT NOT NULL,
  lname TEXT NOT NULL,
  id INTEGER PRIMARY KEY
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  associated_author_id INTEGER NOT NULL,
  id INTEGER PRIMARY KEY,

  FOREIGN KEY (associated_author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  id INTEGER PRIMARY KEY,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (id) REFERENCES replies(parent_reply_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Bob', 'Smith'),
  ('Murray', 'Hair'),
  ('Julie', 'Child'),
  ('Harry', 'Potter'),
  ('John', 'Miller');

INSERT INTO
  questions (title, body, associated_author_id)
VALUES
  ('Food', 'Favorite food?', (SELECT id FROM users WHERE fname = 'John')),
  ('Toy', 'Favorite toy?',  (SELECT id FROM users WHERE fname = 'Bob')),
  ('Drink', 'Favorite drink?', (SELECT id FROM users WHERE fname = 'Harry')),
  ('Color', 'Favorite color?', (SELECT id FROM users WHERE fname = 'John'));

INSERT INTO
  replies(parent_reply_id, user_id, body, question_id)
VALUES
  (NULL, 1, 'Hello', 2),
  (1, 2, 'Hello back', 2),
  (NULL, 5, 'Coffee', 3),
  (3, 5, 'Me too', 3),
  (3, 5, 'Me toooo', 3);

  INSERT INTO
    question_follows(user_id, question_id)
  VALUES
    (1, 2),
    (3, 1),
    (2, 3),
    (1, 3),
    (3, 3),
    (5, 3),
    (4, 2);

    INSERT INTO
      question_likes(user_id, question_id)
    VALUES
      (1, 2),
      (3, 1),
      (2, 3),
      (1, 3),
      (3, 3),
      (5, 3),
      (4, 2);
