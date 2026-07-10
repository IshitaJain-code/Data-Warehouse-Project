/*
===============================================================================
Stored Procedure: Load Bronze Layer
===============================================================================
Scripts Purpose:
    Loads raw CSV data from the operational source systems into the Bronze
    layer using a Full Refresh loading strategy.
    It performs the following actions:
    -Truncates the bronze table before loading data.

Parameters:
     None.
     This stored procedure does not accept any parameters or return any values.

Usage Example:
     CALL bronze.load_bronze();
      
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
BEGIN

    RAISE NOTICE '=============================================';
    RAISE NOTICE 'Starting Bronze Layer Load';
    RAISE NOTICE 'Start Time: %', NOW();
    RAISE NOTICE '=============================================';

    --------------------------------------------------------------------------
    -- CRM
    --------------------------------------------------------------------------

    RAISE NOTICE 'Loading CRM Customers...';

    TRUNCATE TABLE bronze.crm_customers;

    COPY bronze.crm_customers
    FROM 'C:/postgres_import/customers.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    RAISE NOTICE 'CRM Customers Loaded';


    --------------------------------------------------------------------------
    -- Product Catalog
    --------------------------------------------------------------------------

    RAISE NOTICE 'Loading Products...';

    TRUNCATE TABLE bronze.erp_products;

    COPY bronze.erp_products
    FROM 'C:/postgres_import/products.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    RAISE NOTICE 'Products Loaded';


    --------------------------------------------------------------------------
    -- Orders
    --------------------------------------------------------------------------

    RAISE NOTICE 'Loading Orders...';

    TRUNCATE TABLE bronze.erp_orders;

    COPY bronze.erp_orders
    FROM 'C:/postgres_import/orders.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    RAISE NOTICE 'Orders Loaded';


    --------------------------------------------------------------------------
    -- Order Items
    --------------------------------------------------------------------------

    RAISE NOTICE 'Loading Order Items...';

    TRUNCATE TABLE bronze.erp_order_items;

    COPY bronze.erp_order_items
    FROM 'C:/postgres_import/order_items.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    RAISE NOTICE 'Order Items Loaded';


    --------------------------------------------------------------------------
    -- Returns
    --------------------------------------------------------------------------

    RAISE NOTICE 'Loading Returns...';

    TRUNCATE TABLE bronze.erp_returns;

    COPY bronze.erp_returns
    FROM 'C:/postgres_import/returns.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    RAISE NOTICE 'Returns Loaded';

    --------------------------------------------------------------------------

    RAISE NOTICE '=============================================';
    RAISE NOTICE 'Bronze Layer Loaded Successfully';
    RAISE NOTICE 'End Time: %', NOW();
    RAISE NOTICE '=============================================';

EXCEPTION
    WHEN OTHERS THEN

        RAISE NOTICE '=============================================';
        RAISE NOTICE 'Bronze Layer Load Failed';
        RAISE NOTICE 'Error: %', SQLERRM;
        RAISE NOTICE '=============================================';

        RAISE;

END;
$$;
