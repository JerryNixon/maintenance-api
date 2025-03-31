CREATE PROCEDURE maintenance.usp_GetQueryPlan
    @QueryText NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(NULL AS XML) AS query_plan_xml,
        CAST(NULL AS NVARCHAR(4000)) AS query_text,
        CAST(NULL AS INT) AS estimated_cost
END
