use moviedb;


--  table 은 ctrl + enter 을 해서 눈으로 보여지는 표(?)이다.
-- create table 은 화면에 어떤식으로 보여지게 할 건지 배치(?) 하는 것이다.

-- 테이블 생성

-- movie theathers 테이블 삭제
DROP TABLE IF EXISTS movie_theaters;
-- 영화관 테이블 생성
create table if not exists movie_theaters
(
   theater_id int auto_increment primary key,
   theater_name  varchar(10) not null comment '극장명',
   theater_location varchar(5) not null comment '극장지점위치'
)
engine=InnoDB comment '극장';

INSERT INTO movie_theaters (theater_name, theater_location) VALUES 
('CGV', '서초구'),
('롯데시네마', '강남구'),
('씨네큐', '영등포구');

select * from movie_theaters;

-- movie 테이블 삭제
DROP TABLE IF EXISTS movies;
-- 영화 테이블 생성
CREATE TABLE movies -- create 할 때는 웬만하면 as 사용 X
(
	movie_id	int auto_increment primary key,
    title        varchar(10) not null comment '제목',
    show_time     DATETIME not null comment '상영시간',
    total_seats   int not null comment '총좌석수',
    reserved_seats int not null comment '예약된좌석수',
    theater_id     int not null comment '극장코드',
    foreign key (theater_id)
    references movie_theaters (theater_id)
)
engine = InnoDB comment '영화';

INSERT INTO movies (title, show_time, total_seats, reserved_seats, theater_id) VALUES 
('늘봄가든', '2024-08-23 14:00:00', 100, 45, 1),
('에어리언', '2024-08-23 17:00:00', 150, 90, 1),
('행복의나라', '2024-08-24 20:00:00', 120, 30, 2),
('파일럿', '2024-08-25 19:00:00', 200, 50, 3);

select * from movies;

-- 
-- reservations 테이블 삭제
DROP TABLE IF EXISTS reservations;
-- 영화관 좌석 예약 테이블 생성
create table reservations
(
	reservations_id int auto_increment primary key,
	user_name varchar(255) not null comment '관객이름',
	movie_id int not null comment '영화코드',
    seats_reserved int not null,
    foreign key (movie_id)
    references movies (movie_id)
)
engine = InnoDB comment '예약';


INSERT INTO reservations (user_name, movie_id, seats_reserved) VALUES 
('철수', 1, 2),
('영희', 2, 4),
('길동', 1, 3),
('관순', 3, 1),
('민식', 4, 5);

select * from reservations;

