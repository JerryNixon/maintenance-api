CREATE PROCEDURE maintenance.usp_GetHAFailoverReadiness
    @ReplicaName NVARCHAR(128) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(NULL AS NVARCHAR(128)) AS replica_name,
        CAST(NULL AS BIT) AS is_synchronized,
        CAST(NULL AS BIT) AS is_primary,
        CAST(NULL AS NVARCHAR(256)) AS failover_readiness_state
END
