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
;一个被乘的数总是在累加器中，如果是字节长的，则放在AL中，如果是字长，则放在AX中，如果是双字长，则放在eax中
;寄存器eax, ebx, ecxh和edx 称为data register or general register.有时候eax也是累加器，因为它用于存储许多计算的结果。

.DATA                   ; reserve storage for data
prompt1 BYTE    cr,Lf,"计算一个箱子的体积",cr,Lf,cr,Lf,
				"请输入箱子的长x：", 0
prompt2 BYTE    cr,Lf,"请输入箱子的宽y：", 0
prompt3 BYTE    cr,Lf,"请输入箱子的高z：", 0
value  BYTE    40 DUP (?),0
answer  BYTE    cr, Lf, "箱子的体积为："
volume  BYTE    11 DUP (?)
        BYTE    cr, Lf, 0

.CODE                           ; start of main program code
_start:
        output  prompt1         ;提示输入长
        input   value, 40       ; read ASCII characters
        atod    value            ; convert to integer
        mov     ebx,     eax        ;将长的值存人ebx

        output  prompt2         ;提示输入宽
        input   value, 40
        atod    value   
        mul     ebx             ;求长乘宽的值
        mov     ebx,eax         ;将长乘宽的值放在寄存器ebx中

        output  prompt3         ;提示输入高
        input   value,40        ;输入z
        atod    value   
        mul     ebx             ;求长乘宽乘高的值
        dtoa    volume,eax       ;将最后结果转换为ASCII字符集并存入volume
        output  answer          ;输出answer和volume

        INVOKE  ExitProcess, 0  ; exit with return code 0

PUBLIC _start                   ; make entry point public

END                             ; end of source code

