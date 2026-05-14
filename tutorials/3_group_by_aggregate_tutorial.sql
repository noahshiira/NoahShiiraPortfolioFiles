-- Group By
# Group By: groups rows with the same values in the specified column you're grouping on

# what are the different groups of genders?
SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

# it looks like we get the same output as: BUT THEY'RE NOT THE SAME
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics
;

# GROUP BY lets us perform AGGREGATE functions

# give me the first names of all the employees and group by the gender
SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;
# this should produce an error
# if you're not using an aggregate function in the SELECT statement, what you're SELECTing has to match what you're GROUPing BY

# what is the average age per gender?
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;
# takeaway: the average age of female employees is lower (by about 3 years) than the average age of males

# looking at the salary table
SELECT * 
FROM parks_and_recreation.employee_salary
;

# what are the occupations in the salary table?
SELECT occupation
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;

# what if we wanted to also group on the salary?
# the point: this groups rows by unique pair of occupation AND salary
SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary
;

-- AGG functions

# what is the average age of employees, split by gender? And, what is the max age for each gender group?
SELECT gender, AVG(age), MAX(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;
# we can also see now that the max age is 15 years higher for males than females

# we can additionally take the minimum age
SELECT gender, AVG(age), MAX(age), MIN(
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;