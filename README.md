# Spatial data notebooks

`./start.sh` run jupyter in docker container.

### With attached postgis container

Set `POSTGRES_PASSWORD` in `.env` file.

`./start-postgis.sh` run jupyter with linked temporary postgis container 
(deleted on termination).

Connect to postgres database by finding address and port in environment. E.g.:

```python
import psycopg2
pg_user=os.environ.get('POSTGIS_ENV_POSTGRES_USER')
pg_pass=os.environ.get('POSTGIS_ENV_POSTGRES_PASSWORD')
pg_host=os.environ.get('POSTGIS_PORT_5432_TCP_ADDR')
pg_port=os.environ.get('POSTGIS_PORT_5432_TCP_PORT')

conn = psycopg2.connect(user=pg_user, 
                        password=pg_pass,
                        host=pg_host,
                        port=pg_port
                       )
cur = conn.cursor()
```
