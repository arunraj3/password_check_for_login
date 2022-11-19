GLOBAL _start 

	
section .text

_start :

	jmp main
	
main : 
	mov rax,1
	mov rdi,1
	mov rsi,enter_pwd
	mov rdx,len
	syscall 
	
	mov rax,0
	mov rdi,0
	mov rsi,passwd
	mov rdx,100
	syscall
	
cmp_passwd : 

	mov rsi,original_passwd 
	mov rdi,passwd
	mov rcx,original_passwd_len
	repe cmpsb
	je access_granted
	jne access_denied
	
	
access_granted:
	mov rax,1
	mov rdi,1
	mov rsi,access_granted_msg
	mov rdx,access_granted_msg_len
	syscall 
	jmp exiting_stage
	
access_denied: 
	mov rax,1
	mov rdi,1
	mov rsi,access_denied_msg
	mov rdx,access_denied_msg_len
	syscall 
	
exiting_stage :
	mov rax,60
	mov rdi,0
	syscall
	
section .data   

	enter_pwd : db "Enter your password : "
	len : equ $-enter_pwd 
	
	access_granted_msg : db "Access Granted!",10           
	access_granted_msg_len : equ $-access_granted_msg 
	
	access_denied_msg : db "Access Denied!",10           
	access_denied_msg_len : equ $-access_denied_msg
	
	original_passwd : db "arun"
	original_passwd_len : equ $-original_passwd 
	
	
section .bss 
	
	passwd: resb 100
	
	
	
	
	
	
	
	
	
