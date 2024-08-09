
CREATE TABLE STORE1 (
    PRODUCT  VARCHAR(20),
    PRICE   INT
);
INSERT INTO STORE1 
VALUES 
('소주',4000),
('맥주',5000),
('와인',20000);
CREATE TABLE STORE2 (
    PRODUCT  VARCHAR(20),
    PRICE   INT
);
INSERT INTO STORE2 
VALUES 
('소주',4000),
('맥주',5000),
('위스키',50000);

-- 두 슈퍼의 제품을 모두 가져오기
SELECT *
FROM STORE1
UNION ALL
SELECT *
FROM STORE2;

-- 중복을 제거하고 두 슈퍼의 제품을 모두 가져오기
SELECT *
FROM STORE1
UNION
SELECT *
FROM STORE2;

-- Q1
SELECT B.BOOK_NO AS '제품번호' , CONCAT('(책)', B.TITLE) AS '제품명', IFNULL(B.PRICE, 0) AS '가격'
FROM BOOK B
UNION ALL
SELECT P.PRODUCT_NO, CONCAT('(', P.CATEGORY, ')', P.PRODUCT_NAME) , P.PRICE
FROM PRODUCT P
WHERE P.CATEGORY = '과자';

-- 테이블 구조 보기
DESC PRODUCT;