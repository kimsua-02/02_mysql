-- SUBQUERIES
-- 다른 쿼리 내에서 실행되는 쿼리이다.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
WHERE
	category_code = (
		SELECT
			category_code
		 FROM tbl_menu
		WHERE menu_name = "민트미역국"
	);  -- where 로  menu_name 이 민트미역국인 category_code 는 4이다. 결과값이 4이므로 category_code 가 4인 것들을 다 불러온 것이다.
    
-- 서브쿼리를 이용한 메인쿼리
SELECT
	MAX(count)
 FROM
  (SELECT
	COUNT(*) AS 'count'
	FROM
	 tbl_menu
	GROUP BY category_code) AS countmenu;  -- 별칭을 지어주지 않으면 에러가 난다.
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu a
WHERE
	menu_price > (
		SELECT -- 서브쿼리 먼저 동작됨.
			AVG(menu_price)
		  FROM tbl_menu
		 WHERE category_code = a.category_code
	); -- 평균보다 높은 것 출력