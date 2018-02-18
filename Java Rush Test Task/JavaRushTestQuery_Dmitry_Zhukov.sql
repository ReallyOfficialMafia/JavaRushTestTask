CREATE DATABASE test;

USE test;

CREATE TABLE book(id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL, description VARCHAR(255), author VARCHAR(100) NOT NULL,
  isbn VARCHAR(20) NOT NULL, printYear int(4), readAlready BOOLEAN NOT NULL,
  PRIMARY KEY (id));

INSERT INTO book (title, description, author, isbn, printYear, readAlready)
VALUES ('Here I am', 'The book about me and where I am', 'J.Swaiks',
        '978-6-42-275826-8', '1987', FALSE);
INSERT INTO book (title, description, author, isbn, printYear, readAlready)
VALUES ('Computer', 'Life of the one huge computer, what else??', 'E.Kajebi',
'978-6-37-176993-4', '2020', FALSE);
INSERT INTO book (title, description, author, isbn, printYear, readAlready)
VALUES ('12 socks', 'A small comedy about young man, Mr.Wowcut', 'O.Ujanjo',
        '978-5-60-939673-1', '2000', FALSE);


