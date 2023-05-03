# Booker

Booker is an application designed to search books using ISBN(International Standard Book Number).

# Backend Setup

The command below will do the following:

- Install dependencies
- Prepare database
- Populate data for authors, publishers and books
- Start the server

```sh
$ cd server && ./bin/setup
```

This is only recommended for first time setup. Once database preparation and dependencies have been installed, the command below can be ran to start the server

```sh
$ cd server && ./bin/rails s
```

Tested using Ruby 3.2.2

## Running the tests

Unit tests are located in the [spec](./server/spec) folder. To run the tests, run the command below

```sh
$ cd server && bundle exec rspec
```

# Frontend Setup

To run the frontend server:

```sh
$ cd client && yarn dev
```

*Note* For demonstration purposes, the server will be ran in development mode. After running the commands above, the web application can be accessed in http://localhost:8080
