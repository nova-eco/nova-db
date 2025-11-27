# nova-db

[![Code Quality](https://github.com/nova-eco/nova-db/actions/workflows/code-quality.yml/badge.svg)](https://github.com/nova-eco/nova-db/actions/workflows/code-quality.yml)
[![Prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)](https://prettier.io/)
[![CSpell](https://img.shields.io/badge/spell_check-cspell-blue.svg)](https://cspell.org/)

MariaDB Docker image and database schema for the Nova platform.

## Project Status

This project is **actively maintained**. We welcome contributions, bug reports, and
feature requests.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Database Connection](#database-connection)
- [Architecture](#architecture)
  - [Database Schema](#database-schema)
  - [Docker Image Structure](#docker-image-structure)
  - [Automated Publishing](#automated-publishing)
- [Deployment](#deployment)
  - [Docker Image Publishing](#docker-image-publishing)
  - [Triggering Downstream Deployments](#triggering-downstream-deployments)
- [Development](#development)
  - [Code Quality Standards](#code-quality-standards)
    - [Formatting](#formatting)
    - [Docker Linting](#docker-linting)
    - [Spell Checking](#spell-checking)
  - [Pushing Changes](#pushing-changes)
  - [Running All Checks Manually](#running-all-checks-manually)
- [Scripts](#scripts)
- [Changelog](#changelog)
- [License](#license)
- [Author](#author)

## Getting Started

### Prerequisites

- Node.js >= 21
- npm >= 10
- Docker and Docker Compose
- Git

### Installation

1. **Clone the repository from GitHub:**

   ```bash
   git clone https://github.com/nova-eco/nova-db.git
   cd nova-db
   ```

2. **Install dependencies:**

   ```bash
   npm i
   ```

   This will automatically:
   - Install all required packages
   - Set up Husky git hooks for commit validation and pre-push checks
   - Copy `.env.TEMPLATE` to `.env` (if it doesn't already exist)

3. **Configure environment variables:**

   Edit the `.env` file and set the required variables:

   ```bash
   NOVA_DB__NAME="your-database-name"
   NOVA_DB__USER__ROOT_PASS="your-root-password"
   NOVA_DB__USER__STD="your-username"
   NOVA_DB__USER__STD_PASS="your-password"
   NOVA_DB__NETWORK="your-network-name"
   ```

### Usage

#### Starting the Database

To start the nova-db MariaDB database:

```bash
npm start
```

This command will:

1. Run all code quality checks (formatting, Docker linting, spelling)
2. Build the Docker image with SQL initialization scripts
3. Start the MariaDB container with force recreate to ensure clean state

The database will be running and accessible once the command completes.

#### Stopping the Database

To stop the database and clean up resources:

```bash
npm stop
```

This command will:

1. Stop all running containers
2. Remove orphaned containers
3. Remove all images created by the deployment

#### Docker Commands

For more granular control, you can use these Docker-specific commands:

```bash
npm run docker       # Start Docker containers (without running checks)
npm run docker:start # Start containers with build and force recreate
npm run docker:stop  # Stop containers and clean up
```

**Note**: The `start` command includes quality checks before starting Docker. Use
`npm run docker` if you want to skip the checks and start containers directly.

### Database Connection

Once the database is running, you can connect using the MariaDB client:

**Using MySQL/MariaDB Client from Host**

If you have `mysql` or `mariadb` client installed on your host machine:

```bash
# Connect via localhost
mysql -h 127.0.0.1 -P 3306 -u <your-username> -p <your-database-name>

# Or with mariadb command
mariadb -h 127.0.0.1 -P 3306 -u <your-username> -p <your-database-name>
```

Replace `<your-username>` and `<your-database-name>` with the values from your `.env` file.

## Architecture

### Database Schema

The nova-db schema includes comprehensive tables for managing:

- **Organisations & Companies**: Multi-tenant organisation and company management
- **Users & Authentication**: User accounts, statuses, passwords, sessions, and login tracking
- **Bookings & Appointments**: Appointment scheduling, clients, services, and leads
- **Salons & Locations**: Geographic data, locations, salons, chairs, and time slots
- **Services & Products**: Service management, pricing, periods, and product catalog
- **Staff Management**: Staff roles, schedules, open hours, and salon assignments
- **Orders & Payments**: Order processing, balances, service prices, and payment tracking
- **Registration System**: User registration, verification, and company onboarding
- **Suppliers**: Supplier management, products, pricing, and package types
- **Wallets & Currencies**: Wallet management and multi-currency support
- **Templates & Messages**: Template categories and registration messages

### Docker Image Structure

The Docker image is based on `mariadb:lts-noble` and includes:

- All SQL initialisation scripts from the `/sql` directory
- Automated schema creation on first startup
- Automated data seeding with initial records
- Health check configuration for monitoring

### Automated Publishing

When changes are pushed to the master branch, the Docker image is automatically:

1. Built with the latest SQL schemas
2. Published to GitHub Container Registry (ghcr.io)
3. Tagged with branch name, commit SHA, and 'latest'
4. Used to trigger rebuild of dependent services (nova-deploy)

## Deployment

### Docker Image Publishing

This project automatically publishes Docker images to GitHub Container Registry. The workflow is triggered on every push to the `master` branch.

**Published Images:**

- Repository: `ghcr.io/nova-eco/nova-db`
- Tags: `latest`, `master`, `master-<commit-sha>`

**Image Build Arguments:**

- `NOVA_DB__AUTHOR`: Image author metadata
- `NOVA_DB__SQL__FILE`: SQL initialization file name
- `NOVA_DB__SQL__PATH`: Path to SQL files directory

### Triggering Downstream Deployments

After successful Docker image publication, the workflow automatically triggers a rebuild
of the `nova-deploy` repository via repository dispatch event. This ensures that the
deployment package always uses the latest database image.

## Development

### Code Quality Standards

This project enforces strict code quality standards using automated tools:

#### Formatting

- **Tool**: [Prettier](https://prettier.io/)
- **Configuration**: `.prettierrc.json`
- **Standards**:
  - Line width: 90 characters
  - Single quotes for strings
  - Semicolons required
  - 2-space indentation
  - LF line endings
  - Trailing commas in multi-line structures

**Commands**:

```bash
npm run format:check # Check formatting without making changes
npm run format:fix   # Automatically fix formatting issues
```

#### Docker Linting

- **Tool**: Docker built-in validators
- **Purpose**: Validates Docker and Docker Compose configuration files
- **What it checks**:
  - Dockerfile syntax and best practices
  - Docker Compose YAML syntax validity
  - Docker Compose schema compliance
  - Environment variable resolution
  - Service configuration correctness

**Commands**:

```bash
npm run lint         # Validate Docker configurations
npm run lint:docker  # Same as above (explicit)
```

#### Spell Checking

- **Tool**: [cspell](https://cspell.org/)
- **Configuration**: `cspell.json`
- **Standards**:
  - British English (en-gb)
  - Checks JavaScript, TypeScript, SQL, and Bash files
  - Custom dictionary for technical terms

**Commands**:

```bash
npm run spell # Check spelling
```

### Pushing Changes

This repository uses Git hooks to ensure code quality before changes are pushed. Follow
these steps:

#### 1. Make Your Changes

Edit files as needed for your feature or bugfix.

#### 2. Stage Your Changes

```bash
git add .
```

#### 3. Commit Your Changes

**IMPORTANT**: All commits must follow the
[Conventional Commits](https://www.conventionalcommits.org/) standard:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

**Commit Types**:

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes only
- `style`: Code style changes (formatting, missing semicolons, etc.)
- `refactor`: Code changes that neither fix bugs nor add features
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `build`: Changes to build system or dependencies
- `ci`: Changes to CI/CD configuration
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

**Examples**:

```bash
git commit -m "feat: add new user table schema"
git commit -m "fix: correct foreign key constraint in appointments table"
git commit -m "docs: update database connection instructions"
git commit -m "ci: update Docker publish workflow"
```

**Commit Hooks**:

- The `commit-msg` hook will automatically validate your commit message format using
  Commitlint. If the format is incorrect, the commit will be rejected.
- The `prepare-commit-msg` hook will automatically generate/update the CHANGELOG.md file
  and add it to your commit. This ensures the changelog is always up to date with all
  commits.

#### 4. Push Your Changes

```bash
git push
```

**Pre-push Hook**: Before your changes are pushed, the `pre-push` hook will automatically
run:

1. **Format check** - Ensures all files are properly formatted
2. **Docker lint** - Validates Docker and Docker Compose configuration
3. **Spell check** - Ensures no spelling errors

If any of these checks fail, the push will be blocked. You must fix the issues before
pushing:

```bash
npm run format:fix # Fix formatting issues
npm run check      # Run all checks manually
```

### Running All Checks Manually

To run all quality checks before committing:

```bash
npm run check
```

This runs the same checks that will be executed during the pre-push hook.

## Scripts

| Script              | Description                                      |
| ------------------- | ------------------------------------------------ |
| `npm start`         | Run checks and start Docker containers           |
| `npm stop`          | Stop Docker containers and clean up              |
| `npm run changelog` | Generate changelog from git commits              |
| `npm run check`     | Run all quality checks (format/lint/spell)       |
| `npm run docker`    | Start Docker containers (without running checks) |
| `npm run format`    | Check code formatting                            |
| `npm run lint`      | Validate Docker configurations                   |
| `npm run spell`     | Check spelling in source files                   |

## Changelog

All notable changes to this project are automatically documented in
[CHANGELOG.md](CHANGELOG.md). The changelog is generated from git commits using
[auto-changelog](https://github.com/CookPete/auto-changelog) and follows the
[Conventional Commits](https://www.conventionalcommits.org/) standard.

The changelog is automatically updated with each commit via the `prepare-commit-msg` git
hook.

## License

MIT

## Author

Nova Admin <admin@nova.eco>
