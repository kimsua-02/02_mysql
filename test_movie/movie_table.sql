use moviedb;

-- 1번 문제 : 영화관에서 총 몇개의 좌석이 예약되었나요~?
select
    sum(reserved_seats)
  from
	movies;
	
-- 2번 문제 : 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요~!~!?
select
	reserved_seats,
    title
  from
	movies
order by
	reserved_seats DESC
    limit 1;
    
-- 3번 문제 : 특정 영화의 남은 좌석 수를 확인 해주세요^~^ (아무거나 골라서)
select
	(total_seats - reserved_seats) as nam
  from
	movies
where
	title in ('행복의나라');
	title in ('행복의나라');

