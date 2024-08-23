-- ddl(Date Definition Language)
-- 데이터베이스의 ㅅ스키마를 정의하거나 수정하는데 사용되는 sql의 한 부분이다.
-- 스키마 = 데이터베이스

-- cretae - 테이블 생성을 위한 구문

-- tbl 테이블 생성
create table if not exists tb1(
		-- 컬럼명, 자료형, 제약조건
        pk int primary key,
        fk int,
        col1 varchar(255)
        check (col1 in ('Y','N'))
)engine = InnoDB;
-- innodb : 트랜잭션 기능을 제공해 동시성과 무결성을 높이고
-- 복구 기능을 지원해 시스템이 예기치 않게 중단되더라도 데이터의 일관성을 보장한다.
-- MyISAM, NDB Cluster

-- 테이블 구조 확인
describe tb1;

INSERT INTO tb1 VALUES(1,10,'Y');
INSERT INTO tb1 VALUES(2,null,'Y');

SELECT * FROM tb1;

-- auto_increment
-- insert 시에 컬럼에 자동으로 번호를 발생시킴(중복되지 않게)

create table if not exists tb2(
	pk int auto_increment primary key,
    kf int,
    col1 varchar(255)
    check(col1 in ('Y','N'))
) engine = InnoDB;

insert into tb2 values(null,10,'Y');
insert into tb2 values(null,20,'Y');

select * from tb2;

-- alter 테이블에 추가/변경/수정/삭제 하는 모든 것은 alter 명령어를 적용한다.
-- 종류가 많아 대표적인 것들만 살펴본다.

-- 열 추가(테이블에 컬럼 추가)
alter table tb2
add col2 int not null;

describe tb2;

-- 열 삭제 (테이블에서 컬럼 삭제)
alter table tb2
drop column col2;

describe tb2;

--  제약조건 추가 및 삭제
alter table tb2
drop primary key;

describe tb2;

alter table tb2
modify pk int;

describe tb2;

alter table tb2
drop primary key;

describe tb2;

-- drop
-- 테이블을 삭제하기 위한 구문

create table if not exists tb3(
pk int auto_increment primary key,
fk int,
col1 varchar(255),
check(col1 in ('Y','N'))
)engine = InnoDB;

drop table if exists tb1, tb2;