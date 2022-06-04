select title, length, 
rank () over (partition by length order by title asc) as ranking 
from sakila.film
where length > 0;

select title, length, rating, rank () over (partition by length order by rating asc) as duration
from sakila.film
where length > 0;

##How many films are there for each of the categories in the category table. Use appropriate join to write this query
select count(f.film_id) as films, c.name
from sakila.film_category f left join sakila.category c on f.category_id = c.category_id
group by c.name;

##Which actor has appeared in the most films?
select a.actor_id, count(f.title) as films  
from sakila.film_actor a left join sakila.film f on a.film_id=f.film_id 
group by a.actor_id
order by films desc;

##Most active customer (the customer that has rented the most number of films)
select c.last_name as last_name, count(r.rental_id) as rentals
from sakila.rental r left join sakila.customer c on r.customer_id = c.customer_id
group by c.last_name;