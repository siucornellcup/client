import socket
import time
import json
import sys

patient = {"name":{"first":"john","last":"hinklemeier"}, "age":52, "height":{"feet":6, "inches":3.25}, "weight":183}
patient_dump = json.dumps(patient)
size = sys.getsizeof(patient_dump)

s = socket.socket()
host = '10.88.80.115'  # 'StevenBLaptop-Debian' # socket.gethostname()
port = 12349

s.connect((host, port))
time.sleep(2)
s.send(str(size))
s.send(patient_dump)
print s.recv(1024)
s.close
