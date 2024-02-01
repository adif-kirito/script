import socket

def main():
    host = '127.0.0.1'
    port = 12345

    # Create a TCP socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Connect to the server
    client_socket.connect((host, port))
    print("Connected to server on port", port)

    # Receive numbers from the server
    received_numbers = []
    for _ in range(60):
        # Receive number from the server
        data = client_socket.recv(1024).decode()
        received_numbers.append(int(data))
        print("Received:", data)

    # Close the connection
    client_socket.close()

if __name__ == "__main__":
    main()
