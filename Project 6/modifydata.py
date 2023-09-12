from scipy.io import wavfile
import numpy as np

impulse = wavfile.read('/home/snekmaster/Documents/impulse_response2.wav')

impulse_response = np.array([])
size = int(impulse[1].shape[0]/4)

with open('impulse_response.c', 'w') as file:
    file.write(f'uint8_t impulse_response [{size}] = ' + '{')
    for i in impulse[1]:
        if i % 4 == 0:
            file.write(f'{i},\n')
            impulse_response = np.append(impulse_response, i)
    file.write('};')

fs = int(impulse[0]/4)
print(fs)
print(impulse_response.shape)
wavfile.write("new_impulse_response.wav", fs, impulse_response.astype(np.uint8))

echo = wavfile.read('/home/snekmaster/Documents/echo.wav')

echo2 = np.array([])
size = int(echo[1].shape[0]/4)
with open('echo.c', 'w') as file:
    file.write(f'uint8_t echo [{size}] = ' + '{')
    for i in echo[1]:
        if i % 4 == 0:
            file.write(f'{i},\n')
            echo2 = np.append(echo2, i)
    file.write('};')

fs = int(echo[0]/4)
print(fs)
print(echo2.shape)
wavfile.write("new_echo.wav", fs, echo2.astype(np.uint8))