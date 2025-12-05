# Use Go image
FROM golang:1.25-alpine AS builder

WORKDIR /app

# Go modules
COPY go.mod go.sum ./
RUN go mod download

# Source code
COPY . .

# Build source
RUN go build -o api ./cmd/api 

# I don't know!
FROM alpine:latest
WORKDIR /app

# Copy binary
COPY --from=builder /app/api .

# Expose API port
EXPOSE 8080

# Resources
COPY quotes.json .

# Run 
CMD ["./api"]
