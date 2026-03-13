Sure! Here’s the README in proper Markdown format:

````markdown
# Skyblock Docker Server

This project runs a Minecraft Skyblock server in Docker using **Docker Compose**. It supports easy world resets, configurable memory, and custom container names for multi-server setups.

---

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## Build and Run

1. **Build the container**

```bash
docker compose build --no-cache
````

2. **Start the server**

```bash
docker compose up -d
```

3. **Stop the server**

```bash
docker compose down
```

---

## Docker Compose Parameters

You can customize the server using environment variables in your `.env` file or via inline environment overrides.

| Parameter       | Description                                         | Default           |
| --------------- | --------------------------------------------------- | ----------------- |
| `RESET_WORLD`   | Reset the world save on startup (`true` or `false`) | `false`           |
| `MAX_MEMORY`    | Maximum RAM for the Minecraft server (e.g., `1G`)   | `1G`              |
| `CUSTOMER_NAME` | Container name (useful for multi-server setups)     | `skyblock-server` |
| `PORTS`         | Map Docker ports to host (e.g., `25570:25570`)      | `25570:25570`     |

---

### Example `.env` file

```env
RESET_WORLD=false
MAX_MEMORY=2G
CUSTOMER_NAME=skyblock-server
PORTS=25570:25570
```

---

### Notes

* The server files are stored in `./skyblock-data` (persistent across container rebuilds).
* To reset the world manually:

```bash
RESET_WORLD=true docker compose up -d
```

* Multi-server setups: set `CUSTOMER_NAME` and `PORTS` differently for each instance.

