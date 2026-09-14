-- -- data exploration

SELECT  FROM `zepto-sql-project-508607.zeptoproject.zepto` LIMIT 1000



-- count of rows in the table
select count(*) from `zepto-sql-project-508607.zeptoproject.zepto`




-- -- sample data
SELECT
  *
FROM
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
LIMIT
  10;




-- -- look for null values
SELECT
  *
FROM
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
WHERE
  name IS NULL
  AND category IS NULL
  AND mrp IS NULL
  AND discountedSellingPrice IS NULL
  AND discountPercent IS NULL
  AND quantity IS NULL
  AND weightInGms IS NULL
  AND availableQuantity IS NULL
  AND outOfStock IS NULL;





-- differnt producet categories
SELECT
  DISTINCT Category
FROM
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
ORDER BY
  Category;




-- how many product are in stock or out of stock
select outOfStock,
  count(*) as count
from
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
group by
  outOfStock;



-- product names present multiples times
select name,
  count(*) as count
from
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
group by
  name
  having count(*) > 1
order by
  count desc;



-- data cleaning



-- products with price =0
select *
from
  `zepto-sql-project-508607.zeptoproject.zepto` where
  mrp = 0
  or discountedSellingPrice = 0;

delete from `zepto-sql-project-508607.zeptoproject.zepto`
where
  mrp = 0
  or discountedSellingPrice = 0;


-- convert paise to rupees
UPDATE `zepto-sql-project-508607`.`zeptoproject`.`zepto`
SET mrp = mrp / 100, discountedSellingPrice = discountedSellingPrice / 100
WHERE mrp IS NOT NULL AND discountedSellingPrice IS NOT NULL;
 

-- find the top 10 best value prodcut based on the discount percentage
select distinct name, category, mrp, discountedSellingPrice, discountPercent
from
  `zepto-sql-project-508607`.`zeptoproject`.`zepto`
order by
  discountPercent desc
  limit 10;


-- what are the product with the high mrp but out of stock
select distinct name, category, mrp, discountedSellingPrice, discountPercent
from
  `zepto-sql-project-508607.zeptoproject.zepto` where
  outOfStock = true
order by
  mrp desc
  limit 10;



-- calculate the estimate revenue for each category
select category, sum(mrp * quantity) as revenue
from
  `zepto-sql-project-508607.zeptoproject.zepto`
group by
  category
  order by revenue ;



-- find all products where mrp is greater than 500 and discount is less than 10%
SELECT DISTINCT
  Category,
  name,
  mrp,
  discountPercent,
  availableQuantity,
  discountedSellingPrice,
FROM `zepto-sql-project-508607`.`zeptoproject`.`zepto` as zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC;



-- identify the top 5 categories with the highest average discount percentage
select category, avg(discountPercent) as avg_discount
from
  `zepto-sql-project-508607.zeptoproject.zepto` as zepto
group by
  category
  order by avg_discount desc



-- fimd he price per gram for product above 100g and sort_by best values
SELECT
  DISTINCT name,
  category,
  mrp,
  discountedSellingPrice,
  discountPercent,
  ROUND(discountedSellingPrice / weightInGms, 2) AS `price per gram`
FROM
  `zepto-sql-project-508607`.`zeptoproject`.`zepto` AS zepto
WHERE
  weightInGms > 0
ORDER BY
  discountedSellingPrice DESC;




-- group the product into category like low,medium,bulk
select
distinct name,weightInGms,
case when weightInGms < 1000 then 'low'
when weightInGms < 5000 then 'medium'
else 'bulk'
end as weight_category
from
  `zepto-sql-project-508607.zeptoproject.zepto` as ze;
    

-- what is the total inventery weight per category
select category, sum(weightInGms) as total_weight
from
  `zepto-sql-project-508607.zeptoproject.zepto` as zepto
  group by category
  order by total_weight desc;



