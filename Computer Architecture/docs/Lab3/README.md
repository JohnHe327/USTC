# cache 实验所需的文件，包括CPU代码、Cache代码、benchmark生成器

* cache.sv 是我们提供的直接相连cache的代码，需修改为组相连cache。

* main_mem.sv 和 mem.sv 是我们提供的主存代码，cache代码会调用它们

* SourceCoed/Cache 中包含快速排序和矩阵乘法这两种测试样例汇编程序，以及将汇编指令转换为 Verilog 格式指令的 python 脚本 asm2verilogrom.py。使用 python 脚本时需先将 `SourceCode/Cache/riscv32-gnu-toolchain-windows.zip` 解压。

* generate_cache_tb.py 是我们提供的，用于生成独立的、脱离 CPU 的 cache 测试testbench的python代码。

* Simulation 中包含 cache_tb 和 cpu_tb。cache_tb 对 Cache 进行测试，正确读写后 validation_count 变为-1。

了解 Cache 实验的实验安排，请见  Lab3-Cache实验-实验要求.docx

了解 Cache 实验第一阶段的指导，请见 王轩-cache编写指导.docx

了解 Cache 实验第二阶段的指导，请见 王轩-cache实验指导.docx
