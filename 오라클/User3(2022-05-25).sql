-- user3 화면

DROP TABLE tbl_student;
DROP TABLE tbl_dept;
DROP TABLE tbl_belong;

DROP TABLE tbl_student cascade CONSTRAINTS;
DROP TABLE tbl_dept cascade CONSTRAINTS;
DROP TABLE tbl_belong cascade CONSTRAINTS;

CREATE TABLE tbl_student (
    ST_NUM	    VARCHAR2(8)	    PRIMARY KEY,
    ST_NAME	    NVARCHAR2(15)	NOT NULL,
    ST_GRADE	NUMBER(1,0),
    ST_TEL	    VARCHAR2(15),
    ST_ADDR	    NVARCHAR2(255)
);

CREATE TABLE tbl_dept (
    D_CODE	VARCHAR2(5)	    PRIMARY KEY,
    D_NAME	NVARCHAR2(20)	NOT NULL,
    D_PRO	NVARCHAR2(15),
    D_CLASS	VARCHAR2(5)
);

CREATE TABLE tbl_belong (
    B_SEQ	NUMBER      PRIMARY KEY,
    B_STNUM	VARCHAR2(8)	NOT NULL,
    B_DCODE	VARCHAR2(5)	NOT NULL,
    UNIQUE(b_stnum,b_dcode)
);

-- 학생정보 샘플데이터 추가
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220001', '김철수', '1');
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220002', '이철수', '3');
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220003', '박철수', '2');

-- 학과정보 샘플데이터 추가
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0001', '컴퓨터공학과', '강철수', '503');
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0002', '체육과', '임철수', '501');
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class) VALUES ('D0003', '법학과', '백철수', '502');

--소속정보 샘플데이터 추가
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (1, '20220001', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (2, '20220002', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (3, '20220003', 'D0003');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (4, '20220001', 'D0004');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (5, '20220002', 'D0005');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES (6, '20220003', 'D0006');

/*
테이블에 일련번호 컬럼이 있을 경우
중복되지 않은 일련번호를 사용하여 PK로 설정한다
오라클 이외의 다른 DBMS에서는 AUTO INCREMENT라는 속성을 사용하여
데이터를 INSERT 할 때 자동으로 칼럼 데이터를 추가한다
하지만 오라클은 그러한 속성이 없어서 상당히 불편하다

오라클에서는 SEQUENCE라는 특별한 객체가 있어서
그 객체를 사용하여 같은 효과를 발휘한다

또는 PK에 해당하는 칼럼을 문자열 32byte 크기로 설정하고
UUID를 사용하기도 한다
프로그래밍 언어(Java, C, Python : 호스트 언어)와 함께
프로젝트를 할 때는 UUID를 사용한다
*/

-- seq_belong이라는 SEQUENCE 객체를 생성하고 시작값을 1로 자동 증가 옵션을 1로 설정
CREATE SEQUENCE seq_belong
INCREMENT BY 1 START WITH 1;

-- seq_belong SEQUENCE의 NEXTVAL 값을 조회(SELECT)
-- NEXTVAL 값은 호출(SELECT 등) 할 때 마다 항상 1 증가
SELECT seq_belong.NEXTVAL FROM DUAL;

-- 표준 SQL에서 간단한 4칙연산을 수행하는 방법
SELECT 10 * 20 FROM DUAL;
SELECT 100 * 10 FROM DUAL;
SELECT 100 - 10 FROM DUAL;
SELECT 50 / 20 FROM DUAL;
-- 오라클에서는 SELECT 명령문이 FROM 없이 수행하는 것이 불가능하므로 DUMY TABLE인 DUAL을 사용

-- SEQUENCE를 사용하여 자동 증가하는 SEQ를 만들고 INSERT에서 사용
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(seq_belong.NEXTVAL, '20220003', 'D0004');

INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(seq_belong.NEXTVAL, '20220003', 'D0007');

SELECT * FROM tbl_belong;

-- tbl_student, tbl_dept, tbl_belong 3개의 TABLE LEFT JOIN 하여
-- 학번, 이름, 학과코드, 학과명, 학년을 표시하는 SELECT 문 작성
SELECT ST.st_num, ST.st_name, B.b_dcode, D.d_name, ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode = D.d_code
ORDER BY st_num;

SELECT ST.st_num, ST.st_name, B.b_dcode, D.d_name, ST.st_grade
FROM tbl_student ST, tbl_belong B, tbl_dept D
WHERE ST.st_num = B.b_stnum AND B.b_dcode = D.d_code;

-- 학생, 학과, 소속 TABLE간에 FK 설정하기
-- 1. FK 설절하기 앞서 참조무결성 관계 조회
-- 다음의 SQL의 결과에서 한개도 없어야 참조무결성 관계가 성립된다
SELECT ST.st_num, ST.st_name, B.b_seq, B.b_dcode, D.d_name, ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode = D.d_code
WHERE ST_NUM IS NULL OR D_NAME IS NULL;
-- 위에 SQL 결과 참조무결성이 성립되지 않는 데이터들은
-- 4, 5, 6, 7, 8의 seq 값을 갖고있다

-- 2. 참조무결성이 성립되지 않은 데이터를 삭제
DELETE FROM tbl_belong
WHERE b_seq IN(4, 5, 6, 24, 25);

SELECT b_seq, b_stnum, b_dcode, st_num, d_name
FROM tbl_belong
    LEFT JOIN tbl_student
        ON b_stnum = st_num
    LEFT JOIN tbl_dept
        ON b_dcode = d_code
WHERE st_num IS NULL OR d_name IS NULL;

-- 3. TABLE 같의 참조무결성 제약 조건 부여
-- 참조무결성 제약 조건을 TABLE에 추가하는데
-- 이때는 Relation TABLE에 추가한다

-- TABLE에 FK를 추가하여 참조무결성 제약 조건을 부여
ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_student
FOREIGN KEY (b_stnum)
REFERENCES tbl_student (st_num);

ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_dept
FOREIGN KEY (b_dcode)
REFERENCES tbl_dept(d_code);

SELECT * FROM tbl_student;

/*
20220001	김철수	1
20220002	이철수	3
20220003	박철수	2		
*/

SELECT * FROM tbl_dept;

/*
D0001	컴퓨터공학과	강철수	503
D0002	체육과	임철수	501
D0003	법학과	백철수	502
*/

SELECT * FROM tbl_belong;

/*
1	20220001	D0001
2	20220002	D0002
3	20220003	D0003
*/

SELECT * FROM tbl_dept;

-- 
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(seq_belong.NEXTVAL, '20220004','D0003');

-- 먼저 tbl_studetn에 해당 학번의 학생정보를 추가해둬야한다
-- tbl_student에 아래 데이터를 추가한 후 다시 위에 SQL을 실행하면 정상추가
INSERT INTO tbl_student(st_num,st_name, st_grade)
VALUES('20220004','한철수', 2);

-- FK를 설정 할 때 parent table의 데이터를 삭제하려고 할 때  child TABLE에 데이터가 있으면 보통 삭제 금지
-- 
DELETE FROM tbl_student WHERE st_num= '20220004'

ALTER TABLE tbl_belong



