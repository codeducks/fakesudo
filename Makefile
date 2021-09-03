# COMPILE
cc    = g++
flags = -g

build_dir  = ./build
fake_bin   = sudo
manage_bin = fakesudo

# SYS
final_dir = /usr/local/bin


# DEFINES
define compile_default
	$(cc) ./src/sudo.cpp   -o $(build_dir)/$(fake_bin)   $(flags)
	$(cc) ./src/manage.cpp -o $(build_dir)/$(manage_bin) $(flags)
endef

define compile_fakeroot
	$(cc) ./src/fakeroot_sudo.cpp -o $(build_dir)/$(fake_bin)   $(flags)
	$(cc) ./src/manage.cpp        -o $(build_dir)/$(manage_bin) $(flags)
endef


define default_files
	cp ./src/.fakesudo_config ~/.fakesudo_config
endef


define default_install
	cp $(build_dir)/$(fake_bin)   $(final_dir)
	cp $(build_dir)/$(manage_bin) $(final_dir)
endef


# SCRIPTS

install:
	$(compile_default)
	$(default_files)
	$(default_install)

install_fakeroot:
	$(compile_fakeroot)
	$(default_files)
	$(default_install)

dev:
	$(default_files)
	$(compile_default)

dev_fakeroot:
	$(default_files)
	$(compile_fakeroot)

compile:
	$(compile_prod)
