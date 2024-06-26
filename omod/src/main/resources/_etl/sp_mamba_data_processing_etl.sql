-- $BEGIN
-- add base folder SP here --

-- Flatten the tables first
CALL sp_mamba_data_processing_flatten();

-- Call the ETL process
CALL sp_mamba_data_processing_derived_hts();
-- CALL sp_mamba_data_processing_derived_covid();
CALL sp_mamba_data_processing_derived_pmtct();

-- TODO: Automate calling of these SPs that create Column Tables
-- TODO: Can use this but think through first: CALL sp_mamba_generate_report_wrapper(1, 'total_deliveries', '');
-- TODO: Or use the option of apache datasource that can get column names needs testing
CALL sp_mamba_total_pregnant_women_columns_query;
Call sp_mamba_hiv_exposed_infants_columns_query;
Call sp_mamba_total_deliveries_columns_query;
CALL sp_mamba_mother_hiv_status_query('', '');

-- $END