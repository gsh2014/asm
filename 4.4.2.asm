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


.DATA                   ; reserve storage for data
prompt1 BYTE    cr,Lf,"����4���ɼ����ֺܷ�ƽ����",cr,Lf,cr,Lf,
				"�������һ���ɼ���", 0
prompt2 BYTE    cr,Lf,"������ڶ����ɼ���", 0
prompt3 BYTE    cr,Lf,"������������ɼ���", 0
prompt4 BYTE    cr,Lf,"��������ĸ��ɼ���",0
string  BYTE    40 DUP (?),0
answer  BYTE    cr,Lf, "�ܷ�Ϊ��"
sum     BYTE    11 DUP (?)
answer1 BYTE    cr,Lf, "ƽ����Ϊ��"
average BYTE    11 DUP (?)
answer2 BYTE    cr,Lf,"����Ϊ��"
remainder BYTE  11 DUP(?)
        BYTE    cr, Lf, 0

.CODE                           ; start of main program code
_start:
        output  prompt1         ;��ʾ�����һ���ɼ�
        input   string, 40       ; read ASCII characters
        atoi    string            ; convert to integer
        mov     bx, ax        ;������ֵ����bx

        output  prompt2         ;��ʾ����ڶ����ɼ�
        input   string, 40
        atoi    string
        add     bx,ax          ;ǰ�����ɼ���Ӳ�����bx

        output  prompt3         ;��ʾ����������ɼ�
        input   string,40
        atoi    string
        add     bx,ax          ;ǰ�����ɼ���Ӳ�����bx

        output  prompt4          ;��ʾ������ĸ��ɼ�
        input   string,40
        atoi    string
        add     bx,ax          ;ǰ�ĸ��ɼ���Ӳ�����bx
        itoa    sum,ax          ;���ܷ�ת����ASCII������sum
        mov     ax,bx

        mov     bx,4            ;����������ebx
        mov     dx,0
        cwd
        div     bx
        itoa    average,ax
        itoa    remainder,dx
        output  answer          ;����ܷ�
        output  answer1
        output  answer2



PUBLIC _start                   ; make entry point public
INVOKE  ExitProcess, 0  ; exit with return code 0

END                             ; end of source code

