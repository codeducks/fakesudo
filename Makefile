# DIRECTORIES
OUTPUT_ROOT := ./output/
BUILD_ROOT := ./build/
INSTALL_DIR = /usr/local/bin

# CONFIG
main_bin_name     = sudo
fakeroot_bin_name = $(main_bin_name)
manage_bin_name   = fakesudo

ifdef DEBUG
OUT_DIR   := $(OUTPUT_ROOT)debug
BUILD_DIR := $(BUILD_ROOT)debug
CFLAGS  := -c -Wall -v
else
OUT_DIR   := $(OUTPUT_ROOT)release
BUILD_DIR := $(BUILD_ROOT)release
CFLAGS  := -O2
endif

# EXECUTABLES
MD := mkdir
CP := cp
RM := rm
CC := g++

# DEFINES

.SILENT: create_folders create_config_files compile_manage compile compile_fakeroot copy_to_output copy_to_install clean deep_clean uninstall
setup: create_folders create_config_files

create_folders:
	echo "MD $(BUILD_DIR)"
	@-$(MD) -p $(BUILD_DIR)
	echo "MD $(OUT_DIR)"
	@-$(MD) -p $(OUT_DIR)

create_config_files:
	echo "CP .fakesudo_config -> ~"
	$(CP) ./src/.fakesudo_config ~/.fakesudo_config

compile_manage:
	echo "CC manage.cpp"
	$(CC) ./src/manage.cpp -o $(BUILD_DIR)/$(manage_bin_name) $(CFLAGS)

compile:
	echo "CC sudo.cpp"
	$(CC) ./src/sudo.cpp -o $(BUILD_DIR)/$(main_bin_name) $(CFLAGS)

compile_fakeroot:
	echo "CC fakeroot_sudo.cpp"
	$(CC) ./src/fakeroot_sudo.cpp -o $(BUILD_DIR)/$(fakeroot_bin_name) $(CFLAGS)

copy_to_output:
	echo "CP $(main_bin_name) -> $(OUT_DIR)"
	$(CP) $(BUILD_DIR)/$(main_bin_name) $(OUT_DIR)/$(main_bin_name)
	echo "CP $(manage_bin_name) -> $(OUT_DIR)"
	$(CP) $(BUILD_DIR)/$(manage_bin_name) $(OUT_DIR)/$(manage_bin_name)

copy_to_install: copy_to_output
	echo "CP $(main_bin_name) -> $(INSTALL_DIR)"
	$(CP) $(OUT_DIR)/$(main_bin_name) $(INSTALL_DIR)/$(main_bin_name)
	echo "CP $(manage_bin_name) -> $(INSTALL_DIR)"
	$(CP) $(OUT_DIR)/$(manage_bin_name) $(INSTALL_DIR)/$(manage_bin_name)

clean:
	echo "RM $(BUILD_ROOT)"
	$(RM) -rf $(BUILD_ROOT)

deep_clean: clean
	echo "RM $(OUTPUT_ROOT)"
	$(RM) -rf $(OUTPUT_ROOT)

uninstall:
	echo "RM $(INSTALL_DIR)/$(main_bin_name)"
	rm $(INSTALL_DIR)/$(main_bin_name)
	echo "RM $(INSTALL_DIR)/$(manage_bin_name)"
	rm $(INSTALL_DIR)/$(manage_bin_name)


install: setup compile compile_manage copy_to_install clean
install_fakeroot: setup compile_fakeroot compile_manage copy_to_install clean
bloat: setup compile_fakeroot compile compile_manage copy_to_output
dev: compile
	@echo "-----------"
	./build/release/sudo echo "test"

full_uninstall: uninstall deep_clean
	@echo "goodbye!"
