-- HTTPS

SELECT *
FROM 
    OPENROWSET(
        BULK 'https://projectsynapsestorage.dfs.core.windows.net/raw/Unemployment.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'

    ) AS [data]


-- ABFSS

SELECT *
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'

    ) AS [data]


--HEADER ROW

SELECT *
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
    ) AS [data]


-- SPECIFIC COLUMNS


SELECT [Line Number],[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
    ) AS [data]

-- ALAS

SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
    ) AS [data]

-- WITH CLAUSE

SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] INT,
        [Month] VARCHAR(10)
    ) AS [data]


-- first row

SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.csv',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] INT,
        [Month] VARCHAR(10)
    ) AS [data]


-- field terminator

SELECT *
FROM 
    OPENROWSET(
        BULK 'abfss://raw@projectsynapsestorage.dfs.core.windows.net/Unemployment.psv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = '|',
        PARSER_VERSION = '2.0'
    ) 
    AS [data]
