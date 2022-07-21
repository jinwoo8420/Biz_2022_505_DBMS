 		CREATE TABLE tbl_memo (
		 	m_seq NUMBER PRIMARY KEY,
			m_author VARCHAR(25) NOT NULL,
			m_date VARCHAR(10) NOT NULL,
			m_time VARCHAR(10) NOT NULL,
			m_memo VARCHAR(40) NOT NULL,
			m_image VARCHAR(125)
		);
        
        drop table tbl_memo;
        
        SELECT * FROM tbl_memo;
        
        CREATE SEQUENCE seq_memo
        INCREMENT BY 1 START WITH 1;
        
        drop SEQUENCE seq_memo;
        
        SELECT seq_memo.NEXTVAL FROM DUAL;
        