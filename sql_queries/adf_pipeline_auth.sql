-- This is needed to setup linked service in ADF pipeline successfully for dedicated SQL pool
-- Create a user for the ADF pipeline
CREATE USER [adf-abnb-cdc-dev] FROM EXTERNAL PROVIDER;

EXEC sp_addrolemember 'db_datareader', [adf-abnb-cdc-dev];
EXEC sp_addrolemember 'db_datawriter', [adf-abnb-cdc-dev];
EXEC sp_addrolemember 'db_owner', 'adf-abnb-cdc-dev';
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'abnbcdcdev@123!';