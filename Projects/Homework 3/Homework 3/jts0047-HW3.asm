;Author: Justin Sawyer
;
;Username: jts0047	
;
;Homework #3
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	input byte 5h,0Ah,3h,6h,0Ch, 0Fh, 3h, 8h, 9h, 0Bh, 0Dh
	shift dword 8
	output byte lengthof input dup(?)

.code
	main proc
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0
		mov esi, 0

		;Sets eax to the (amount of elements in array) - (shift value).
		;So in our case eax is set to 5 - 3 = 2.
		mov al, lengthof input
		sub eax, shift

		;This loop will put all the values from the beginning up to
		;(shift - n)th postion in the output array but shifted to correct position.
		mov ecx, eax
		J:
			;Sets esi equal to esi - cl (counter) 
			mov esi, eax
			sub esi, ecx

			;Puts the value of input[esi] to output [ebx + lengthof input]
			mov dl, input[esi]

			mov esi, lengthof input
			sub esi, ecx
			mov output[esi], dl
		loop J

		;Sets ecx equal to length of input - al
		;So in this case it ecx would be 5 - 2 = 3
		mov ecx, lengthof input
		sub cl, al

		;This loop moves the numbers at the end at (n - shift)th position to
		;the beggining of output.
		mov eax, ecx
		K:
			;Sets esi equal to esi - cl (counter) 
			mov esi, lengthof input
			sub esi, ecx

			;Puts the value of input[esi] to output [ebx + lengthof input]
			mov dl, input[esi]

			;Moves the items in the end of input
			;to the beginning of output
			mov esi, eax
			sub esi, ecx
			mov output[esi], dl
		loop K

		invoke ExitProcess, 0
	main endp
end main