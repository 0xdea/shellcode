/*
 * $Id: raptorcode.c,v 1.3 2004/06/02 12:22:30 raptor Exp $
 *
 * raptorcode v1.0 - simple shellcode for Linux/x86
 * Copyright (c) 2000 Raptor <raptor@antifork.org>
 *
 * This shellcode prints "Raptor owns your safe\n"
 * to the current tty (no need to setreuid(0, 0))
 *
 */


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * ASM Code                                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *       subl %eax, %eax
 *       subl %ebx, %ebx
 *       subl %ecx, %ecx
 *       subl %edx, %edx
 *
 *       jmp 0x1e
 *       popl %esi
 *       leal (%esi), %ebx
 *       movb %edx,0x8(%ebx)
 *
 *       # fd = open("/dev/tty", O_RDWR|O_NONBLOCK|O_APPEND)
 *       movb $5, %al
 *       movw $06002, %cx
 *       int  $0x80
 *
 *       leal 0x9(%ebx), %ecx
 *       movl %eax, %ebx
 *
 *       # write(fd, BUFFER, sizeof(BUFFER))
 *       movb $4, %al
 *       movb $17, %dx
 *       int  $0x80
 *
 *       # exit(0);
 *       subl %eax, %eax
 *       inc  %eax
 *       int $0x80
 *
 *       call -0x23
 *       .ascii "/dev/tty Raptor owns your safe\n"
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


char code[]=    "\x29\xc0\x29\xdb\x29\xc9\x29\xd2\xeb\x1e\x5e\x8d"
"\x1e\x88\x53\x08\xb0\x05\x66\xb9\x02\x0c\xcd\x80\x8d\x4b\x09\x89"
"\xc3\xb0\x04\xb2\x17\xcd\x80\x29\xc0\x40\xcd\x80\xe8\xdd\xff\xff"
"\xff\x2f\x64\x65\x76\x2f\x74\x74\x79\x20\x52\x61\x70\x74\x6f\x72"
"\x20\x6f\x77\x6e\x73\x20\x79\x6f\x75\x72\x20\x73\x61\x66\x65\x0a";


main()
{
	int (*funct)();
  	funct = (int (*)()) code;
  	(int)(*funct)();
}
