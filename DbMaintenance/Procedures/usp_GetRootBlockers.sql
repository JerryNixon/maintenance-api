CREATE PROCEDURE maintenance.usp_GetRootBlockers
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(NULL AS INT) AS session_id,
        CAST(NULL AS INT) AS blocking_session_id,
        CAST(NULL AS NVARCHAR(256)) AS login_name,
        CAST(NULL AS NVARCHAR(512)) AS program_name,
        CAST(NULL AS DATETIME) AS login_time
END
