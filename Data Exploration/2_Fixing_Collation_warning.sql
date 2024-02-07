SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]

    -- CREATE DATABASE

    CREATE DATABASE ProjectDB


-- EXPLICITLY USING COLLATION ON COLUMNS


SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10) COLLATE Latin1_General_100_CI_AS_KS_SC_UTF8,
        [Month] VARCHAR(10) COLLATE Latin1_General_100_CI_AS_KS_SC_UTF8
    ) AS [data]


--CHANGE COLLATION FOR ENTIRE DATABASE

ALTER DATABASE ProjectDB
COLLATE Latin1_General_100_CI_AS_KS_SC_UTF8


-- Rexecute 

SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]

