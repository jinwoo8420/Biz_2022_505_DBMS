/*
tbl_books와 tbl_users 테이블이 있다
만약 사용자가 로그인 한 상태에서 도서정보를 추가하면
네이버에서 도서정보를 검색하고 기존에 도서가 tbl_books에 
있으면 update를 수행하고 없으면 새로 insert를 수행

그리고 어떤 사용자가 도서를 추가했는지를 table에 데이터로 저장하고
로그인 한 사용자의 mypage에서 자신이 추가한 도서 목록 확인

도서정보와 사용자간의 도서구입 정보를 저장 할 Relation 설계하기
tbl_buybooks
isbn, username, 구입일자
isbn은 tbl_books와 FK
username은 tbl_users와 FK
*/

DESC tbl_books;
DESC tbl_users;

CREATE TABLE tbl_buybooks(
    b_isbn      VARCHAR2(13) NOT NULL,
    b_username  VARCHAR2(20) NOT NULL,
    b_date      VARCHAR2(10),
    PRIMARY KEY(b_isbn, b_username)
);

DROP TABLE tbl_buybooks;

-- tbl_books table과 fk 설정
ALTER TABLE tbl_buybooks
ADD CONSTRAINT FK_BOOK_USER
FOREIGN KEY (b_isbn) REFERENCES tbl_books(isbn);

ALTER TABLE tbl_buybooks
ADD CONSTRAINT FK_BUYER_USER
FOREIGN KEY (b_username) REFERENCES tbl_users(username);

SELECT * FROM tbl_books;
SELECT * FROM tbl_buybooks;











