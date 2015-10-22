-- can't be in to do unless you drop it
\c Boots;
-- //check to see if 'michael' user exists
DROP USER IF EXISTS michael;

-- //create user with encryt pass
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- //drop database if it exists
DROP DATABASE IF EXISTS todo_app;

-- //create a database named todo_app
CREATE DATABASE todo_app;

-- //connect to new database
\c todo_app;

-- create a new table instance
CREATE TABLE tasks (
  id serial PRIMARY KEY,
  title varchar(255),
  description text,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  completed boolean
);

-- remove a column from table
ALTER TABLE tasks DROP COLUMN completed;

-- add a column to tasks table
ALTER TABLE tasks ADD COLUMN completed_at timestamp null;

-- update column on tasks table
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

-- update column on tasks table
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

-- create new task by adding values
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES (
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

-- create new task1
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES (
  'Study PostgreSQL',
  'Read all the documentation',
  now(),
  now(),
  NULL
);

-- select all titles of task
SELECT title FROM tasks WHERE title = NULL;

-- update titles that are null
UPDATE tasks SET title = 'Study SQL' WHERE title = NULL;

-- select all titles and descriptions
SELECT title, description FROM tasks WHERE title = NULL AND description = NULL;

-- select all fields of each task sorted by creation date
SELECT * FROM tasks
