# Docker

Run Afterglow with Docker Compose or Portainer.

## Requirements

- Docker Engine with Docker Compose.
- Portainer (optional).

## Docker Compose

Clone the repository:

```bash
git clone https://github.com/MarioRRom/afterglow-docker.git
cd afterglow-docker
```

Start the container:

```bash
docker compose up -d --build
```

Open `http://HOST_IP:8000/` in your PS4 browser.

### Configuration

The HTTP port can be changed through `AFTERGLOW_PORT`.

Create a `.env` file:

```bash
cp .env.example .env
```

Edit the port if needed, then recreate the container:

```bash
docker compose up -d --build
```

## Portainer

1. Go to **Stacks → Add stack**.
2. Select **Repository** as the deployment method.
3. Set the repository URL to `https://github.com/MarioRRom/afterglow-docker.git`.
4. Select the `main` branch.
5. Set the Compose path to `docker-compose.yml`.
6. Add `AFTERGLOW_PORT` under **Environment variables** (default: `8000`).
7. Deploy the stack.

## Updating

Pull the latest changes and rebuild:

```bash
git pull
docker compose up -d --build
```

In Portainer, use **Pull and redeploy** or update the stack from its Git repository.

## Notes

- The container uses the original `serve.sh` script.
- No external image registry or additional services are required.
- Intended for local network use. Avoid exposing the service directly to the Internet.
