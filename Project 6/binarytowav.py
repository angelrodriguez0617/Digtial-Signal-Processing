import wave

with wave.open('output.wav', 'w') as output:
    with open('data_files/output.bin', 'br') as f:
        output.setnchannels(1)
        output.setsampwidth(2)
        output.setframerate(2756)
        output.setnframes(3543)
        output.writeframes(f.read(-1))
        output.close()