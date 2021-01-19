; Author: Jonathan White


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    s1 byte "GARDEN"
    s2 byte "DANGER"
    c1 byte 26 dup(0)               ;counter for each letter in s1
    c2 byte 26 dup(0)               ;counter for each letter in s2
.code
    main proc
        mov eax, 0                  ;we will assume that we do not have an anagram
		mov eax, 1
		mov ebx, 0
		mov ecx, 0
        move ecx, sizeof s1         ;(1) iterate lengthof s1 times

        CounterLoop:                ;this will increment the proper 'elements' of c1 and c2
            movzx edi, s1[esi]      ;move the value from s1 into edi
            
            inc c1[edi - 65]        ;(2) increment the counter at the value - 65. 

            movzx edi, s2[ecx - 1]  ;(3) Do the same procedure for s2
            inc c2[edi - 65]        ;(4) increment the second counter at the value - 65.

            inc esi                 ;increment esi
            loop CounterLoop        ;after this loop terminates our couter arrays will have the proper values

            ?                       ;(5) start checking the counter arrays at 'index' 0

            ?                       ;(6)iterate lengthof c1 times

        VerifyLoop:			
            mov bl, c1[ecx - 1]     ;(7) move value of c1 into bl

            cmp bl, c2[ecx - 1]     ;(8) check bl vs the value of c2

            JNE NoAna			    ;(9) if they are not equal then we do not have an anagram.  jump to NoAna

            inc esi                 ;increment esi
            loop VerifyLoop
            mov eax, 1              ;if the loop terminates and we have not jumped then we know we have an anagram

            ; you can uncomment the following line to print out the result
            ; call WriteInt

        NoAna:
            invoke ExitProcess, 0

    main endp
end main