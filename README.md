# Assignment 2 — Dockerized Diagnostic CLI

A Bash-based Linux diagnostic CLI packaged and executed as a Docker container.

The application provides basic system, network, and disk diagnostic commands.

## Features

* System information and resource checks
* Network connectivity checks
* Disk usage information
* Command-line help
* Dockerized execution
* Docker Compose support
* Automated Docker tests

## Commands

```bash
./app/diagnostic.sh system
./app/diagnostic.sh network <host>
./app/diagnostic.sh disk
./app/diagnostic.sh help
```

### `system`

Displays basic Linux system information:

* Hostname
* Kernel version
* Uptime
* Memory information
* CPU information

### `network <host>`

Checks connectivity to a specified host using `ping`.

Example:

```bash
./app/diagnostic.sh network google.com
```

A successful connectivity check returns exit code `0`. A failed connectivity check returns exit code `1`.

### `disk`

Displays filesystem disk usage using `df -h`.

### `help`

Displays the available commands and their usage.

## Exit Codes

| Exit Code | Meaning                                  |
| --------- | ---------------------------------------- |
| `0`       | Successful operation                     |
| `1`       | Runtime or operational failure           |
| `2`       | Invalid command or missing/invalid input |

## Project Structure

```text
assignment-2/
├── README.md
├── app/
│   ├── diagnostic.sh
│   └── health-check.sh
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── test.sh
└── grade.sh
```

### Application files

`diagnostic.sh` is the main CLI entry point. It receives the user's command and routes it to the appropriate diagnostic operation.

`health-check.sh` performs the underlying Linux diagnostic checks for system, network, and disk operations.

## Running Locally

Make the application scripts executable:

```bash
chmod +x app/*.sh
```

Run the CLI:

```bash
./app/diagnostic.sh help
./app/diagnostic.sh system
./app/diagnostic.sh disk
./app/diagnostic.sh network google.com
```

## Docker

Build the Docker image:

```bash
docker build -t diagnostic-tool .
```

Run the available commands:

```bash
docker run --rm diagnostic-tool help
docker run --rm diagnostic-tool system
docker run --rm diagnostic-tool disk
docker run --rm diagnostic-tool network google.com
```

The Docker image is based on Ubuntu and installs the packages required by the diagnostic scripts:

* `iputils-ping` — network connectivity checks
* `procps` — memory and uptime information
* `util-linux` — CPU information through `lscpu`

## Docker Compose

The application can also be run using Docker Compose.

Run the help command:

```bash
docker compose run --rm diagnostic help
```

Other commands can be passed to the service:

```bash
docker compose run --rm diagnostic system
docker compose run --rm diagnostic disk
docker compose run --rm diagnostic network google.com
```

## Testing

The project includes `test.sh`, which performs automated tests against the Docker image.

The test suite checks:

* Help command
* System command
* Disk command
* Invalid command handling

Run the test suite with:

```bash
./test.sh
```

The supplied `grade.sh` script can be used to run the assignment's local grading checks:

```bash
./grade.sh
```

