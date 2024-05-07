CREATE DATABASE myProject1;
USE myProject1;

CREATE TABLE item (
    itemId INT AUTO_INCREMENT PRIMARY KEY ,
    itemName VARCHAR(30) NOT NULL ,
    itemPrice INT NOT NULL
);


DESC member;

ALTER TABLE member MODIFY COLUMN userId VARCHAR(20) UNIQUE ;
ALTER TABLE member MODIFY COLUMN dbId INT PRIMARY KEY  AUTO_INCREMENT;


SELECT * FROM member;
SELECT * FROM item;

DELETE FROM member WHERE dbId = '';

DROP TABLE board;
CREATE TABLE board (
                       board_id INT AUTO_INCREMENT PRIMARY KEY ,
                       title VARCHAR(30) NOT NULL ,
                       content VARCHAR(5000) NOT NULL ,
                       writer VARCHAR(20) NOT NULL REFERENCES member(userId),
                       inserted DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO board ( title, content, writer)
VALUES ('3 번째 글', ' 글 내용 ', 'test2');



SELECT * FROM board;

DESC board;
DESC member;
SELECT * FROM board
WHERE board_Id = 1;

UPDATE board SET
    title = '타이틀변경!',
        content ='aaaaaaaaa'
WHERE board_Id = 1;

SELECT * FROM member;

