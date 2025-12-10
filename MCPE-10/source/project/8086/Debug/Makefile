###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = 8086
COMPILER = "MASM32"
TARGET = Debug
SHELL = C:\WINDOWS\system32\cmd.exe

## Tools general options
ASMFLAGS=/c /Zd /Zi
LDFLAGS=/CODEVIEW

## Processing Tools
ASM=ml.exe
LD=link16.exe
#  J:/微机接口技术B款/2020.5程序/微机原理B型资料包_V8.10 1.0/Project_8086/Project_ASM/Exp10 8255/8086/Debug/Debug.exe: TOOL=LD
#     J:/微机接口技术B款/2020.5程序/微机原理B型资料包_V8.10 1.0/Project_8086/Project_ASM/Exp10 8255/8086/Debug/main.obj: TOOL=ASM
#        J:/微机接口技术B款/2020.5程序/微机原理B型资料包_V8.10 1.0/Project_8086/Project_ASM/Exp10 8255/8086/main.asm

# Build tree:
all:	Debug

Debug:	Debug.exe

Debug.exe:	main.obj 
	$(LD) $(LDFLAGS) main.obj,Debug.exe,nul.map,,,

main.obj:	../main.asm 
	$(ASM) $(ASMFLAGS) ../main.asm

# tidy - delete all temporary files which are not involved in the target generation
tidy:

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.exe
	rm -rf main.obj
