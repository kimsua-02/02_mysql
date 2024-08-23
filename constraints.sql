-- constraints
-- 제약조건. 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 테이블 작성 시 각 컬럼에 값에 대한 제약조건을 설정할 수 있다.
-- 입력/수정하는 데이터에 문제가 없는 지 자동으로 검사해준다.
-- 종류 = primary key, not null, unique, check, foreign key

-- not null
-- null 값을 허용하지 않는 제약조건
-- 데이터를 입력 받을 때 꼭 들어가야 하는 내용.
drop table if exists user_notnull;
create table if not exists user_notnull(
	user_no int not null,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255)
)engine = InnoDB;

insert into user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
values
	(1,"user01","pass01","홍길동",'남',"010-1234-5678",null),
    (2,"user02","pass02","유관순",'여',"010-1111-1111","yu@gmail.com");
    
select * from user_notnull;
insert into user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
values
	(3,"user01",null,"홍길동",'남',"010-1234-5678",null);
    
-- unique
-- 중복값을 허용하지 않는 제약조건
drop table if exists user_unique;
create table if not exists user_unique(
	user_no int not null unique,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    unique (phone)
) engine = InnoDB;

insert into user_unique
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values
	(1,"user01","pass01","홍길동",'남자',"010-1234-5678",null),
    (2,"user02","pass02","유관순",'여자',"010-1111-2222",null);
    
select * from user_unique;

-- primary key
-- 테이블에서 한 행의 정보를 찾기위해 사용할 컬럼을 의미한다.
-- 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
-- not null + unique 제약조건을 가진다.
-- 한 테이블당 한 개만 설정할 수 있다.
-- 한 개의 컬럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있다.(복합키)

drop table if exists user_primarykey;

create table if not exists user_primarykey(
	user_no int,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    primary key (user_no)
) engine = InnoDB;

insert into user_primarykey
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values
	(1,"user01","pass01","홍길동","남","010-1111-2222",null),
    (2,"user02","pass02","유관순","여","010-3333-4444",null);
    
select * from user_primarykey;

insert into user_primarykey
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values
	(null,"user01","pass01","홍길동","남","010-1111-2222",null);
    
-- foreign key
-- 참조된 다른 테이블에서 제공하는 값만 사용할 수 있음.
-- foreign key 제약조건에 의해 테이블 간의 관계가 형성됨.
-- 제공되는 값 외에는 null 을 사용할 수 있음.
-- 설정되어 있는 경우에는 컬럼을 변경하지 못함.

drop table if exists user_grade;
create table if not exists user_grade(
	grade_code int not null unique,
    grade_name varchar(255) not null
)engine = InnoDB;

insert into user_grade
values
	(10,"일반회원"),
    (20,"우수회원"),
    (30,"특별회원");
    
select * from user_grade;

drop table if exists user_foreignkey1;
create table if not exists user_foreignkey1(
	user_no int primary key,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    grade_code int not null,
    foreign key(grade_code)
    references user_grade (grade_code)
)engine = innoDB;

-- describe user_foreignkey1;

insert into user_foreignkey1
	(user_no,user_id,user_pwd,user_name,gender,phone,email,grade_code)
values
	(1,"user01","pass01","홍길동","남","010-1111-2222",null,10),
    (2,"user02","pass02","유관순","여","010-1111-2222",null,20);
    
select * from user_foreignkey1;

insert into user_foreignkey1
	(user_no,user_id,user_pwd,user_name,gender,phone,email,grade_code)
values
	(3,"user01","pass01","홍길동","남","010-1111-2222",null,null);
    
    
-- delete, update 룰
drop table if exists user_foreignkey2;
create table if not exists user_foreignkey2(
	user_no int primary key,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    grade_code int,
    foreign key(grade_code)
    references user_grade (grade_code)
		on update set null
        on delete set null
)engine = InnoDB;

insert into user_foreignkey2
	(user_no,user_id,user_pwd,user_name,gender,phone,email,grade_code)
    
values
	(1,"user01","pass01","홍길동","님","010-1111-2222",null,10),
    (2,"user02","pass02","유관순","여","010-1111-2222",null,20);
select * from user_foreignkey2;


update user_grade
	set grade_code = 1
  where  grade_code = 10;


delete from user_grade
	where grade_code = 20;
    
select * from user_foreignkey2;


-- check
-- check 제약 조건 위반시 허용하지 않는 제약조건
drop table if exists user_check;
create table if not exists user_check(
	user_no int auto_increment primary key,
    user_name varchar(255) not null,
    gender varchar(3) check (gender in ('남','여')), -- gender 에 남 , 여 중에서만 나오게 함.
    age int check (age >= 19)
)engine = InnoDB;

insert into user_check
values
	(null,"홍길동","남",25),
    (null,"이순신","남",33);
    
select * from user_check;

insert into user_check
values (null,"안중근","남",17);


-- default
-- 컬럼에 null 대신에 기본값 적용
-- 컬럼 타입이 date 일 경우 - current_date 만 사용 가능
-- datetime 일 경우 - current_time, current_timestamp, now() 모두 가능
drop table if exists tbl_country;
create table if not exists tbl_country(
	country_code int auto_increment primary key,
    country_name varchar(255) default "한국",
    population varchar(255) default "0명",
    add_day date default (current_date()),
    add_time datetime default (current_time())
)engine = InnoDB;

insert into tbl_country
values (null,default,default,default,default);

select * from tbl_country;

