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
    CMD ["mix", "phx.server"]

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
        $ sudo docker-compose build
```

# Step 3: create the “src” directory and the command “mix” alias.
```zsh 
    $ mkdir src
    $ alias mix="sudo docker-compose run --rm phoenix mix"
```
# Step 4: Initialize and configure a new Phoenix application
## “/app” (the default work directory).


```zsh 
    $ mix phx.new . --app app
```

### Configure your database configuration on file src/config/dev.exs to point to the db container.
```yml
    hostname: "db", 
```

```zsh
    $ cd src
    $ mix ecto.create
    $ mix ecto.migrate
    $ mix ecto.drop
    $ mix ecto.create && mix ecto.migrate

    or 
    $ sudo docker-compose run web mix ecto.create
    $ sudo docker-compose run web mix ecto.migrate
```

# Step 5: Start the application

```zsh
    $ cd ..
    $ sudo docker-compose up
```    


# Phoenix  CND

## Generate Crud use context

```zsh
    $ mix phx.gen.html Car Category categories name:string description:string

    # Add the resource to your browser scope in lib/app_web/router.ex:
    # resources "/categories", CategoryController 

    $ mix phx.gen.html Car Cars cars name:string color:string plaque:string renavam:string \
    year:integer notes:string category_id:references:categories

    # Add the resource to your browser scope in lib/app_web/router.ex:
    # resources "/cars", CarsController

    $ mix phx.gen.html Car Service services name:string description:string value:decimal

    # Add the resource to your browser scope in lib/app_web/router.ex:
    # resources "/services", ServiceController
``` 
## HTML
    docker-compose run --rm phoenix mix phx.gen.html Sales Category categories name:string notes:string

    docker-compose run --rm phoenix mix phx.gen.json Account User users email:string password:string is_active:boolean 

    docker-compose run --rm phoenix mix phx.gen.html Sales Shop shops name:string brand:string address:string notes:string


    docker-compose run --rm phoenix mix phx.gen.html App Order orders ordered:string description:string value:float car_id:references:cars


    mix phx.gen.html ProductDB Product products name:string quantity:integer price:float ppu:float \
    shop:references:shops category_id:references:categories notes:string

## Schema
    docker-compose run --rm phoenix mix phx.gen.schema Sale.Category name:string notes:string

    docker-compose run --rm phoenix mix phx.gen.schema Car.OrderItem order_item name:string order_number:string quantity:integer discount_value:decimal unit_cost_value:decimal total_value:decimal service_id:references:services


## Database
    docker-compose run phoenix mix ecto.create

## Migrate
    docker-compose run --rm phoenix mix ecto.migrate

    docker-compose run --rm phoenix mix run priv/repo/seeds.exs

    docker-compose run --rm phoenix mix seed


## Routes
    docker-compose run --rm phoenix mix phx.routes

## Run 
    docker-compose run phoenix mix phx.server
    docker-compose up

## webpack
    
    node node_modules/webpack/bin/webpack.js --mode development
#### problem in mac 
    use npm install && node node_modules/webpack/bin/webpack.js --mode development
    
    node node_modules/webpack/bin/webpack.js --mode development

    npm install && node node_modules/webpack/bin/webpack.js --mode development
    cd src/assets && yarn install && node node_modules/webpack/bin/webpack.js --mode development

# Creating the Phoenix project

Run in your terminal:

$ mix phx.new books_api --no-html --no-webpack --binary-id && cd books_api

https://medium.com/coding-artist/full-stack-react-with-phoenix-chapter-8-user-authentication-fb1ff48a5e51

https://github.com/michaelmang/full-stack-react-phoenix

https://medium.com/coding-artist/tagged/phoenix-framework


https://dueacaso.it/tech/crud_app_with_phoenix/

https://itnext.io/a-story-of-phoenix-liveview-writing-a-crud-application-d938e52894d4

https://whatdidilearn.info/2018/02/18/authentication-in-phoenix.html