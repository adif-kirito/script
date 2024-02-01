#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>

#define SERVER_IP "127.0.0.1"
#define SERVER_PORT 12345
#define BUFFER_SIZE 1024

int main() {
    int sockfd;
    struct sockaddr_in server_addr;
    char buffer[BUFFER_SIZE];

    // Create UDP socket
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    // Initialize server address
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = inet_addr(SERVER_IP);
    server_addr.sin_port = htons(SERVER_PORT);

    // Ask the user for a range of two numbers
    int start, end;
    printf("Enter the range of two numbers (start end): ");
    scanf("%d %d", &start, &end);

    // Generate a random number within the given range
    int random_number = rand() % (end - start + 1) + start;
    printf("Generated random number: %d\n", random_number);

    // Send the random number to the server
    if (sendto(sockfd, &random_number, sizeof(random_number), 0, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
        perror("sendto");
        exit(EXIT_FAILURE);
    }

    // Receive the result of the prime number check from the server
    int result;
    socklen_t server_addr_len = sizeof(server_addr);
    ssize_t recv_len = recvfrom(sockfd, &result, sizeof(result), 0, (struct sockaddr *)&server_addr, &server_addr_len);
    if (recv_len == -1) {
        perror("recvfrom");
        exit(EXIT_FAILURE);
    }

    // Display whether the number is prime or not
    printf("Number %d is %s\n", random_number, result ? "prime" : "not prime");

    // Close the socket
    close(sockfd);

    return 0;
}
