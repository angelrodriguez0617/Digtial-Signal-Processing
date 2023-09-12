
output = []
with open('data_files/output.bin', 'br') as f:
    while True:
        two_byte = f.read(2)
        if two_byte == '':
            break
        output.append(int(two_byte, 2))

print(len(output))