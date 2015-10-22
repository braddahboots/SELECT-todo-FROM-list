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

-- i remove a column from table
ALTER TABLE tasks DROP COLUMN completed;

-- ii add a column to tasks table
ALTER TABLE tasks ADD COLUMN completed_at timestamp null;

-- iii update column on tasks table
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

-- iii update column on tasks table
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

-- iv create new task by adding values
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES (
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

-- v create new task1
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES (
  'Study PostgreSQL',
  'Read all the documentation',
  now(),
  now(),
  NULL
);

-- vi select all titles of task
SELECT title FROM tasks WHERE completed_at IS NULL;

-- vii update titles that are null
UPDATE tasks SET title = 'Study SQL' WHERE title = NULL;

-- viii select all titles and descriptions
SELECT title, description FROM tasks WHERE title = NULL AND description = NULL;

-- ix select all fields of each task sorted by creation date
SELECT * FROM tasks ORDER BY created_at DESC;

-- x create a new task
INSERT INTO tasks(title, description, created_at, updated_at, completed_at) VALUES (
  'mistake 1',
  'a test entry',
  now(),
  now(),
  NULL
);

-- xi create a new task
INSERT INTO tasks(title, description, created_at, updated_at, completed_at) VALUES (
  'mistake 2',
  'another test entry',
  now(),
  now(),
  NULL
);

-- xii create a new task
INSERT INTO tasks(title, description, created_at, updated_at, completed_at) VALUES (
  'third mistake',
  'another test entry',
  now(),
  now(),
  NULL
);

-- xii select title fields by column value
SELECT title FROM tasks WHERE title LIKE '%' || 'mistake' || '%';

-- xiv deletes a row by specified column value
DELETE FROM tasks WHERE title = 'mistake 1';

-- xv select title and description fields by column value
SELECT title, description FROM tasks WHERE title LIKE '%' || 'mistake' || '%';

-- delete all task by specified column value
DELETE FROM tasks WHERE title LIKE '%mistake%';

-- select all fields and all tasks with title in ascending ORDER
SELECT * FROM tasks ORDER BY title ASC;