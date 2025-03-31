CREATE PROCEDURE maintenance.usp_GetHistoricalSystemEvents
    @StartTime DATETIME,
    @EndTime DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(NULL AS DATETIME) AS event_time,
        CAST(NULL AS NVARCHAR(100)) AS event_type,
        CAST(NULL AS NVARCHAR(4000)) AS event_description
END
