SHELL      = /bin/sh

ASFLAGS    = -f elf -F dwarf -g
LDFLAGS    = -m elf_i386

AS         = nasm
LD         = ld

SRC_DIR    = src
OBJ_DIR    = obj
BIN_DIR    = bin

OBJECTS    = example example2 example3 example4 example5 example6 example7 example8 example9 \
			 example10 example11 example12 example13 example14 example15 example16 example17 example18 example19 \
			 example20 example21 example22 example23


all: $(OBJ_DIR) $(BIN_DIR) $(OBJECTS)
.PHONY: all


$(OBJECTS): %: $(OBJ_DIR)/%.o
	$(LD) $(LDFLAGS) -o $(BIN_DIR)/$@ $<
	cat $(SRC_DIR)/gdb.template | sed "s=\`e_name\`=$@=g" > $(BIN_DIR)/$@.gdb

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	$(AS) $(ASFLAGS) -l $(@:.o=.lst) -i $(SRC_DIR) -o $@ $<


$(OBJ_DIR):
	@echo "Создание директории для объектных файлов ..."
	mkdir -p $@


$(BIN_DIR):
	@echo "Создание директории для исполняемых файлов ..."
	mkdir -p $@


clean:
	-rm -f $(OBJ_DIR)/*.o
	-rm -f $(OBJ_DIR)/*.lst
