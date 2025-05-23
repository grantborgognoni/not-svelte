# Not Svelte

A full-stack college football stat app (I was going to do college football coach salaries but didn't want to catch the heat that could come from that)

- **Frontend:** React, TypeScript, Tailwind CSS
- **Backend:** Rust, gRPC (tonic), Protocol Buffers, sqlx, SQLite
- **Database:** SQLite

## Path Forward

A prediction layer for future seasons.

## Features

- College football team stats listing and detail views
- Typesafe API via gRPC and protobuf
- React Router-based routing
- Tailwind CSS styling
- Flexible backend queries (by season, team, etc.)
- SQL FTS5 Virtual tables for full-text search
- SQL indexes for query performance

## Requirements

- [Rust](https://www.rust-lang.org/tools/install)
- [Node.js & npm](https://nodejs.org/)
- [SQLite](https://www.sqlite.org/)
- A valid `.env` file in `server/` with `DATABASE_URL` and `GRPC_ADDR` set (see .env.example)

## Development

1. Install Rust and SQLite.
2. Create a `.env` file in `server/` with:
   ```
   DATABASE_URL=sqlite:server/db/cfb_clean.db
   ```
3. To start the developement environment run:
   ```bash
   npm install
   npm run dev
   ```

See the `package.json`: The frontend and backend are run concurrently for development.
If you need to rebuild the database, use

## Project Structure

- `app/` – React frontend
- `server/` – Rust gRPC backend
- `server/proto/` – Protobuf definitions
- `server/db/` – SQLite database and migration scripts
