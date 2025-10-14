# Smart Personal Task Agent

An autonomous AI system for personal task management and execution built with .NET 8.0 and Clean Architecture principles.

## 🎯 Features

- **AI-Powered Task Planning**: Generate multi-step plans using LLM integration
- **Autonomous Task Execution**: Execute and monitor scheduled tasks automatically
- **Gmail Integration**: Read, send, and reply to emails
- **Calendar Integration**: Schedule and manage calendar events
- **Memory Management**: Store and retrieve user context and task history
- **Background Task Processing**: Hangfire-powered job scheduling
- **JWT Authentication**: Secure API access with refresh tokens
- **RESTful API**: Complete OpenAPI/Swagger documentation

## 🏗️ Architecture

This project follows Clean Architecture (Hexagonal Architecture) with the following layers:

- **Domain Layer**: Entities, interfaces, and business logic
- **Application Layer**: Use cases, DTOs, and application services
- **Infrastructure Layer**: Data access, external services, and implementations
- **API Layer**: Controllers, middleware, and presentation logic

## 🛠️ Tech Stack

- **Framework**: ASP.NET Core 8.0 Web API
- **Database**: PostgreSQL with Entity Framework Core 8
- **Authentication**: JWT Bearer tokens with refresh token support
- **Background Jobs**: Hangfire with PostgreSQL storage
- **AI Integration**: OpenAI GPT API (configurable for other LLMs)
- **External APIs**: Google Gmail and Calendar APIs
- **Caching**: Redis for short-term context
- **Logging**: Serilog with file and console output
- **Documentation**: Swagger/OpenAPI
- **Containerization**: Docker with docker-compose

## 🚀 Quick Start

### Prerequisites

- .NET 8.0 SDK
- Docker and Docker Compose
- PostgreSQL (if running locally)
- Redis (if running locally)

### Option 1: Using Docker Compose (Recommended)

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd SmartPersonalTaskAgent
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your API keys and configuration
   ```

3. **Start the services**
   ```bash
   docker-compose up -d
   ```

4. **Access the application**
   - API: http://localhost:8080
   - Swagger UI: http://localhost:8080
   - Hangfire Dashboard: http://localhost:8082/hangfire

### Option 2: Local Development

1. **Clone and setup**
   ```bash
   git clone <repository-url>
   cd SmartPersonalTaskAgent
   ```

2. **Configure database connection**
   ```bash
   # Update appsettings.Development.json with your PostgreSQL connection string
   ```

3. **Restore packages and build**
   ```bash
   dotnet restore
   dotnet build
   ```

4. **Run database migrations**
   ```bash
   cd src/SmartPersonalTaskAgent.API
   dotnet ef database update
   ```

5. **Start the application**
   ```bash
   dotnet run
   ```

## 📋 API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/refresh` - Refresh access token

### Tasks
- `GET /api/tasks` - Get user tasks
- `GET /api/tasks/{id}` - Get specific task
- `POST /api/tasks` - Create new task
- `PUT /api/tasks/{id}` - Update task
- `POST /api/tasks/{id}/execute` - Execute task
- `DELETE /api/tasks/{id}` - Delete task

### Agent
- `POST /api/agent/plan` - Generate AI plan
- `POST /api/agent/execute` - Execute task plan
- `GET /api/agent/highlight` - Get weekly activity summary

### Integrations
- `GET /api/integrations/gmail/emails` - Get Gmail emails
- `POST /api/integrations/gmail/emails` - Send email
- `GET /api/integrations/calendar/events` - Get calendar events
- `POST /api/integrations/calendar/events` - Create calendar event

### Memory
- `GET /api/memory` - Get user memories
- `POST /api/memory` - Store memory
- `GET /api/memory/{key}` - Get specific memory
- `POST /api/memory/search` - Search memories
- `GET /api/memory/context` - Get contextual summary

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `OPENAI_API_KEY` | OpenAI API key for LLM integration | Required |
| `GOOGLE_CLIENT_ID` | Google OAuth client ID | Required |
| `GOOGLE_CLIENT_SECRET` | Google OAuth client secret | Required |
| `POSTGRES_PASSWORD` | PostgreSQL password | password |
| `JWT_SECRET_KEY` | JWT signing key | Required |

### Database Configuration

The application uses Entity Framework Core with PostgreSQL. Database migrations are automatically applied on startup.

### Redis Configuration

Redis is used for caching and session management. Configure the connection string in `appsettings.json`.

## 🧪 Testing

Run the test suite:

```bash
dotnet test
```

## 📊 Monitoring

- **Hangfire Dashboard**: Monitor background jobs at `/hangfire`
- **Logs**: Application logs are written to `/logs` directory
- **Health Checks**: Built-in health check endpoints

## 🔐 Security

- JWT Bearer token authentication
- HTTPS enforcement in production
- Input validation and sanitization
- SQL injection protection via EF Core
- CORS configuration for cross-origin requests

## 📈 Performance

- Entity Framework Core query optimization
- Redis caching for frequently accessed data
- Background job processing for heavy operations
- Connection pooling for database access

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the API documentation at `/swagger`
- Review the logs for error details

## 🔮 Roadmap

- [ ] Advanced AI model support (Claude, Llama)
- [ ] Mobile application
- [ ] Real-time notifications
- [ ] Advanced analytics dashboard
- [ ] Multi-tenant support
- [ ] Plugin system for custom integrations

---

Built with ❤️ using .NET 8.0 and Clean Architecture principles.
