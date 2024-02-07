CREATE DATABASE SCOPED CREDENTIAL MI
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE test_container_MI
WITH (
    LOCATION = 'https://datasource2212.dfs.core.windows.net/',
    CREDENTIAL = MI
)


SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'test/Unemployment.csv',
        DATA_SOURCE = 'test_container_MI',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]