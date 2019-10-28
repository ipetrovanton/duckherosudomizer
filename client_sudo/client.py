import socket
import threading


def shifrator(message):
    crypt = ''
    key = 100
    for i in message:
        crypt += chr(ord(i) ^ key)
    print(crypt)
    return crypt


def read_sok():
    while 1:
        data = sor.recv(1024)
        data = shifrator(data. decode('utf-8'))
        print(data)


server = ('127.0.0.1', 5050)  # Данные сервера
sor = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sor.bind(('', 0))

# Слушаем сокет в отдельном потоке
potok = threading.Thread(target=read_sok)
potok.start()
while 1:
    comand = input()
    comand = shifrator(comand)
    sor.sendto(comand.encode('utf-8'), server)
