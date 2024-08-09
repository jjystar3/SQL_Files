-- 사람테이블에 기본키 추가 1
CREATE TABLE PERSON (
	LAST_NAME VARCHAR(5) PRIMARY KEY,
	FIRST_NAME VARCHAR(5),
	NICKNAME VARCHAR(10)
);

-- 사람테이블에 기본키 추가 2
CREATE TABLE PERSON (
	LAST_NAME VARCHAR(5),
	FIRST_NAME VARCHAR(5),
	NICKNAME VARCHAR(10),
	PRIMARY KEY (LAST_NAME)
);

-- 기본키 삭제하기
ALTER TABLE PERSON DROP PRIMARY KEY;

-- 다시 기본키 추가하기
ALTER TABLE PERSON ADD PRIMARY KEY (LAST_NAME);

-- 기본키의 제약사항
-- 1. NULL을 입력할 수 없음
-- 2. 중복된 값을 입력할 수 없음

INSERT INTO PERSON
VALUES
(NULL, '짱구', '아들');

INSERT INTO PERSON
VALUES
('신', '짱구', '아들'),
('신', '짱아', '딸');

-- 복합키 추가하기
CREATE TABLE PERSON (
	LAST_NAME VARCHAR(5),
	FIRST_NAME VARCHAR(5),
	NICKNAME VARCHAR(10),
	PRIMARY KEY (LAST_NAME, FIRST_NAME)
);
-- 같은 성을 가지더라도, 조합이 다르기 때문에 중복이 안됨
INSERT INTO PERSON
VALUES
('신', '짱구', '아들'),
('신', '짱아', '딸');

-- 테이블 생성 순서: 부모 > 자식
CREATE TABLE DEPT (
	DEPT_NO INT PRIMARY KEY COMMENT '부서번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명'
);

CREATE TABLE EMP (
	EMP_NO INT PRIMARY KEY COMMENT '직원번호',
	EMP_NAME VARCHAR(20) COMMENT '직원명',
	DEPT_NO INT COMMENT '소속부서',
	FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);

-- 외래키 삭제하기
ALTER TABLE EMP DROP FOREIGN KEY emp_ibfk_1;

-- 다시 외래키 추가
ALTER TABLE EMP 
ADD FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO);

-- 데이터 추가 순서: 부모 > 자식

INSERT INTO DEPT
VALUES
(1, '인사부'),(2, '연구부'),(3, '홍보부');

INSERT INTO EMP
VALUES
(1001, '정소화', 1),(1002, '김용욱', 2),(1003, '고명석', 3);

-- 부모 테이블에 없는 4번은 사용할 수 없음
INSERT INTO EMP
VALUES (1004, '김연아', 4);

-- 부서번호가 1번인 사원을 먼저 삭제해야함

DELETE
FROM EMP
WHERE DEPT_NO = 1;

DELETE
FROM DEPT
WHERE DEPT_NO = 1;

-- 데이터 삭제 순서: 자식 > 부모

DROP TABLE EMP;
DROP TABLE DEPT;

-- 테이블 삭제: 자식 > 부모




































