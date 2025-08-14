# Stage 1 — Build the Go binary
FROM golang:1.25-bookworm AS builder

WORKDIR /backend

# Download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build binary
RUN CGO_ENABLED=0 GOOS=linux go build -o backend-app .

# Stage 2 — Minimal runtime image
FROM debian:bookworm-slim

WORKDIR /app

# Copy compiled binary from builder
COPY --from=builder /backend/backend-app .

EXPOSE 9000

# Run compiled binary
ENTRYPOINT ["./backend-app"]
