FROM apache/superset:latest

ENV SUPERSET_SECRET_KEY='render_secret_key'

USER root

# Optional: install build tools (not always needed, but safe)
RUN apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev python3-dev libsasl2-dev libldap2-dev

USER superset

# ✅ Install the PostgreSQL driver
RUN pip install psycopg2-binary


RUN superset db upgrade && \
    superset fab create-admin \
      --username ${ADMIN_USERNAME:-admin} \
      --firstname ${ADMIN_FIRST_NAME:-Superset} \
      --lastname ${ADMIN_LAST_NAME:-Admin} \
      --email ${ADMIN_EMAIL:-admin@example.com} \
      --password ${ADMIN_PASSWORD:-admin} && \
    superset init

EXPOSE 8088

CMD ["superset", "run", "-h", "0.0.0.0", "-p", "8080"]
