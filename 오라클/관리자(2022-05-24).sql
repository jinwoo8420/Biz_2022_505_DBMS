-- 관리자 화면
-- TableSpace 생성하기
-- 이름 : iolist
-- 데이터파일(물리적 저장소) : C:/oraclexe/tada/iolist.dbf
-- 초기크기 : 1MB
-- 용량이 부족 할 경우 : 자동증가 1KB 씩

CREATE TABLESPACE iolist
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- TableSpace 삭제
DROP TABLESPACE iolist
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- 사용자 생성
-- username : user3, password : 1234
-- defalut tablespace
CREATE USER user3 IDENTIFIED BY 12341234
DEFAULT TABLESPACE iolist;

-- 사용자 계정 완전 삭제하기
DROP USER user3 CASCADE;

/*
사용자 등록을 완료했으나 현재는 아무 일도 할 수 없는 상황
사용자에게 DB 연결, 조회, 추가. 삭제. 변경 등을 할 수 있는 권한을 부여해야 한다
원칙은 권한을 세세하게 부여하여 불필요한 권한을 갖지 않도록 해야 하지만
학습상 불편함이 있어서 DBA 권한을 부여 할 것
*/
Grant DBA TO user3; -- 권한 부여
REVOKE DBA FROM user3; -- 권한 회수

