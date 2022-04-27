temp: test.S
	arm-linux-gcc -g -c -o temp.o test.S
	arm-linux-ld -Ttext 0x00000000 -g temp.o -o temp_elf
	
	arm-linux-objcopy -O binary -S temp_elf run.bin
	arm-linux-objdump -D -m arm temp_elf > run.dis

clean:
	rm -f temp
	rm -f temp.o
	rm -f temp_elf