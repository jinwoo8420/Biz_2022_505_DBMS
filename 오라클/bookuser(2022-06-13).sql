-- naver 사용자 화면

CREATE TABLE tbl_bbs (
	b_seq		NUMBER			PRIMARY KEY,
	b_date		VARCHAR2(10) 	NOT NULL,
	b_time		VARCHAR2(10) 	NOT NULL,
	b_writer	VARCHAR(125) 	NOT NULL,
	b_subject	VARCHAR2(125) 	NOT NULL,
	b_content	VARCHAR2(1000) 	NOT NULL
);

DROP table tbl_bbs;

-- 시작 값을 1로 하고 1씩 자동 증가되는 SEQ 생성
CREATE SEQUENCE seq_bbs
INCREMENT BY 1 START WITH 1;

drop SEQUENCE seq_bbs;

SELECT seq_bbs.NEXTVAL FROM DUAL;

INSERT INTO tbl_bbs(b_seq, b_date, b_time, b_writer, b_subject, b_content)
VALUES(seq_bbs.NEXTVAL, '2022-06-13', '14:23:00', 'callor', '게시판 글쓰기', '게시판에 글쓰기');

SELECT * FROM tbl_bbs;

CREATE TABLE tbl_images (
    i_seq NUMBER PRIMARY KEY,
    i_bseq NUMBER  NOT NULL,
    i_originalName VARCHAR2(255) NOT NULL,
    i_imageName VARCHAR2(255)	NOT NULL
);

DROP table tbl_images;

SELECT * FROM tbl_images;
        
CREATE SEQUENCE seq_image 
INCREMENT BY 1 START WITH 1;

drop SEQUENCE seq_image;

SELECT * FROM tbl_bbs, tbl_images
WHERE b_seq = i_bseq;

DELETE FROM tbl_books WHERE isbn = 9791136214102;

select

    constraint_name,

    table_name,

    r_constraint_name

from

    user_constraints

where

    constraint_name = 'FK_BOOK_USER';
    
    drop table tbl_books;
    
    drop table tbl_shopping;
    
    drop table tbl_movie;
    
    select * from tbl_books;