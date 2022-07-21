-- root 화면
-- root는 oracle의 sys와 같은 역할
/*
mySQL 사용자와 DB(Data 저장소)의 관계가 연결이 아니다
오라클에서는 사용자에게 default Table Space를 지정하여
login(접속)을 하면 자동으로 기본 DB가 연결된다

사용자는 단순히 DB 서버에 접속하는 권한을 부여받을 뿐이고
어떤 DB를 사용 할 것인지 처음 시작 할 때 연결을 해줘야 한다
*/
-- DB 저장소 생성
CREATE DATABASE myDB;

create database schoolDB;

-- 일반 사용자 생성
/* 
MySQL은 전통적으로 root 사용자로 접속하여 DB를 관리한다
최근에는 root 사용자는 DB, USER 생성만을 담당하고
DB 관리는 일반 사용자들을 생성하여 실행하도록 권장한다
MySQL은 사용자를 생성 할 때 어떤 방법으로 접속 할 것인지를 명시해야한다
*/
-- localhost에서만 mySQL 서버 접속 가능
create USER 'jinwoo8420'@'localhost' identified BY '!Korea8080';
DROP USER 'jinwoo8420'@'localhost';

/*
MySQL은 사용자를 등록하면 그 사용자는 DBA 권한을 기본적으로 갖는다
MySQL을 실무에서 가장 많이 사용하는 버전은 5.7.x 이다
5.7 버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용 할 수 있다
8.x 버전은 사용자 권한이 좀 더 엄격해졌다
*/
-- 새로 등록한 사용자에게 DB에 접근 할 수 있는 권한 부여하기
GRANT ALL privileges ON mydb.* TO 'jinwoo8420'@'localhost';

GRANT ALL privileges ON schooldb.* TO 'jinwoo8420'@'localhost';

-- 권한 부여 후 적용
flush privileges;

-- user1은 모든 DB Schema에 접근 권한 부여
GRANT ALL privileges ON *.* TO 'user1'@'127.0.0.1';

GRANT ALL privileges ON *.* TO 'jinwoo8420'@'localhost';

CREATE USER 'user1'@'127.0.0.1' identified BY '!Korea8080';

-- 어디에서나 접속 할 수 있도록 범위를 지정하지 않는 사용자 등록
CREATE USER 'user2'@'*' identified BY '!Korea8080';

