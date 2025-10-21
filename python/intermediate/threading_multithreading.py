from multiprocessing import Process
from threading import Thread
import os
import time

def square_numbers():
	for i in range(50):
		print(i)
		time.sleep(0.2)

"""
processes = []
num_processes = os.cpu_count()
print(num_processes)

for i in range(num_processes):
	p = Process(target = square_numbers )
	processes.append(p)

for p in processes:
	p.start()

for p in processes:
	p.join()

print("end main")
"""

threads = []
num_threads = 2

for i in range(num_threads):
	t = Thread(target = square_numbers)
	threads.append(t)

for t in threads:
	t.start()

for t in threads:
	t.join()

print("End main")
