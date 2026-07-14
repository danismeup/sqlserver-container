# SQL Server Dev Container

SQL Server 2022 Developer Edition per sviluppo e test locale.

## Avvio

```bash
docker compose up -d
```

## Accesso CLI

```bash
./cli.sh                  # shell interattiva sqlcmd
./cli.sh -Q "SELECT 1"   # query singola
```

## Credenziali

| Campo     | Valore           |
|-----------|------------------|
| Server    | localhost,1433   |
| User      | sa               |
| Password  | DevPassword123!  |

## Connection string (.NET)

```
Server=localhost,1433;Database=testdb;User Id=sa;Password=DevPassword123!;TrustServerCertificate=true
```

## Note

- MSSQL_PID=Developer: edizione gratuita, nessuna limitazione funzionale
- Dati persistenti in volume Docker `sqlserver_data`
- Healthcheck attivo: il container segnala `healthy` quando il server è pronto
