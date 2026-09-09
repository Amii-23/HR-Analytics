create database hr_dataset;
use hr_dataset;

#Q1 overall attrition rate
select count(*) as total_employees,
	sum(termd) as terminated_employees,
    concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from
    hr;
 
 #Q2 attrition by department
select department,
        count(*) as total_employees,
        sum(termd) as terminated_employees,
        concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from 
       hr
group by department
order by attrition_rate desc;

#Q3 attrition by gender
select sex,
       count(*) as total_employees,
       sum(termd) as terminated_employees,
       concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from 
    hr
group by sex
order by attrition_rate desc;
       
#Q4 attrition by recruitmentsource
select recruitmentsource,
        count(*) as total_employees,
        sum(termd) as terminated_employees,
        concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from 
     hr
group by recruitmentsource
order by attrition_rate desc;

# Q5 attrition by performancescore

select performancescore,
       count(*) as total_employees,
       sum(termd) as terminated_employees,
       concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from
    hr
group by performancescore
order by attrition_rate desc;

#Q6 attrition by employmentstatus

select employmentstatus,
        count(*) as total_employees,
        sum(termd) as terminated_employees,
        concat(round(sum(termd)/count(*)*100,2),"%") as attrition_rate
from 
         hr
group by employmentstatus
order by attrition_rate desc;


# Q7 Termination reason

select termreason,
        count(*) as total_employees
from
    hr
where termd = 1
group by termreason
order by total_employees desc;


#Q8 attrition by maritalstatus

select maritaldesc,
        count(*) as total_employees,
        sum(termd) as terminated_employees,
        round(sum(termd)/count(*)*100,2) as attrition_rate
from 
    hr
group by maritaldesc
order by attrition_rate desc;

#Q9 attrition by manager

select managername,
        count(*) as total_employees,
        sum(termd) as terminated_employees,
        round(sum(termd)/count(*)*100,2) as attrition_rate
from
      hr
group by managername
order by attrition_rate desc;

#Q10 attrition by salary

select
      case when salary< 50000 then "below 50k"
      when salary < 750000 then "50k-70k"
      when salary < 100000 then "75k-100k"
      else "100k+"
      end as salary_band,
      count(*) as total_employees,
      sum(termd) as terminated_employees,
      round(sum(termd)/count(*)*100,2) as attrition_rate
from
        hr
group by salary_band
order by attrition_rate desc;

select dob from hr;