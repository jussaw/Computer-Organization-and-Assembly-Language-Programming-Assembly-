;Author: Justin Sawyer
;
;Username: jts0047
;
;Homework #4

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	s1 byte "QWERTYUIOPASDFGHJKLZXCVBNMA"
	s2 byte "ABCDEFGHIJKLMNOPQRSTUVWXYZB"

	c1 byte 26 dup(?)
	c2 byte 26 dup(?)

.code
	main proc
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0

		; This loop will check all the values of the characters in strings 
		; s1 and s2, and will increment those corresponding values (- 65) 
		; in the arrays c1 and c2 (which are of size 26)
		mov ecx, lengthof s1
		L1:
			mov esi, ecx
			mov bl, s1[esi - 1]
			movzx edi, bl
			inc c1[edi - 65]

			mov esi, ecx
			mov bl, s2[esi - 1]
			movzx edi, bl
			inc c2[edi - 65]
		loop L1

		; This loop will compare all the values of c1 and c2 to see if they are equal.
		; If they are equal it means that s1 and s2 are anagrams of each other.
		; If there is an unequivalency then it will jump to the end, and eax will remain 0.
		; If everything is equal then it will set eax to 1.
		mov ecx, lengthof c1
		L2:
			mov esi, ecx
			mov dh, c1[esi -1]
			mov dl, c2[esi- 1]
			cmp dh, dl
			jne Done
		loop L2

		mov eax, 1

		Done:
		invoke ExitProcess, 0
	main endp
end main