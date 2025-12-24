###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = 8086
COMPILER = "MASM32"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/c /Zd /Zi
LDFLAGS=/CODEVIEW

## Processing Tools
ASM=ml.exe
LD=link16.exe
#  W:/FBE-8086/微机原理与接口技术实验系统(FB-EDU-P86-A)-v302-P85/BaseProjects/8086_ASM_Projects/Exp20 步进电机/8086/Debug/Debug.exe: TOOL=LD
#     W:/FBE-8086/微机原理与接口技术实验系统(FB-EDU-P86-A)-v302-P85/BaseProjects/8086_ASM_Projects/Exp20 步进电机/8086/Debug/main.obj: TOOL=ASM
#        W:/FBE-8086/微机原理与接口技术实验系统(FB-EDU-P86-A)-v302-P85/BaseProjects/8086_ASM_Projects/Exp20 步进电机/8086/main.asm

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
