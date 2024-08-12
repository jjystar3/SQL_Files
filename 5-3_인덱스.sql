CREATE TABLE BOARD (
	BOARD_NO INT AUTO_INCREMENT PRIMARY KEY,
	TITLE VARCHAR(200) NOT NULL,
	CONTENT VARCHAR(200)
);

SELECT COUNT(*) FROM BOARD; 

-- PK인 게시물번호로 검색
SELECT * FROM BOARD WHERE BOARD_NO = 1;

-- 제목으로 검색
EXPLAIN -- 쿼리가 어떤 인덱스를 쓰는지 확인
SELECT * FROM BOARD WHERE TITLE = 'Bus Stop';


-- 제목으로 인덱스 생성
CREATE INDEX INDEX_TITLE ON BOARD(TITLE);

-- 테이블에 걸려있는 인덱스 확인
SHOW INDEX FROM BOARD;

-- 인덱스의 장점: 조회속도가 빠름
-- 인덱스의 단점: 추가, 수정속도가 느려짐

-- 조회가 자주 일어나는 테이블에 사용할 것
-- 반대로, 추가가 자주 일어나는 테이블에는 사용하지 말 것

-- 인덱스 삭제
DROP INDEX INDEX_TITLE ON BOARD;




