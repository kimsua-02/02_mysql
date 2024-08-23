-- sql 형변환
-- 명시적 형변환과 암시적 형변환이 있다.

-- 명시적 형변환

-- cast
-- convert -- mysql 에서 제공해주는 것. 다른 프로그램에서는 없을 수 있다.

select avg(menu_price) from tbl_menu;
select cast(avg(menu_price) as signed integer) as "평균메뉴가격" from tbl_menu;

select
	convert(avg(menu_price), signed integer) as "평균 메뉴 가격" from tbl_menu;
    
-- 가능한 데이터 형식
-- binary, char, date, datetime, decimal, json, time, integer


select
	cast("2023$5$30" as date),
    cast("2023/5/30" as date),
    cast("2023%5%30" as date),
    cast("2023@5@30" as date);
    
-- 메뉴 가격 구하기
select
		concat(cast(menu_price as char(5)), "원")
  from
	tbl_menu;
    
-- 카테고리 별로 메뉴 가격의 합계를 구해서
-- ( 카테고리코드 ~~원 ) 으로 표시해주세요.
select
	category_code,
	concat(cast(sum(menu_price)as char(10)),"원") as "가격 합계"
from
	tbl_menu
group by
	category_code;

-- 암시적 형변환
-- 자동으로 내부에서 이루어지는 형변환
select '1' + '2'; -- 각 문자가 정수로 반환됨.
select concat(menu_price, "원") from tbl_menu; -- 문자로 변환
select 3 > "texi"; -- 문자는 0으로 변환
select 3 > "4texi";-- 숫자가 맨 앞에 있을 때는 정수로 변환되어 false 가 됨.

-- 1 : true / 0 : false