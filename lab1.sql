/*1.Create database called «lab1»*/
CREATE DATABASE lab1;

/*2.Create table «users» with following fields*/
CREATE TABLE IF NOT EXISTS users(
    id          integer,
    firstname   varchar(50),
    lastname    varchar(50)
);

/*3.Add integer column (0 or 1) «isadmin» to «users» table*/
ALTER TABLE  IF EXISTS users
    ADD COLUMN isadmin INTEGER;

/*4.Change type of «isadmin» column to boolean, 5.Set default value as false to «isadmin» column*/
ALTER TABLE IF EXISTS users
    ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin::BOOLEAN,
    ALTER COLUMN isadmin SET DEFAULT false;

/*6.Add primary key constraint to id column*/
ALTER TABLE IF EXISTS users
    ADD PRIMARY KEY (id);

/*7.Create table «tasks» with following fields*/
CREATE TABLE IF NOT EXISTS tasks(
    id         integer,
    name       varchar(50),
    user_id    integer
);

/*8.Delete «tasks» table*/
DROP TABLE IF EXISTS tasks CASCADE;

/*9.Delete «lab1» database*/
DROP DATABASE IF EXISTS lab1;
/*
DROP TABLE IF EXISTS users;