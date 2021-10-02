.section .data

.section .text
.globl  main
main:
    push    $5
    push    $2
    call    power
    movq    %rdx, %rdi
    movq    $60, %rax
    syscall


power:
    push    %rbp
    movq    %rsp, %rbp

    movq    0x10(%rbp), %rax
    movq    0x18(%rbp), %rdx
mult_loop:
    cmp     $0, %rax
    je      end_loop
    imul    0x18(%rbp), %rdx
    decq    %rax
    jmp     mult_loop

 
end_loop:
    movq %rbp, %rsp
    popq %rbp
    ret
