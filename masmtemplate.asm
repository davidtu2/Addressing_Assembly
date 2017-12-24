TITLE Homework 4              (David Tu_Homework 4_Visual Studio 2013_ver1.asm)

; This program uses indexed addressing to reverse the elements of the array, source
; into the target array, dwarray
; David Tu
; Creation Date: 3/8/2016
; Revisions: Version 1
; Date: 3/8/2016
; Modified By: 3/8/2016

INCLUDE Irvine32.inc

.data

source DWORD 3,5,7,9,13,15,17,19
dwarray DWORD SIZEOF source DUP(0)

.code
main PROC

	mov esi, 0						;Initialize esi and edi
	mov edi, 0
	add esi, SIZEOF source			;Index will point after 19
	sub esi, TYPE source			;Now it should point to 19
	mov ecx, LENGTHOF source		;Initialize the counter

L1:
	mov eax, source[esi]			;Should be 19,17,15,13,9,7,5,3
	mov dwarray[edi], eax			;Starting from the 1st index, move the content of eax into dwarray
	add edi, TYPE dwarray			;Go to next element in dwarray
	sub esi, TYPE source			;Go to previous element in source array
	loop L1

	mov esi, OFFSET dwarray			;setup for DumpMem procedure
	mov ecx, LENGTHOF dwarray
	mov ebx, TYPE dwarray

	call DumpMem
	call DumpRegs
	call WaitMsg


	exit
main ENDP
END main