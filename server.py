import socket
import time

def fibonacci(n):
    """Generate Fibonacci series up to n numbers."""
    fib_series = [0, 1]
    for i in range(2, n):
        fib_series.append(fib_series[-1] + fib_series[-2])
    return fib_series

def main():
    host = '127.0.0.1'
    port = 12345

    # Create a TCP socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Bind the socket to the host and port
    server_socket.bind((host, port))

    # Listen for incoming connections
    server_socket.listen(1)
    print("Server is listening on port", port)

    while True:
        # Accept a client connection
        client_socket, addr = server_socket.accept()
        print("Client connected from", addr)

        # Generate Fibonacci series
        fib_series = fibonacci(60)
        total = 0

        # Send numbers to the client
        for num in fib_series:
            print("Sending", num, "to client")
            client_socket.send(str(num).encode())

            # Update total
            total += num

            # Wait for 1 second
            time.sleep(1)

        # Display the total
        print("Total:", total)

        # Close the connection
        client_socket.close()

if __name__ == "__main__":
    main()
