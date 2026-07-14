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

## Accesso remoto via tunnel SSH

Per connettere un client (SSMS, Azure Data Studio, DBeaver) da una macchina remota senza esporre la porta su internet:

```powershell
# Da Windows (PowerShell) — tunnel per entrambi i database:
ssh -L 127.0.0.1:11433:localhost:1433 -L 127.0.0.1:15434:localhost:5434 -N utente@host

# Solo SQL Server:
ssh -L 127.0.0.1:11433:localhost:1433 -N utente@host
```

L'opzione `-N` mantiene il tunnel senza aprire la shell. Lascia il terminale aperto.

Poi nel client:

| Client | Host | Porta | Note |
|---|---|---|---|
| SSMS | `127.0.0.1` | `11433` | Server name: `tcp:127.0.0.1,11433` (virgola, non `:`) |
| Azure Data Studio | `127.0.0.1` | `11433` | Spuntare "Trust server certificate" |
| Connection string | `127.0.0.1,11433` | — | `TrustServerCertificate=true` |

Scegli una porta locale libera diversa da `11433` se è già in uso (es. hai un'altra istanza SQL Server in locale).

## Note

- MSSQL_PID=Developer: edizione gratuita, nessuna limitazione funzionale
- Dati persistenti in volume Docker `sqlserver_data`
- Healthcheck attivo: il container segnala `healthy` quando il server è pronto
