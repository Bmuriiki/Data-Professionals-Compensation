create schema  staging;

select *
from staging.compensation


--renaming columns
alter table staging.compensation
drop column if exists "Timestamp";

alter table staging.compensation
rename column "What is your Current Role?" to role;

alter table staging.compensation
rename column  "If other, please indicate your role here" to "other_role";

alter table staging.compensation
rename column  "Level" to "level";

alter table staging.compensation
rename column  "How many years of experience do you have in the data Field?" to "experience_years";

alter table staging.compensation
rename column  "What industry is  your Employer? eg Fintech, Utilities, HR, Gaming, Health etc." to "industry";

alter table staging.compensation
rename column  "What is your gender" to "gender";

alter table staging.compensation
rename column  "What is your main Tech stack?" to "tech_stack";

alter table staging.compensation
rename column  "If other, please indicate your tool stack here" to "other_stack";


alter table staging.compensation
rename column  "What is your monthly Gross Salary in Kes per month?" to "salary";

alter table staging.compensation
rename column  "Any other benefits?" to "benefits";

alter table staging.compensation
rename column  "What is your work setup?" to "work_setup";

alter table staging.compensation
rename column  "Employer Type" to "employer_type";


--Cleaning joining role with other_role column

select 
	   concat(
	   case when role ='Other' then '' 
	        when role = 'N/A' then ''
	        when role = 'N/a' then ''
	        else role
	        end, 
	        other_role) as role,
		    level,
		    experience_years,
		    industry,
		    gender,
		    tech_stack,
		    other_stack,
		    salary,
		    benefits,
		    work_setup,
		    employer_type    
from staging.compensation


--Level cleaning

	
select 
	   concat(
	   case when role ='Other' then '' 
	        when role = 'N/A' then ''
	        when role = 'N/a' then ''
	        else role
	        end, 
	        other_role) as role,
		case when level = 'Senior Level  eg Senior Data Analyst' then 'Senior Level'
			 when level = 'Mid-Level  eg Data Analyst' then 'Mid-Level'
			 when level = 'Lead eg Lead Analyst' then 'Lead'
			 when level = 'Junior  eg Junior Data Analyst' then 'Junior'
			 when level = 'Manager eg Manager of Analytics' then 'Manager'
		     else level
		     end as level,
		    experience_years,
		    industry,
		    gender,
		    tech_stack,
		    other_stack,
		    salary,
		    benefits,
		    work_setup,
		    employer_type    
from staging.compensation
