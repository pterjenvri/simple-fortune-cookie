# Stage 1 — Build the Go binary
FROM golang:1.25-bookworm AS builder

WORKDIR /frontend

# Download dependencies
COPY go.mod ./
RUN go mod download

# Copy source code
COPY . .

# Build binary
RUN CGO_ENABLED=0 GOOS=linux go build -o frontend-app .

# Stage 2 — Minimal runtime image
FROM debian:bookworm-slim

WORKDIR /app

# Copy compiled binary from builder
COPY --from=builder /frontend .

EXPOSE 8080

# Run compiled binary
ENTRYPOINT ["./frontend-app"]
