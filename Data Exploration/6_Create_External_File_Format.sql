-- Creating PARQUET FORMAT

CREATE EXTERNAL FILE FORMAT parquet_format
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

