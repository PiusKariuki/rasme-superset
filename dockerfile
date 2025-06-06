FROM apache/superset:latest

ENV SUPERSET_SECRET_KEY='render_secret_key'

ENV ADMIN_USERNAME=admin
ENV ADMIN_PASSWORD=admin
ENV ADMIN_FIRST_NAME=superset
ENV ADMIN_LAST_NAME=Admin
ENV ADMIN_EMAIL=pius@openfn.org

EXPOSE 8088

CMD ["superset", "run", "-h", "0.0.0.0", "-p", "8080"]
