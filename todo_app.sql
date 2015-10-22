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



