-- Use your data warehouse database
use sandbox_datawarehouse

-- Create schemas
create schema baraa_dw_bronze;
create schema baraa_dw_silver;
create schema baraa_dw_gold;

-- For DBeaver to make schema visible
create table baraa_dw_bronze.dummy_table (
id int ,
name varchar,
age int 
);

-- Create table definitions
CREATE TABLE baraa_dw_bronze.crm_cust_info(
    cst_id            INT,
    cst_key           VARCHAR(20),
    cst_firstname     VARCHAR(50),
    cst_lastname      VARCHAR(50),
    cst_marital_status VARCHAR(10),
    cst_gndr          VARCHAR(10),
    cst_create_date   DATE
);

CREATE TABLE baraa_dw_bronze.crm_prd_info (
    prd_id          INT,
    prd_key         VARCHAR(50),
    prd_nm          VARCHAR(100),
    prd_cost        DECIMAL(10,2),
    prd_line        VARCHAR(10),
    prd_start_dt    DATE,
    prd_end_dt      DATE
);

CREATE TABLE baraa_dw_bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

CREATE TABLE baraa_dw_bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);

CREATE TABLE baraa_dw_bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);

CREATE TABLE baraa_dw_bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);

select DB_NAME();


