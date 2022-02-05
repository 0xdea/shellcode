# shellcode
[![](https://img.shields.io/github/stars/0xdea/shellcode.svg?color=yellow)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/github/forks/0xdea/shellcode.svg?color=green)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/github/watchers/0xdea/shellcode.svg?color=red)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/badge/license-MIT%20License-red.svg?color=lightgray)](https://opensource.org/licenses/MIT) 
[![](https://img.shields.io/badge/twitter-%400xdea-blue.svg)](https://twitter.com/0xdea)

> “A vulnerability provides an assembly language for a computer that has never been programmed before, and that was not designed with programmability in mind.” 
> 
> -- @halvarflake 

## x86

* [**setuid-linux.c**](https://github.com/0xdea/shellcode/blob/main/x86/setuid-linux.c). Old setuid/execve shellcode for Linux/x86 (30 bytes).
* [**portbind-linux.c**](https://github.com/0xdea/shellcode/blob/main/x86/portbind-linux.c). Old setuid/portbind shellcode for Linux/x86 (96 bytes).
* [**reusage-linux.c**](https://github.com/0xdea/shellcode/blob/main/x86/reusage-linux.c). Old execve shellcode for Linux/x86 that reuses "/bin/sh" in .rodata (16 bytes).
* [**gets-linux.c**](https://github.com/0xdea/shellcode/blob/main/x86/gets-linux.c). Old stdin-reopen/execve shellcode for Linux/x86, useful against gets() buffer overflows.
* [**raptorcode.c**](https://github.com/0xdea/shellcode/blob/main/x86/raptorcode.c). Old shellcode for Linux/x86 that writes a message to the current tty.
* [**setuid-bsd.c**](https://github.com/0xdea/shellcode/blob/main/x86/setuid-bsd.c). Old setuid/execve shellcode for BSD/x86 (30 bytes).
* [**portbind-bsd.c**](https://github.com/0xdea/shellcode/blob/main/x86/portbind-bsd.c). Old setuid/portbind shellcode for BSD/x86 (94 bytes).
* [**leetcode.c**](https://github.com/0xdea/shellcode/blob/main/x86/leetcode.c). Old setuid/execve shellcode for BSD/x86, with an ASCII message buried in the code.

## SPARC

TBD

## MIPS

TBD