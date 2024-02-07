SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'Unemployment.csv',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]

-- Creating an external datasource

CREATE EXTERNAL DATA SOURCE raw_container
WITH (
    LOCATION = 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/'
)


-- Another datasource pointing to newraw

CREATE EXTERNAL DATA SOURCE newraw_container
WITH (
    LOCATION = 'abfss://newraw@projectsynapsestorage.dfs.core.windows.net/'
)

-- Using external datasource

SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'Unemployment.csv',
        DATA_SOURCE = 'newraw_container',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]