# IC Design Environment

This repository contains the containerized development environment for _Devais Semikonduktor dan Rangkaian Terintegrasi_ (DSRT) course. Built on top of the open-source IC design toolchain, this environment ensures that everyone on the team has the exact same EDA tools, dependencies, and OS setup without cluttering their host machines.

## Prerequisites: Installing Docker

Before starting, you must have Docker and Docker Compose installed on your system. Because this container uses GUI tools (via X11 forwarding), Windows and Mac users may need an X-Server.

### Windows

1. Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Enable the WSL2 backend in Docker Desktop settings.
3. Install an X-Server like [VcXsrv](https://sourceforge.net/projects/vcxsrv/) (XLaunch) to render the GUI tools. When launching VcXsrv, check **Disable access control**.

### macOS

1. Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Install [XQuartz](https://www.xquartz.org/) to handle X11 GUI forwarding.
3. Open XQuartz, go to **Settings > Security**, and check **Allow connections from network clients**.

### Linux (Ubuntu/Debian-based)

On Linux, you install the Docker Engine directly (GUI forwarding works natively).

1. Update package index and install prerequisites:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

```


2. Follow the [official Docker Engine guide](https://docs.docker.com/engine/install/).
3. Add your user to the docker group so you don't need `sudo` for every command:
```bash
sudo usermod -aG docker $USER

```


*(Log out and back in for this to take effect).*

---

## Environment Overview

This environment is orchestrated by three main files:

* **`.env`**: Contains safe, non-credential environment variables. By default, it sets the username to `dev`. It also maps your host `UID` and `GID` to avoid file permission issues, and points the `HOST_WS_DIR` to `./workspace`.


* **`Dockerfile`**: Uses `hpretl/iic-osic-tools:latest` as the base image. It installs helpful utilities like `zsh`, `fzf`, `git`, `curl`, and `nano`. It dynamically checks if a user with your UID already exists. If so, it updates the existing user and group. If not, it creates a new user matching your host machine's IDs. Finally, it explicitly maps the `HOME` environment variable to ensure configuration files are loaded correctly from your mounted directory.


* **`compose.yml`**: Defines the `ic_design` service and names the container `dsrt`. It handles the complex hardware passthrough, including mapping `/tmp/.X11-unix` and `/dev/dri` for hardware-accelerated GUI rendering, and mounts your local `./home` and `./workspace` folders directly into the container.

---

## Usage Guide

### Build and Start the Container

To spin up the environment in the background, run:

```bash
docker compose up -d --build

```

* The `--build` flag ensures Docker reads the latest `Dockerfile` and builds the `ic-design-zsh` image.
* The `-d` flag runs the `dsrt` container in the background.

### Access the Environment (Terminal)

The default shell for this container is ZSH. To jump into the terminal, run:

```bash
docker compose exec ic_design zsh

```

You will be dropped into `/home/dev` (or whichever user you defined) with full access to the pre-installed EDA tools via the `/foss/tools/` paths.

### Access the Environment (VS Code)

For code editing and project management, VS Code is recommended:

1. Install the **Dev Containers** extension in VS Code.
2. Open your local project folder in VS Code.
3. Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and select **Dev Containers: Attach to Running Container...**.
4. Select the `dsrt` container. VS Code will attach seamlessly, giving you terminal access and IDE features directly inside the IC toolchain environment.

### Stopping the Environment

When you are done working, spin down the container to free up system resources:

```bash
docker compose down

```