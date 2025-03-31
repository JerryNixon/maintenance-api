CREATE PROCEDURE maintenance.usp_GetOpenTransactions
    @MinDurationSeconds INT = NULL,
    @SessionId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(NULL AS INT) AS session_id,
        CAST(NULL AS NVARCHAR(128)) AS transaction_name,
        CAST(NULL AS DATETIME) AS transaction_begin_time,
        CAST(NULL AS VARCHAR(60)) AS transaction_state,
        CAST(NULL AS DECIMAL(18,2)) AS transaction_log_space_used_mb
END
