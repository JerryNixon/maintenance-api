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