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
# Create app directory and copy the Elixir projects into it
RUN mkdir $APP_HOME
WORKDIR $APP_HOME



# Compile the project
# CMD ["mix", "phx.server"]

# Start exworker
# CMD MIX_ENV=$ENVIRONMENT elixir --sname $APP_NAME -S mix run --no-halt