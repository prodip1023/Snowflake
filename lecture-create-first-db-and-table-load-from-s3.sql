//First DB Table and insert creation

create table ALPHAEDGE_FIRST_TABLE (
    FIRST_COLUMN    integer,
    SECOND_COLUMN   string,
    THIRD_COLUMN    string,
    FOURTH_COLUMN   string
    )
 ;
 
 insert into ALPHAEDGE_FIRST_TABLE values (1,'B','C','D' );
 
 select * from ALPHAEDGE_FIRST_TABLE ;



// Load a csv file publicly available in snowflake-docs tutorial. Reference snowflake documentation


// Create First DB
create or replace database ALPHAEDGE_FIRST_DB;

 // Set database
 USE DATABASE ALPHAEDGE_FIRST_DB;

create or replace table CONTACTS (
  id integer,
  last_name string,
  first_name string,
  company string,
  email string,
  workphone string,
  cellphone string,
  streetaddress string,
  city string,
  postalcode string);
  

//Validate data - there should not be any rows
 SELECT * FROM CONTACTS;

 
 //Load data from S3 bucket
  
 COPY INTO CONTACTS
    FROM s3://snowflake-docs/tutorials/dataloading/contacts1.csv
    file_format = (	type = 'CSV'
  			field_delimiter = '|'
  			skip_header = 1);
    

//Validate
 SELECT * FROM CONTACTS;
