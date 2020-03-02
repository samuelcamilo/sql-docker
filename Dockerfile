FROM mcr.microsoft.com/mssql/server:2017-latest AS build
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=S1m2e3l123

WORKDIR /tmp
COPY /src/init.sql .

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
        && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "S1m2e3l123" -i /tmp/init.sql \
        && pkill sqlservr

FROM mcr.microsoft.com/mssql/server:2017-latest AS release

ENV ACCEPT_EULA = Y
COPY --from=build /var/opt/mssql/data /var/opt/mssql/data