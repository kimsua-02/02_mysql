-- build in funcitions

-- ASCII
select ascii('A');

-- concat
select concat("호랑이","기린","토끼");
select concat_ws(", ", "호랑이","기린","토끼"); -- 구분자를 지정해 줄 수 있다.

-- elt : 해당 위치의 문자열 반환
select elt(2,"사과","딸기","바나나");

-- field : 찾을 문자열 위치 반환
select field("딸기","사과","딸기","바나나");

-- format(슷자,소수점 자릿수)
select format(1231234124.5678, 3);

-- 2진수, 8진수, 16진수
select bin(65), oct(65), hex(65);

-- insert(기존 문자열, 위치, 길이, 삽입할 문자열)
select insert("내 이름은 홍길동입니다.",7,3,"김수아");

-- left, right
select left("hello world~",3), right("hello world~",3);

-- lower, upper (소문자, 대문자)

-- trim - (공백 제거)

-- repeat(문자열, 횟수)
select repeat("mysql",3);

-- replace(문자열, 찾을 문자열, 바꿀 문자열)
select replace("마이sql","마이","my");


-- reverse(문자열)
select reverse("stressed");

-- substring(문자열, 시작위치, 길이)
select substring("안녕하세요 반갑습니다",7,2);