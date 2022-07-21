use schoolDB;

create table tbl_student (
	st_num		VARCHAR(5)	PRIMARY KEY,
	st_name		VARCHAR(20)	NOT NULL,
	st_dept		VARCHAR(20),
	st_grade	INT,
	st_tel		VARCHAR(15)	NOT NULL,
	st_addr		VARCHAR(125)
);

select * from tbl_student;

select count(*) from tbl_student;

truncate table tbl_student;

create table tbl_subject(
	sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
	sb_name	VARCHAR(25)	NOT NULL
);

select * from tbl_subject;

select count(*) from tbl_subject;

truncate table tbl_subject;

create table tbl_score(
	sc_seq		BIGINT		PRIMARY KEY AUTO_INCREMENT,
	sc_stnum	VARCHAR(5)	NOT NULL,
	sc_sbcode	VARCHAR(5)	NOT NULL,
	sc_score	INT,
    UNIQUE(sc_stnum, sc_sbcode)
);

select * from tbl_score;

select count(*) from tbl_score;

truncate table tbl_score;

-- 과목 코드 별 총점
SELECT sc_sbcode as 과목코드, SUM(sc_score) as 총점
FROM tbl_score
GROUP BY sc_sbcode
order by sc_sbcode;

-- 과목 코드 별 총점 및 평균
SELECT sc_sbcode as 과목코드, SUM(sc_score) as 총점, AVG(sc_score) as 평균
FROM tbl_score
GROUP BY sc_sbcode
order by sc_sbcode;

-- 70점 이하 학번 순 정렬
SELECT sc_stnum, sc_sbcode, sc_score
FROM tbl_score
where sc_score <= 70
order by sc_stnum, sc_sbcode;

-- 과목 코드, 점수만 표시
SELECT sc_sbcode, sc_score
FROM tbl_score
order by sc_sbcode;

-- 50점 이상 70점 이하인 과목 코드, 점수만 표시 
SELECT sc_sbcode, sc_score
FROM tbl_score
where sc_score <= 70 AND sc_score >= 50
order by sc_sbcode;

SELECT sc_sbcode, sc_score
FROM tbl_score
where sc_score between 50 and 70
order by sc_sbcode;

-- 50점 이상 70점 이하인 과목명, 과목 코드, 점수 tbl_subject와 연결하여 표시
SELECT SB.sb_name as 과목명, SC.sc_sbcode as 과목코드, SC.sc_score as 점수
	FROM tbl_score SC
		left join tbl_subject SB
			on SB.sb_code = SC.sc_sbcode
where SC.sc_score between 50 and 70
order by SC.sc_sbcode;

-- 50점 이상 70점 이하인 
-- 학번, 학생 이름, 과목명, 과목 코드, 점수 tbl_subject, tbl_student와 연결하여 학번 순 표시
SELECT ST.st_num as 학번, ST.st_name as 학생이름, SB.sb_name as 과목명, SC.sc_sbcode as 과목코드, SC.sc_score as 점수
	FROM tbl_score SC
		left join tbl_subject SB        
			on SB.sb_code = SC.sc_sbcode
		left join tbl_student ST
			on ST.st_num = SC.sc_stnum
where SC.sc_score between 50 and 70
order by ST.st_num;

-- 과목 별 총점 및 평균
SELECT SB.sb_name as 과목명, SC.sc_sbcode as 과목코드, SUM(SC.sc_score) as 총점, AVG(SC.sc_score) as 평균
	FROM tbl_score SC
		left join tbl_subject SB
			on SC.sc_sbcode = SB.sb_code
GROUP BY SC.sc_sbcode, SB.sb_name
order by SC.sc_sbcode;

-- 학생 별 총점 및 평균 학번 순으로 정렬
select ST.st_num as 학번, ST.st_name as 학생이름, sum(SC.sc_score) as 총점, avg(SC.sc_score) as 평균
	from tbl_score SC
		left join tbl_subject SB
			on SC.sc_sbcode = SB.sb_code
		left join tbl_student ST
			on SC.sc_stnum = ST.st_num
GROUP BY ST.st_num
order by ST.st_num;