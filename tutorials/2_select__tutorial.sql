# select statement: selecting everything from employee_demographics
SELECT * 
FROM parks_and_recreation.employee_demographics;

# We don't have to select everything
SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10)*2 +30
FROM parks_and_recreation.employee_demographics;

# should look the same as SELECT first_name ...  because all of the first names are different
SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics;

# only returns "male" and "female"
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

# now, it's looking at DISTINCT pairings of first_name and gender
SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

