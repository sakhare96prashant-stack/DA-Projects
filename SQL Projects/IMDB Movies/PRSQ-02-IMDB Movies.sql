/*PRSQL-01-IMDB Movies

Perform the Problem Queries:*/

-- 1)	Can you get all data about movies? 
select * from movies



-- 2)	How do you get all data about directors?
select * from directors



-- 3)	Check how many movies are present in IMDB.
select count(title) from movies



-- 4)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors 
where name in("James Cameron","Luc Besson","John Woo")



-- 5)	Find all directors with name starting with S.
select * from directors where name like "S%"



-- 6)	Count female directors.
select count(*) from directors where gender=1



-- 7)	Find the name of the 10th first women directors?
select * from directors where gender=1 limit 1 offset 9



-- 8)	What are the 3 most popular movies?
select original_title, popularity from movies 
order by popularity desc limit 3



-- 9) What are the 3 most bankable movies?
select original_title, revenue/1000000 as revenue_Mn from movies 
order by revenue desc limit 3

select original_title, revenue/1000000 as Revenue_Mn, 
budget/1000000 as Budget_Mn, 
revenue/budget as Collection from movies 
order by Collection desc limit 3



-- 10) What is the most awarded average vote since the January 1st, 2000?
select title, release_date, vote_average, vote_count 
from movies where release_date>2000-01-01 
order by vote_average desc



-- 11) Which movie(s) were directed by Brenda Chapman?
select m.title, d.name from movies m 
join directors d on m.director_id = d.id 
where d.name="Brenda Chapman"



-- 12) Which director made the most movies?
select name, count(title) as Total_Movies 
from movies m join directors d on m.director_id=d.id 
group by name order by Total_Movies desc limit 3



-- 13) Which director is the most bankable?
select name, sum(revenue) as total_revenue, 
sum(budget) as total_budget from movies m 
join directors d on m.director_id=d.id 
group by name order by total_revenue desc limit 1

select name, sum(revenue)/sum(budget) as total_return 
from movies m join directors d on m.director_id=d.id 
group by name order by total_return desc limit 1