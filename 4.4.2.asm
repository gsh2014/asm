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
prompt1 BYTE    cr,Lf,"计算4个成绩的总分和平均分",cr,Lf,cr,Lf,
				"请输入第一个成绩：", 0
prompt2 BYTE    cr,Lf,"请输入第二个成绩：", 0
prompt3 BYTE    cr,Lf,"请输入第三个成绩：", 0
prompt4 BYTE    cr,Lf,"请输入第四个成绩：",0
string  BYTE    40 DUP (?),0
answer  BYTE    cr,Lf, "总分为："
sum     BYTE    11 DUP (?)
answer1 BYTE    cr,Lf, "平均分为："
average BYTE    11 DUP (?)
answer2 BYTE    cr,Lf,"余数为："
remainder BYTE  11 DUP(?)
        BYTE    cr, Lf, 0

.CODE                           ; start of main program code
_start:
        output  prompt1         ;提示输入第一个成绩
        input   string, 40       ; read ASCII characters
        atoi    string            ; convert to integer
        mov     bx, ax        ;将长的值存人bx

        output  prompt2         ;提示输入第二个成绩
        input   string, 40
        atoi    string
        add     bx,ax          ;前两个成绩相加并存入bx

        output  prompt3         ;提示输入第三个成绩
        input   string,40
        atoi    string
        add     bx,ax          ;前三个成绩相加并存入bx

        output  prompt4          ;提示输入第四个成绩
        input   string,40
        atoi    string
        add     bx,ax          ;前四个成绩相加并存入bx
        itoa    sum,ax          ;将总分转换成ASCII并存入sum
        mov     ax,bx

        mov     bx,4            ;将除数存入ebx
        mov     dx,0
        cwd
        div     bx
        itoa    average,ax
        itoa    remainder,dx
        output  answer          ;输出总分
        output  answer1
        output  answer2



PUBLIC _start                   ; make entry point public
INVOKE  ExitProcess, 0  ; exit with return code 0

END                             ; end of source code

