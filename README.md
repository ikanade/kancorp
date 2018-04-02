# Live Demo

	http://paytroll.herokuapp.com/

# PayTroll
Build models in your demo application to manage company database.
Company has many of employees(name, email, phone, employee_id).
Each company has an address.
Each employee has an address.
Add salary details of employee which will store designation and monthly salary.

## Constraints and validations:

  1. Emails and Phones should be unique
  2. name supports only alphabets and spaces.
  3. email should be stored in a valid format
  4. phone should be stored in a valid format and should not support alphabets.
  5. monthly salary should be greater than zero ;-)

## Expected features

  Top 5 earning employees
  
  1. All employees in Pune(or any other city)
  2. Search any employee via name and/or email should return the name email and his/her address
  3. List of employees earning between 10K to 50K
  
  you are free to add other validations and features.


## Outcome
	Run - rake db:setup
	Fire up rails console and call the following model methods to perform the above 3 queries.
	1. Address.in_city("CityName")  default cityname = pune
	2. <CompanyObject>.search(name:"Name",email:"emp@example.com"), can accept either name or email or both.
	3. Employee.salary_between(10000,50000) , default lower=0 , upper = 10000000 .


## Instructions

	Seed file creates two companies, RailsCorp and Oscorp. Each company has a random set of employees except for one employee who is present in both the companies "Ishan Kanade".
