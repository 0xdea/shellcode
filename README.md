# shellcode

[![](https://img.shields.io/github/stars/0xdea/shellcode.svg?style=flat&color=yellow)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/github/forks/0xdea/shellcode.svg?style=flat&color=green)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/github/watchers/0xdea/shellcode.svg?style=flat&color=red)](https://github.com/0xdea/shellcode)
[![](https://img.shields.io/badge/twitter-%400xdea-blue.svg)](https://twitter.com/0xdea)
[![](https://img.shields.io/badge/mastodon-%40raptor-purple.svg)](https://infosec.exchange/@raptor)

> “A vulnerability provides an assembly language for a computer that has never been programmed before, and that was not designed with programmability in mind.”
>
> -- Halvar Flake

A collection of new and old shellcode samples.

![](https://raw.githubusercontent.com/0xdea/shellcode/main/.img/dirty.jpg)

## Blog post

* <https://hnsecurity.it/blog/new-and-old-shellcode-samples/>

## Shellcode

### x86

* [**setuid-linux.c**](x86/setuid-linux.c). Old setuid/execve shellcode for Linux/x86 (30 bytes).
* [**portbind-linux.c**](x86/portbind-linux.c). Old setuid/portbind shellcode for Linux/x86 (96 bytes).
* [**reusage-linux.c**](x86/reusage-linux.c). Old execve shellcode for Linux/x86 that reuses "/bin/sh" in .rodata (16 bytes).
* [**gets-linux.c**](x86/gets-linux.c). Old stdin-reopen/execve shellcode for Linux/x86, useful against gets() buffer overflows.
* [**raptorcode.c**](x86/raptorcode.c). Old shellcode for Linux/x86 that writes a message to the current tty.
* [**setuid-bsd.c**](x86/setuid-bsd.c). Old setuid/execve shellcode for BSD/x86 (30 bytes).
* [**portbind-bsd.c**](x86/portbind-bsd.c). Old setuid/portbind shellcode for BSD/x86 (94 bytes).
* [**leetcode.c**](x86/leetcode.c). Old setuid/execve shellcode for BSD/x86, with an ASCII message buried in the code.

### x86_64

* [**read-no-H.s**](x86_64/read-no-H.s). Linux/x86_64 sendfile shellcode without 0x48 bytes.
* [**exec-no-H.s**](x86_64/exec-no-H.s). Linux/x86_64 exec shellcode without 0x48 bytes.
* [**read-no-syscall.s**](x86_64/read-no-syscall.s). Linux/x86_64 sendfile shellcode without 0x0f05 bytes.
* [**read-write.s**](x86_64/read-write.s). Linux/x86_64 file read/write shellcode.
* [**chmod-tiny.s**](x86_64/chmod-tiny.s). 12-bytes Linux/x86_64 chmod 4 shellcode.
* [**exec-tiny.s**](x86_64/exec-tiny.s). 12-bytes Linux/x86_64 exec shellcode.

### SPARC

* [**sparc_solaris_exec.c**](SPARC/sparc_solaris_exec.c). Solaris/SPARC setuid/execve shellcode (60 bytes).
* [**sparc_solaris_chmod.c**](SPARC/sparc_solaris_chmod.c). Solaris/SPARC setuid/chmod/exit shellcode (64 bytes).
* [**sparc_solaris_chmod2.c**](SPARC/sparc_solaris_chmod2.c). Very small Solaris/SPARC chmod shellcode (36 bytes).

### MIPS

* [**mips_n32_msb_linux_revsh.c**](MIPS/mips_n32_msb_linux_revsh.c). Basic MIPS N32 MSB Linux reverse shellcode.
