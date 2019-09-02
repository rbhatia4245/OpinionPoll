DROP DATABASE IF EXISTS opinion_poll;
CREATE DATABASE IF NOT EXISTS opinion_poll;
use opinion_poll;

Create Table user(
id int unique not null auto_increment,
name varchar(32),
email varchar(32) unique not null
);

Create Table questions(
id int unique not null auto_increment,
question varchar(124),
A varchar(32),
B varchar(32),
C varchar(32),
D varchar(32)
);

Create Table answers(
	id int unique not null auto_increment,
	user_id int,
	question_id int,
	answer varchar(32)
);

