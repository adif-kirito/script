import threading
import math

class PiThread(threading.Thread):
    def __init__(self):
        super().__init__()

    def run(self):
        print("Calculating Pi...")
        pi_digits = str(math.pi)
        print("First 10 digits of Pi:", pi_digits[:11])

class SquareThread(threading.Thread):
    def __init__(self):
        super().__init__()

    def run(self):
        print("Calculating Square of 10,000,000...")
        square = [i * i for i in range(10000000)]
        print("Square of 10,000,000 calculated.")

class CubeThread(threading.Thread):
    def __init__(self):
        super().__init__()

    def run(self):
        print("Calculating Cube of 10,000,000...")
        cube = [i * i * i for i in range(10000000)]
        print("Cube of 10,000,000 calculated.")

def main():
    pi_thread = PiThread()
    square_thread = SquareThread()
    cube_thread = CubeThread()

    pi_thread.start()
    square_thread.start()
    cube_thread.start()

    pi_thread.join()
    square_thread.join()
    cube_thread.join()

    print("All threads completed.")

if __name__ == "__main__":
    main()
