-- SET
-- 두 개 이상의 SELECT 문의 결과 집합을 결합하는데 사용한다.

-- UNION
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를 제거한 후 반환alter
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
WHERE category_code = 10
UNION    -- UNION ALL 을 하게되면 중복된 값이 다 나타나게 된다.(증복 값을 제거하지 않고 다 반환함.)
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
WHERE menu_price < 9000;

-- INTERSECT (굳이 필요하지는 X, INNER JOIN 을 사용하면 된다.)
-- EXCEPT    (굳이 필요하지는 X, LEFT JOIN 을 사용하면 된다.)

