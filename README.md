# Project Elixir crud Web and docker

# Step 1: create those files below to your project directory `Dockerfile`
```Dockerfile
    FROM elixir:latest

    # Install hex package manager
    # By using --force, we don’t need to type “Y” to confirm the installation
    RUN apt-get update && \
        apt-get install -y postgresql-client && \
        apt-get install -y inotify-tools && \
        apt-get install -y nodejs && \
        curl -L https://npmjs.org/install.sh | sh && \
        mix local.hex --force && \
        mix archive.install hex phx_new 1.5.3 --force && \
        mix local.rebar --force

    ENV APP_HOME /app

    RUN mkdir $APP_HOME
    WORKDIR $APP_HOME
    # Compile the project
    # CMD ["mix", "phx.server"]

    # Start exworker
    # CMD MIX_ENV=$ENVIRONMENT elixir --sname $APP_NAME -S mix run --no-halt
```

```yml
    version: "3"

    services:
    phoenix:
        build: .
        container_name: phoenix_web
        volumes:
        - ./src:/app
        ports:
        - "4000:4000"
        depends_on:
        - db
    db:
        image: postgres:9.6
        container_name: phoenix_db 
        environment:
        POSTGRES_USER: postgres
        POSTGRES_PASSWORD: postgres
        PGDATA: /var/lib/postgresql/data/pgdata
        restart: always
        volumes:
        - ./pgdata:/var/lib/postgresql/data
```

# Step 2: build the image
```zsh
        $ docker-compose build
```

# Step 3: create the “src” directory and the command “mix” alias.
```zsh 
    $ mkdir src
    $ alias mix="sudo docker-compose run --rm phoenix mix"