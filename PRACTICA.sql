

CREATE TABLE AGENCIES (
country varchar2(255),
resort_name varchar2(255),
number_od_days integer,
travel_method varchar2(255),
price decimal (10, 2),
date_of_issue date,
month varchar2(255),
holiday_id varchar2(255)
);

SELECT * FROM AGENCIES ORDER BY NUMBER_OD_DAYS;


select * from v$version;

