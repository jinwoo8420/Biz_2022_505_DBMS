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