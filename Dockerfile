# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY WebApp/*.csproj ./WebApp/
RUN dotnet restore



# copy everything else and build app
COPY WebApp/. ./WebApp/
WORKDIR /source/WebApp
RUN dotnet publish -c release -o /app --no-restore
#Angular build
FROM node as nodebuilder

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
#ENV PATH /usr/src/app/node_modules/.bin:$PATH


# install and cache app dependencies
COPY WebApp/ClientApp/package.json /usr/src/app/package.json
RUN npm install -g @angular/cli@latest
RUN npm install

# add app

COPY WebApp/ClientApp/. /usr/src/app

RUN npm run build --prod

#End Angular build

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app ./
RUN mkdir -p /app/ClientApp/dist
COPY --from=nodebuilder /usr/src/app/dist/. /app/ClientApp/dist/
ENTRYPOINT ["dotnet", "WebApp.dll"]

