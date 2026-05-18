CREATE OR ALTER PROCEDURE baraa_dw_bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME;
	DECLARE @end_time DATETIME;
	DECLARE @batch_start_time DATETIME;
	DECLARE @batch_end_time DATETIME;
	BEGIN TRY
		-- ============================================================
		-- CRM Tables
		-- ============================================================
		PRINT '============================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '============================================================';
		SET @batch_start_time = GETDATE();

		PRINT '------------------------------------------------------------';
		PRINT 'LOADING CRM TABLES';
		PRINT '------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: crm_cust_info';
		TRUNCATE TABLE baraa_dw_bronze.crm_cust_info;
		BULK INSERT baraa_dw_bronze.crm_cust_info
		FROM 'C:\datasets\source_crm\cust_info.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: crm_cust_info';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: crm_prd_info';
		TRUNCATE TABLE baraa_dw_bronze.crm_prd_info;
		BULK INSERT baraa_dw_bronze.crm_prd_info
		FROM 'C:\datasets\source_crm\prd_info.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: crm_prd_info';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: crm_sales_details';
		TRUNCATE TABLE baraa_dw_bronze.crm_sales_details;
		BULK INSERT baraa_dw_bronze.crm_sales_details
		FROM 'C:\datasets\source_crm\sales_details.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: crm_sales_details';

		-- ============================================================
		-- ERP Tables
		-- ============================================================
		PRINT '------------------------------------------------------------';
		PRINT 'LOADING ERP TABLES';
		PRINT '------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: erp_loc_a101';
		TRUNCATE TABLE baraa_dw_bronze.erp_loc_a101;
		BULK INSERT baraa_dw_bronze.erp_loc_a101
		FROM 'C:\datasets\source_erp\loc_a101.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: erp_loc_a101';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: erp_cust_az12';
		TRUNCATE TABLE baraa_dw_bronze.erp_cust_az12;
		BULK INSERT baraa_dw_bronze.erp_cust_az12
		FROM 'C:\datasets\source_erp\cust_az12.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: erp_cust_az12';

		SET @start_time = GETDATE();
		PRINT '>> Truncating and Loading: erp_px_cat_g1v2';
		TRUNCATE TABLE baraa_dw_bronze.erp_px_cat_g1v2;
		BULK INSERT baraa_dw_bronze.erp_px_cat_g1v2
		FROM 'C:\datasets\source_erp\px_cat_g1v2.csv'
		WITH
		(
		    FIRSTROW = 2,
		    FIELDTERMINATOR = ',',
		    TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> Finished Loading: erp_px_cat_g1v2';

		SET @batch_end_time = GETDATE();
		PRINT '============================================================';
		PRINT 'BRONZE LAYER LOADING COMPLETE';
		PRINT 'TOTAL LOAD DURATION: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================================================';
	END TRY

	BEGIN CATCH
		PRINT 'ERROR OCCURRED DURING BRONZE LAYER'
		PRINT 'ERROR MESSAGE: ' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR)
	END CATCH
END
