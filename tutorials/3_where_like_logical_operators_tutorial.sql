-- WHERE Clause

# Which employees have the first name Leslie?
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie'
;

# which employees make more than 50000
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
;

# which employees make less than 50000 (inclusive of 50000) 
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;

# what employees are female? 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female'
;

# what employees are not female (male) 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female'
;

# who was born AFTER Jan, 01, 1985?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

-- Logical Operators

# AND: both A & B need to be true
# which employees are born in/after 1985 AND are male?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' 
AND gender = 'Male'
;

# OR: either A & B can be true
# which employees are either born in/after 1985 OR are female?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'female'
;

# NOT: takes the opposite of the condition
# This should return the same as the query directly above
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

# Logical Operators follow PEMDAS
# the point: parentheses work the same way as it would in a mathematical operation
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44)
OR age > 55
;

-- LIKE Statement

# which employees have the first name Jerry?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'Jerry'
;

# which employees have th first name Jer?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'Jer'
;

# %: % acts as a 'wild card' (for any number of characters)
# which employees have 'a' first name that starts with A 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%'
;

# which employees have 'er' somewhere in their first name?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%er%'
;

# which employees have 'a' first name that starts with A 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%'
;

# _: _ acts as a wild card (but each _ corresponds to 1 character and the input needs to match that exactly)
# which employees have 'a' first name that starts with A and has 3 characters after that A?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A___'
;

# % and _ can be combined!!!
# which employees have 'a' first name that starts with A and has AT LEAST 3 characters after that A?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A___%'
;

# Can be used for dates as well
# which employees are born in 1989?
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
;