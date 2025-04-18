# DbMaintenance + Data API builder

This repo contains:

| Folder         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| `/DbMaintenance` | A SQL Server Database Project with 5 maintenance procs |
| `/DataApi`       | DAB (Data API builder) config to expose them as APIs   |

---

## Stored Procedures

| Name                           | Description                                      |
|--------------------------------|--------------------------------------------------|
| `usp_GetRootBlockers`          | Returns current root blockers                   |
| `usp_GetOpenTransactions`      | Lists open transactions with optional filters   |
| `usp_GetHistoricalSystemEvents`| Returns system events in a time range           |
| `usp_GetQueryPlan`             | Parses and returns estimated plan for a query   |
| `usp_GetHAFailoverReadiness`   | Reports HA replica readiness state              |

---

## Data API builder

The `dab-config.json` in `/DataApi`:

- Exposes each stored procedure as:
  - **REST** endpoint under `/api/...`
  - **GraphQL** mutation under `/graphql`
- Enables anonymous access to all actions
- Uses `@env('my-connection-string')` for connection

Example `my-connection-string` format:
`Server=localhost;Database=DatabaseName;User ID=User;Password=Password;TrustServerCertificate=True`

## Get started with the CLI

```bash
dab init --database-type mssql --connection-string "@env('my-connection-string')" --host-mode development -c "dab-config.json"

dab add usp_GetRootBlockers -c "dab-config.json" --source "maintenance.usp_GetRootBlockers" --source.type "stored-procedure"  --permissions "anonymous:*" --rest "usp_GetRootBlockers" --rest.methods "GET, POST"

dab update usp_GetRootBlockers -c "dab-config.json"

dab add usp_GetQueryPlan -c "dab-config.json" --source "maintenance.usp_GetQueryPlan" --source.type "stored-procedure" --source.params "QueryText:string" --permissions "anonymous:*" --rest "usp_GetQueryPlan" --rest.methods "POST"

dab update usp_GetQueryPlan -c "dab-config.json" 

dab add usp_GetOpenTransactions -c "dab-config.json" --source "maintenance.usp_GetOpenTransactions" --source.type "stored-procedure" --source.params "MinDurationSeconds:number,SessionId:number" --permissions "anonymous:*" --rest "usp_GetOpenTransactions" --rest.methods "POST"

dab update usp_GetOpenTransactions -c "dab-config.json" 

dab add usp_GetHistoricalSystemEvents -c "dab-config.json" --source "maintenance.usp_GetHistoricalSystemEvents" --source.type "stored-procedure" --source.params "StartTime:string,EndTime:string" --permissions "anonymous:*" --rest "usp_GetHistoricalSystemEvents" --rest.methods "POST"

dab update usp_GetHistoricalSystemEvents -c "dab-config.json"

dab add usp_GetHAFailoverReadiness -c "dab-config.json" --source "maintenance.usp_GetHAFailoverReadiness" --source.type "stored-procedure" --source.params "ReplicaName:string" --permissions "anonymous:*" --rest "usp_GetHAFailoverReadiness" --rest.methods "POST"

dab update usp_GetHAFailoverReadiness -c "dab-config.json" 

dab start
```