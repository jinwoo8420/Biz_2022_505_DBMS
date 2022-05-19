CREATE TABLE tbl_api (
	totalPage	    NUMBER(4),
    pageNo	        NUMBER(4),
    resultCode	    NUMBER(2),
    totalCount	    NUMBER(4),
    numOfRows	    NUMBER(4),
    resultMsg	    nVARCHAR2(50),
    api_id	        NUMBER(20) PRIMARY KEY,
    tourDestNm	    VARCHAR2(300),
    operationRuleNm	VARCHAR2(30),
    lat	            VARCHAR2(50),
    lng	            VARCHAR2(50),
    tourDestIntro	VARCHAR2(1000),
    mngAgcTel	    VARCHAR2(15),
    mngAgcNm	    VARCHAR2(30),
    syncTime	    VARCHAR2(20)
);