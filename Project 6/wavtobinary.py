import wave

divider = 4

counter = 0
with wave.open('impulse.wav', 'r') as impulse:
    with open('data_files/impulse.bin', 'bw') as f:
        while True:
            frame = impulse.readframes(1)
            if frame == b'':
                break
            elif counter % divider == 0:
                f.write(frame)
            counter = counter + 1

counter = 0
with wave.open('audio.wav', 'r') as audio:
    with open('data_files/audio.bin', 'bw') as f:
        while True:
            frame = audio.readframes(1)
            if frame == b'':
                break
            elif counter % divider == 0:
                f.write(frame)
            counter = counter + 1