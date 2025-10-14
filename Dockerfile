# Use the official .NET 8 runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use the official .NET 8 SDK for building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project files
COPY ["src/SmartPersonalTaskAgent.API/SmartPersonalTaskAgent.API.csproj", "src/SmartPersonalTaskAgent.API/"]
COPY ["src/SmartPersonalTaskAgent.Application/SmartPersonalTaskAgent.Application.csproj", "src/SmartPersonalTaskAgent.Application/"]
COPY ["src/SmartPersonalTaskAgent.Domain/SmartPersonalTaskAgent.Domain.csproj", "src/SmartPersonalTaskAgent.Domain/"]
COPY ["src/SmartPersonalTaskAgent.Infrastructure/SmartPersonalTaskAgent.Infrastructure.csproj", "src/SmartPersonalTaskAgent.Infrastructure/"]

# Restore dependencies
RUN dotnet restore "src/SmartPersonalTaskAgent.API/SmartPersonalTaskAgent.API.csproj"

# Copy the entire source code
COPY . .

# Build the application
WORKDIR "/src/src/SmartPersonalTaskAgent.API"
RUN dotnet build "SmartPersonalTaskAgent.API.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "SmartPersonalTaskAgent.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Create the final runtime image
FROM base AS final
WORKDIR /app

# Create logs directory
RUN mkdir -p /app/logs

# Copy the published application
COPY --from=publish /app/publish .

# Set environment variables
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:80

# Create a non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser
RUN chown -R appuser:appuser /app
USER appuser

ENTRYPOINT ["dotnet", "SmartPersonalTaskAgent.API.dll"]
