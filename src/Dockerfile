FROM mcr.microsoft.com/mssql/server:2017-latest AS build
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Lead12345

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 20 \
        && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Lead12345 \
        && pkill sqlservr

FROM mcr.microsoft.com/mssql/server:2017-latest AS release

ENV ACCEPT_EULA=Y
COPY --from=build /var/opt/mssql/data /var/opt/mssql/data