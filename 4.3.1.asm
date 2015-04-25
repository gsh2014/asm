;Example assembly language program -- adds two numbers
; Author: Unknown
; Date: 2009-1-1

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack
;note :
;һ�����˵����������ۼ����У�������ֽڳ��ģ������AL�У�������ֳ��������AX�У������˫�ֳ��������eax��
;�Ĵ���eax, ebx, ecxh��edx ��Ϊdata register or general register.��ʱ��eaxҲ���ۼ�������Ϊ�����ڴ洢������Ľ����

.DATA                   ; reserve storage for data
prompt1 BYTE    cr,Lf,"����һ�����ӵ����",cr,Lf,cr,Lf,
				"���������ӵĳ�x��", 0
prompt2 BYTE    cr,Lf,"���������ӵĿ�y��", 0
prompt3 BYTE    cr,Lf,"���������ӵĸ�z��", 0
value  BYTE    40 DUP (?),0
answer  BYTE    cr, Lf, "���ӵ����Ϊ��"
volume  BYTE    11 DUP (?)
        BYTE    cr, Lf, 0

.CODE                           ; start of main program code
_start:
        output  prompt1         ;��ʾ���볤
        input   value, 40       ; read ASCII characters
        atod    value            ; convert to integer
        mov     ebx,     eax        ;������ֵ����ebx

        output  prompt2         ;��ʾ�����
        input   value, 40
        atod    value   
        mul     ebx             ;�󳤳˿��ֵ
        mov     ebx,eax         ;�����˿��ֵ���ڼĴ���ebx��

        output  prompt3         ;��ʾ�����
        input   value,40        ;����z
        atod    value   
        mul     ebx             ;�󳤳˿�˸ߵ�ֵ
        dtoa    volume,eax       ;�������ת��ΪASCII�ַ���������volume
        output  answer          ;���answer��volume

        INVOKE  ExitProcess, 0  ; exit with return code 0

PUBLIC _start                   ; make entry point public

END                             ; end of source code

