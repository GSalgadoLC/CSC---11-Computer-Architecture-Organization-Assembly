
; Begin global variable area
section .data

; Variable name
EXIT_SUCCESS			equ 0

SYS_WRITE				equ 1
SYS_EXIT				equ 60

FD_STDIN				equ 0
FD_STDOUT				equ 1

HELLO_STRING			db	"Hello, my name is Gustavo Salgado.",13,10
HELLO_STRING_LEN		equ $-HELLO_STRING



; Begin uninitialized global variables area
section .bss

; Actual assembly language instructions
section .text

; Entry point of pure assembly programs
global _start
_start:

	; Print a Hello!
	mov rax, SYS_WRITE			; Syscall to write (Code = 0)
	mov rdi, FD_STDOUT			; Write to stdout
	mov rsi, HELLO_STRING		; The string to write
	mov rdx, HELLO_STRING_LEN	; The string length
	syscall

	;Setup the return value and call the exit syscall
	mov rax, SYS_EXIT			; Code = 60
	mov rdi, EXIT_SUCCESS
	syscall
	
