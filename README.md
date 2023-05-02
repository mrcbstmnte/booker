# Booker

Booker is an application designed to search books using ISBN(International Standard Book Number).

# Backend Setup

The command below will do the following:

- Install dependencies
- Prepare database
- Populate data for authors, publishers and books
- Start the server

```sh
$ ./bin/setup
```

Tested using Ruby 3.2.2

# Frontend Setup

To run the frontend server:

```sh
$ cd client && yarn dev
```

*Note* For demonstration purposes, the server will be ran in development mode. After running the commands above, the web application can be accessed in http://localhost:8080
