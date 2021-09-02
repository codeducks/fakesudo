# COMPILE
cc    = g++
flags = -g

build_dir  = ./build
fake_bin   = sudo
manage_bin = fakesudo

# SYS
final_dir = /usr/local/bin

define compile_prod
	$(cc) sudo.cpp   -o $(build_dir)/$(fake_bin)   $(flags)
	$(cc) manage.cpp -o $(build_dir)/$(manage_bin) $(flags)
endef

install:
	$(compile_prod)

	cp $(build_dir)/$(fake_bin)   $(final_dir)
	cp $(build_dir)/$(manage_bin) $(final_dir)

compile:
	$(compile_prod)
