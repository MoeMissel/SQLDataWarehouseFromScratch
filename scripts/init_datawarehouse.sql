-- Data With Baraa SQL Data Warehouse from Scratch
-- initialise the data warehouse project
-- creates 3 schemas and a table
CREATE DATABASE sandbox_datawarehouse

-- Bronze Schema
CREATE SCHEMA baraa_dw_bronze;
CREATE TABLE sandbox_datawarehouse.baraa_dw_bronze.test_table (
	id int NULL
);

-- Silver Schema
CREATE SCHEMA baraa_dw_silver;
CREATE TABLE sandbox_datawarehouse.baraa_dw_silver.test_table (
	id int NULL
);

--Gold Schema
CREATE SCHEMA baraa_dw_gold;
CREATE TABLE sandbox_datawarehouse.baraa_dw_gold.test_table (
	id int NULL
);
