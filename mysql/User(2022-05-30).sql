-- jinwoo8420 화면
/*
MySQL은 DB와 관련된 명령을 실행 할 때
가장 먼저 어떤 DB를 사용 할 것인지 알려줘야 한다
*/
USE mydb;

CREATE TABLE tbl_test(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    t_name VARCHAR(30)
);

DROP TABLE tbl_test;

/*
DBMS중에서 가장 많이 사용하는 oracle과 함께 MySQL을 사용하는데
MySQL에서 사용하는 방식이 DBMS의 업계표준으로 정착이 된 상태

대부분의 DBMS들은 먼저 Database를 생성하고 사용자가 Database에 접근 할 수 있는
권한을 부여하고 사용자는 Database를 사용하겠다 라고 선언을 한 후
DB 관련된 명령을 사용한다
*/

INSERT INTO tbl_test( t_name )
VALUES ('김철수');

select * from tbl_test;

-- 다중데이터 INSERT
INSERT INTO tbl_test( t_name )
VALUES ('이철수'),('박철수'),('한철수'),('임철수'),('강철수');

/*
tbl_test의 ID 칼럼은 AUTO_INCREMENT로 설정되었기 때문에
데이터를 INSERT 할 때마다 자동으로 Sequence 값이 생성되어 추가된다

5.x MySQL에서는 AUTO_INCREMENT 칼럼에 이슈가 있었다
5.x 숫자 type은 주로 INT 형을 사용하는데 INT 형은 정수 11자리이다
그래서 정수형 11자리 범위를 벗어나는 경우 데이터 INSERT가 불가능해지는 문제가 있었다
5.7 버전 이후에는 BIGINT형 타입이 도입되어 문제를 해결하였다
DB table을 만들때 AUTO_INCREMENT 칼럼에는 반드시 BIGINT형을 지정

MySQL 숫자형 데이터 타입
TINYINT : 1Byte : -128 ~ 127
SMALLINT : 2Byte : -32768 ~ 23762
MEDIUMINT : 3Byte : 0 ~ 16777215, -8388608 ~ 8388607
INT : 4Byte : -217483648 ~ 214783647
BIGINT : 8Byte : -2의 7승-1 ~ 2의 7승

AUTO_INCREMENT 칼럼을 만들때 주의 할 점
데이터 타입은 BIGINT로 설정
가급적 PRIMARY KEY로 설정
PK가 아닌 경우는 반드시 NOT NULL과 UNIQUE를 같이 설정
PK 또는 NOT NULL and UNIQUE 설정이 되지 않았을 경우 Table 생성에서 오류가 난다
*/

CREATE TABLE tbl_student (
	ST_NUM	VARCHAR(5) PRIMARY KEY,
	ST_NAME	VARCHAR(20),
	ST_DEPT	VARCHAR(10),
	ST_GRADE	INT,
	ST_TEL	VARCHAR(15),
	ST_ADDR	VARCHAR(125)
);

DROP TABLE tbl_student;

Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0001','갈한수','기계공학',2,'090-4407-3262','경북 경산시 사정동 278-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0002','강이찬','유전공학',1,'090-4733-4976','경기도 남양주시 별내동 192-23');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0003','개원훈','기계공학',4,'090-4696-8657','광주광역시 북구 일곡동 830-1번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0004','경시현','국사학전공',2,'090-2669-6066','경기도 이천시 마장면 목리 산13-32');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0005','공동영','물리화학',3,'090-4660-6621','충청북도 진천국 진천읍 읍내리395-7');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0006','기대연','사학과',1,'090-3153-8403','인천 서구 경서동 626-8번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0007','기원호','국사학전공',1,'090-3633-6768','울산 남구 삼산동 1497-1번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0008','기은성','심리학',3,'090-6114-7480','경상북도 경주시 천군동 산 30-1 블루월리조트');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0009','나한율','유전공학',1,'090-6819-6025','인천광역시 서구 마전동 909-8 번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0010','남동예','영어영문',2,'090-4674-7619','경기도 용인시 기흥구 언남동 412-4번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0011','낭시우','동양사학과',3,'090-4918-6794','수원시 영통구 이의동 1325-3');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0012','내세원','심리학',4,'090-4493-8160','울산광역시 울주군 언양읍 동부리 166번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0013','뇌성수','국사학전공',2,'090-3885-8875','제주시 이호2동 22번지 S중앙병원');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0014','단수혁','항공공학',1,'090-4879-3913','경기도 김포시 운양동 5705-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0015','담성민','물리화학',2,'090-6665-8311','경남 양산시 물금읍 화합길 37번지 (107,109,110호)');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0016','담원준','전자공학',2,'090-2855-4806','대구광역시 동구 지묘동 192번지 1F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0017','담장호','역사문화학과',2,'090-6445-2804','전남 광주시 북구 신용동 694번지 토담빌딩 1~2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0018','독고예준','항공공학',4,'090-6434-6602','경기도 화성시 석우동 31-3번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0019','돈송혁','건축공학',3,'090-5451-6104','경기도 수원시 영통구 월드컵로 42번길 광교에일린의뜰 1204동 B113~B115');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0020','돈재현','인공지능 SW',4,'090-6267-8378','강원도 춘천시 백령도 156번지 강원대병원 1F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0021','두동환','인공지능 SW',4,'090-5620-4275','인천시 남동구 논현동 637-2번지 코아루파크 1F?');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0022','두채훈','국사학',2,'090-6566-7227','인천시 남동구 논현동 679-3');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0023','명윤일','역사문화학부',2,'090-2645-7606','경기도 안성시 원곡면 산하리 산 68-7');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0024','모재원','심리학',3,'090-5009-5550','경남 김해시 어방동 1088-7');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0025','문은진','역사문화학과',1,'090-4786-4279','강원도 속초시 대포동 956-5');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0026','박수혁','상담학',3,'090-8753-6349','경북 영천시 문외동 38-3번1,2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0027','방윤후','국사학전공',2,'090-3885-8793','서울시 구로구 구로동 3-35번지 1F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0028','방채호','유전공학',3,'090-7725-8377','강원도 동해시 천곡동 1077-3');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0029','배세준','유전공학',2,'090-6839-7498','대구 수성구 수성3가 322-1번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0030','배채호','건축공학',3,'090-8079-7869','울산시 울주군 서생면 간절곶해안길 205 울주군특산물판매장 2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0031','변재호','컴퓨터공학',1,'090-6930-3705','거제시 장승포동 702-4');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0032','복재민','사학과',1,'090-7999-7279','경기도 이천시 창전동 166-13번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0033','복준완','역사문화학과',1,'090-4801-3270','경남 밀양시 내일동 649-7다복빌딩 1,2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0034','비현호','상담학',2,'090-7747-5180','경기도 파주시 문산읍 문산리 61-35번지 1,2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0035','빈성희','자연과학',1,'090-7389-6050','충북 증평군 증평읍 창동리 65번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0036','사성준','물리화학',3,'090-4236-8632','제주시 연동 1482번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0037','사원혁','일어일문',4,'090-7803-7980','울산시 남구 옥동 143-12');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0038','사원호','사학과',3,'090-2550-6900','강원도 속초시 중앙로 150-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0039','삼윤후','물리화학',3,'090-8892-6166','전남 나주시 대호동 1029-2');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0040','삼찬후','건축공학',2,'090-8121-6030','경북 구미시 옥계동 840번지 경북프라자 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0041','석서훈','역사문화학과',2,'090-4735-8521','경기도 이천시 신둔면 용면리');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0042','성성율','인공지능 SW',2,'090-4281-8070','충북 충주시 가금면 용전리');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0043','소대권','건축공학',4,'090-3432-3377','제주특별자치도 서귀포시 대정읍 상모리 133-8 번지외1필지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0044','소윤수','일어일문',2,'090-2024-3706','경기도 파주시 금촌동 987-6번지 혜인빌딩 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0045','순대영','물리화학',3,'090-8062-2176','제주 공항로 2가 여객청사 1층 1번 대합실');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0046','신찬영','국사학과',2,'090-6968-2306','서울시 강서구 화곡동 1006-9');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0047','심장호','기계공학',3,'090-4269-3660','서울시 강서구 가양동 1479-9');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0048','아동은','건축공학',2,'090-8824-3371','인천시 서구 검암동 606-7');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0049','야유신','동양사학과',4,'090-5028-4236','경기도 화성시 능동 445-2외 10필지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0050','양동인','물리화학',3,'090-7649-3582','경기도 고양시 일산동구 장항동 868 웨스턴돔 B동 108호, 208호');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0051','양은성','동양사학과',4,'090-6743-3463','서울시 관악구 신림동 1640-3 2,3,4F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0052','어민기','일어일문',4,'090-3934-3909','경기도 양평군 양평읍 양근리 201-15');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0053','엄은진','역사문화학과',1,'090-7457-7904','대구시 동구 율하동 1223');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0054','여동은','전자공학',4,'090-5718-5955','전북 부안군 변산면 격포리 290-1 채석강 국립공원 내 바다호텔 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0055','여민국','기계공학',2,'090-3616-5665','강원도 원주시 행구동 1847-3');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0056','연연재','물리화학',1,'090-3242-8364','충남 아산시 배방읍 복수리 1019');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0057','옥원준','컴퓨터공학',1,'090-3151-2527','울산시 동구 서부동 113-48');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0058','옥채훈','전자공학',2,'090-3752-8845','경기도 화성시 봉담읍 동화리 113-1번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0059','옹효성','인공지능 SW',4,'090-4898-3637','경남 창원시 대방동 자양로 136');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0060','운윤태','건축공학',2,'090-3301-4952','서울시 도봉구 쌍문동 45-8 1F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0061','원성빈','심리학',4,'090-5797-4124','경남 창원시 진해구 이동 464-2번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0062','유민국','국어국문',4,'090-4602-3320','인천시 연수구 동춘동 926번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0063','유성율','고고학과',2,'090-7290-7486','경북 경주시 성건동 684-9번지 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0064','유준호','역사문화학부',2,'090-4924-7920','전남 구례군 산동면 좌사리 110-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0065','은채혁','영어영문',4,'090-8743-7153','서울시 강북구 미아동 838-4번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0066','은현준','컴퓨터공학',1,'090-2296-2336','경기도 성남시 분당구 삼평동 741');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0067','이윤진','일어일문',1,'090-4475-5253','경남 김해시 장유면 관동리 1101-1번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0068','전동원','컴퓨터공학',2,'090-8571-2476','경기도 과천시 막계동 33 서울랜드 정문');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0069','점재민','건축공학',4,'090-3113-2449','충남 아산시 배방읍 장래리 1760 1층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0070','제갈동연','인공지능 SW',3,'090-4227-7958','광주시 서구 치평동 1223-3.4');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0071','제동희','일어일문',4,'090-3610-5611','경기도 파주시 동패동 56 형성프라자 1층 113호');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0072','제민기','인공지능 SW',4,'090-2960-5373','경기도 일산시 서구 대화동 2606');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0073','제영후','국어국문',3,'090-5476-2730','광주시 남구 진월동 259번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0074','제유상','자동차공학',4,'090-3087-3175','부산시 동래구 명륜동 569-12');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0075','지승현','우주항공학',2,'090-3239-3345','전북 김제시 검산동 844');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0076','진대원','국사학',3,'090-6045-3539','경기도 용인시 처인구 김량장동 23-1번지 용인터미널 내');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0077','진대윤','건축공학',4,'090-5239-7681','충남 천안시 석북구 백석동 878번지 1F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0078','진동혜','전기공학',4,'090-5759-6824','경기도 수원시 권선구 금곡동 572-5');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0079','진승우','사학과',3,'090-6443-8711','서울시 영등포구 여의도동 23번지 ifc몰 국제금융센터');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0080','진승일','영어영문',1,'090-8241-7728','강원도 원주시 문막읍 동화리 113번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0081','진승환','고고학과',1,'090-8351-4472','서울시 광진구 구의동 611번지 강변상가1,2층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0082','초시민','자동차공학',1,'090-5459-5325','충남 공주시 중동 67-3번지 1,2F');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0083','초원혁','전기공학',2,'090-5295-7970','인천시 서구 마전동 621-5');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0084','초재현','영어영문',1,'090-6974-5154','울산시 동구 서부동 315-34 2/3층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0085','최장현','일어일문',2,'090-2160-6861','경기도 수원시 천천동 528-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0086','춘대권','건축공학',2,'090-4708-5819','충남 공주시 신관동 191-7번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0087','춘인규','건축공학',2,'090-6264-7241','경기도 안산시 상록구 본오동 874-11');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0088','춘찬영','상담학',2,'090-8016-7007','충남 아산시 탕정면 명암리 931-1');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0089','판한수','유전공학',4,'090-2971-8476','대전시 서구 도안동 963번지');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0090','평윤섭','영어영문',4,'090-7581-2785','전남 여수시 종화동 470');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0091','풍동해','사학과',1,'090-7800-5242','인천시 송도 커넬워크 3동 1층 156호');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0092','피태영','역사문화학과',4,'090-6252-4861','울산시 중구 태화동 593-17');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0093','필영후','전자공학',2,'090-6019-4506','경기도 고양시 일산구 주엽2동 22번지 지하2층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0094','하재찬','자연과학',1,'090-7850-3152','경기도 용인시 기흥구 보라동 579-2');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0095','함민서','항공공학',3,'090-3335-5845','부산시 해운대구 좌동 1270-5 103호');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0096','해송혁','상담학',4,'090-6823-5528','경북 경주시 천군동 206-3');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0097','허시후','자동차공학',1,'090-3230-8481','경기도 남양주시 별내면 화점리 58-65');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0098','황원혁','건축공학',1,'090-5872-7618','충남 천안시 불당동 아산신도시 펜타포트점 B2');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0099','흥동현','고고학과',3,'090-7681-7632','부산시 연제구 연산동728-1번지 1,2,3층');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0100','흥은성','자동차공학',4,'090-8955-5687','경기도 가평군 청평면 대성리 399-103');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0101','김철수','컴퓨터공학',3,'010-1111-1111','경기도');
Insert into TBL_STUDENT (ST_NUM,ST_NAME,ST_DEPT,ST_GRADE,ST_TEL,ST_ADDR) values ('S0102','이철수','컴퓨터공학',3,'010-2222-4444','경상도');

select * from tbl_student;


