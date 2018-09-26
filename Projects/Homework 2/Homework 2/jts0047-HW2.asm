;Author: Justin Sawyer
;
;Username: jts0047
;
;Homework #2

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; Declares the input array and shift variables (h signifies hexadecimal)
	input BYTE 1h,2h,3h,4h,5h,6h,7h,8h
	shift BYTE 2h

.code
	main proc
		; Sets the EAX, EBX, ECX, and EDX registers to zero
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0

		; Moves the first and second values from input into EAX then
		; adds shift to both of the values
		mov ah, input
		add ah, shift
		mov al, input + 1
		add al, shift
		
		; Moves the third and fourth values from input into EBX then
		; adds shift to both of the values
		mov bh, input + 2
		add bh, shift
		mov bl, input + 3
		add bl, shift

		; Moves the fifth and sixth values from input into ECX then
		; adds shift to both of the values
		mov ch, input + 4
		add ch, shift
		mov cl, input + 5
		add cl, shift

		; Moves the seventh and eigth values from input into EDX then
		; adds shift to both of the values
		mov dh, input + 6
		add dh, shift
		mov dl, input + 7
		add dl, shift

		invoke ExitProcess, 0
	main endp
end main