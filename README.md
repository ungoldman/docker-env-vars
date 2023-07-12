# docker world

## Docker, Environment Variables, and You

experimenting with different approaches to supplying env vars to docker at build time and run time.

In this repo there are seven (**7**) different ways that env vars are injected into docker at build or runtime, each in surprising and not at all irritating ways.

- `ENV` instruction in Dockerfile (cannot be directly overriden at build time)
- `ARG` instruction in Dockerfile (can override `ENV` at build time but only if assigned to do so)
- `environment` in `compose.yml` (**only evaluated at runtime**)
- `args` in `compose.yml` (can override Dockerfile instructions)
- `.env` file
  - can override `args` during build if explicitly assigned from environment in `compose.yml`, e.g.
    ```
      args:
        NODE_ENV: ${NODE_ENV:-buildtime} # note posix fallback also works here
    ```
- `--build-arg` CLI option used with docker compose CLI for `build` command, e.g.
    ```
      docker compose build --build-arg NODE_ENV=peekaboo
    ```
  this will override `.env` file
- `-e` CLI option used with docker compose CLI for `run` command, e.g.
  ```
    docker compose run -e NODE_ENV=gotcha vartest
  ```
  this will override any settings for an env var at runtime only
