#!/bin/sh

# Dirs
mkdir -p bin
mkdir -p obj

# Clean up old objects
rm -rf obj/*
rm -rf bin/*

# Build tutorials
for t_name in $(ls | grep .asm | sed -e "s/.asm//g")
do
    nasm -f elf -F dwarf -g -l "obj/${t_name}.lst" -o "obj/${t_name}.o" "${t_name}.asm"
    ld -m elf_i386 -o "bin/${t_name}" "obj/${t_name}.o"

    cat << EOT > "bin/${t_name}.gdb"
tui enable
layout src
layout regs
set language asm
set disassembly-flavor intel
set disassemble-next-line on
file bin/${t_name}
b _start
run
EOT
done