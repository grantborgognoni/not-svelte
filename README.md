# Not Svelte

A full-stack movie browser built with:

- **Frontend:** React Router, React, TypeScript, Tailwind CSS
- **Backend:** Rust, gRPC (tonic), Protocol Buffers

## Features

- Movie listing and detail views
- Typesafe API via gRPC and protobuf
- Modern React Router-based routing
- Tailwind CSS styling

## Development

```bash
npm install
npm run dev
```

See the package.json, uses concurrently to run both the server and app at the same time.

## Project Structure

- `app/` – React frontend
- `server/` – Rust gRPC backend
- `server/proto/` – Protobuf definitions
