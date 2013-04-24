
DROP TABLE user IF EXISTS;
CREATE TABLE user (
  id	INTEGER IDENTITY PRIMARY KEY,
  name	VARCHAR(30),
  password  VARCHAR(30), 
  email	VARCHAR(30)
);
CREATE INDEX user_name ON user (name);
