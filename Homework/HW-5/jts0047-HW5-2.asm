;Author: Justin Sawyer
;
;Username: jts0047
;
;Homework #5

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	pt byte "MEMORY"
	key byte "BAD"
	ct byte lengthof pt dup(?)
	decr byte lengthof pt dup(?)

.code
	main proc
	;Calls the encrypt and decrypt proc
		call encrypt
		call decrypt

		invoke ExitProcess, 0
	main endp
	
	encrypt proc
		;Set edx to 0. It will be the index for key
		mov edx, 0
		mov ecx, lengthof pt
		L1:
			;Set esi from 0 - lengthof plaintext. Sets as pointer for pt and ct
			mov esi, lengthof pt
			sub esi, ecx

			;If the index of key is equal to length of key, it will set index back to 0
			cmp edx, lengthof key
			je edxEqualToKey

			;Moves whatever is in pt[esi] in to al, the adds by the proper value
			IL1:
			mov al, pt[esi]
			add al, key[edx]
			sub al, 65

			;If the addition of the key goes over 90 (which is Z) then subtract 26
			cmp al, 90
			ja eaxGreaterThan90

			;Moves what is in al into ct[esi] and increments the pointer for key
			IL2:
			mov ct[esi], al
			inc edx
		loop L1
		jmp EndEncrypt

		;If statement to reset index of key to 0
		edxEqualToKey:
			sub edx, lengthof key
		jmp IL1

		;If statement to bring the al back in to the bounds of the alphabet
		eaxGreaterThan90:
			sub al, 26
		jmp IL2

		EndEncrypt:
		ret
	encrypt endp

	decrypt proc
		;Set edx to 0. It will be the index for key
		mov edx, 0
		mov ecx, lengthof pt
		J1:
			;Set esi from 0 - lengthof plaintext. Sets as pointer for pt and ct
			mov esi, lengthof pt
			sub esi, ecx

			;If the index of key is equal to length of key, it will set index back to 0
			cmp edx, lengthof key
			je edxEqualToKey2

			;Moves what is in ct[esi] into al and then subtracts the proper value
			IJ1:
			mov al, ct[esi]
			sub al, key[edx]
			add al, 65

			;If the subtraction goes under 65 (which is A) then add 26
			cmp al, 65
			jb eaxLesserThan65

			;Moves what is in al into pt[esi] and decr[esi]
			;and increments the pointer for key
			IJ2:
			mov pt[esi], al
			mov decr[esi], al
			inc edx
		loop J1
		jmp EndDecrypt

		;If statement to reset index of key to 0
		edxEqualToKey2:
			sub edx, lengthof key
		jmp IJ1

		;If statement to bring the al back in to the bounds of the alphabet
		eaxLesserThan65:
			add al, 26
		jmp IJ2

		EndDecrypt:
		ret
	decrypt endp
end main