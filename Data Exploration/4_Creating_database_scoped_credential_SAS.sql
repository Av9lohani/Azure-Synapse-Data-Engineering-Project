
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Azure#4321';


CREATE DATABASE SCOPED CREDENTIAL creds
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2023-07-20T22:07:31Z&st=2023-07-20T14:07:31Z&spr=https&sig=k8XX5f4KNi65eD2Tz37Es0tPD%2F0%2BYsnJnq9Oy%2Fzortc%3D' 


CREATE EXTERNAL DATA SOURCE test_container
WITH (
    LOCATION = 'https://datasource2212.dfs.core.windows.net/',
    CREDENTIAL = creds
)


SELECT [data].[Line Number],[data].[Month]
FROM 
    OPENROWSET(
        BULK 'test/Unemployment.csv',
        DATA_SOURCE = 'test_container',
        FORMAT = 'CSV',
        FIRSTROW = 2,
        PARSER_VERSION = '2.0'
    ) 
    WITH (
        [Line Number] VARCHAR(10),
        [Month] VARCHAR(10)
    ) AS [data]