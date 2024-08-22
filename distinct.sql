-- DISTINCT
-- 중복된 값을 제거하는데 사용된다. 컬럼에 있는 컬럼값들의 종류를 쉽게 파악할 수 있다.

-- 단일 컬럼 중복 제거
SELECT
	DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;
 
-- 다중 컬럼 중복 제거 (select 에 모든 중복 컬럼이 들어가있을 때 distinct 가 실행되어 중복 제거가 된다.)
SELECT DISTINCT
	category_code,
    orderable_status
  FROM tbl_menu;