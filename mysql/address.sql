use myDB;

CREATE TABLE IF NOT EXISTS tbl_address (
 			a_seq		BIGINT			PRIMARY KEY AUTO_INCREMENT,
			a_name		VARCHAR(20)		NOT NULL,
			a_tel		VARCHAR(30),
			a_address 	VARCHAR(125)
);

/*
LIKE 연산자는 index도 작용이 안되고 full text 검사
전체 데이터를 처음부터 순서대로 비교하여 검색
WHERE 절에서 사용하는 연산자 중에 가장 성능이 낮다
*/
select * from tbl_address
where a_name like '%유';

select * from 
(
select * from tbl_address
where a_name like '%유%'
) as sub
limit 10 offset 0;

/*

select * from tbl_address
where a_name like concat('%',#{a_name},'%');

select * from tbl_address
where a_name like '%' || #{a_name} || '%';

select * from tbl_address
limit 10; => 입력 제한

select * from tbl_address
limit 10 offset 10; => offset 앞에서 부터 건너뛰고 출력

-- LIMIT의 OFFSET은 SELECT 명령문보다 먼저 실행된다
select * from tbl_address
where a_name = '%유%'
limit 10;

select * from 
(
select * from tbl_address
where a_name like '%유%'
) as sub
limit 10 offset 10;
*/

/*
DROP 후 CREATE
*/
truncate table tbl_address;

DELETE FROM tbl_address WHERE a_seq = 5;

drop table tbl_address;

select * from tbl_address;

select count(*) from tbl_address;

-- 검색 조건이 '' 일때 like 연산자는 검색 조건이 없다고 판단
select * from tbl_address
where a_name like '';

select * from(
select * from tbl_address
where a_name like concat('%','','%')
) as sub
limit 200 offset 0;
