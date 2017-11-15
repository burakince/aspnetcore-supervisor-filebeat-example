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
docker run -d -p 80:80 valueservice
```
