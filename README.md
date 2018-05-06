# aspnetcore-supervisor-filebeat-example
ASP.NET Core &amp; Supervisor &amp; Filebeat Example

## Create ASP.NET Core Web API Project

```
dotnet new webapi -o ValueService
cd ValueService
dotnet restore
cd ..
```

## Create Test Project for Web API Project

```
dotnet new xunit -o ValueServiceTest
cd ValueServiceTest
dotnet add package Moq
dotnet add reference ../ValueService/ValueService.csproj
dotnet restore
cd ..
```

## Create Solution File And Bind Projects

```
dotnet new sln --name ValueService
dotnet sln ValueService.sln add ValueService/ValueService.csproj ValueServiceTest/ValueServiceTest.csproj
dotnet restore
```

## Publish Release for Docker Image

```
dotnet publish -c Release -o out
```

## Build & Run Docker Image

```
docker build . -t valueservice
docker run -d -p 80:80 -e LOGSTASH_HOST="172.17.0.2:5044" valueservice
```

## Test with ELK Container

This step using [ELK](https://hub.docker.com/r/burakince/elk/) image.

```
docker run -d -p 5601:5601 -p 9200:9200 -p 5044:5044 --name elk burakince/elk
docker run -d -p 80:80 --link elk:logstash -e LOGSTASH_HOST="logstash:5044" valueservice
```

## Creating Index Pattern on Kibana

Open [Kibana's Create Index Pattern](http://localhost:5601/app/kibana#/management/kibana/index?_g=()) page and enter `filebeat-*` as a pattern and click `Next step`. Select `@timestamp` and click `Create index pattern`. Now you can see all logs on Kibana

Kibana URL: http://localhost:5601/
