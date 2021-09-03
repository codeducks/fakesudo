# fakesudo
> for emulating SU privileges, it is recommended to use **FAKEROOT**.  
  
run sudo commands as regular user.  

## Installing fakesudo
> YOU NEED [nlohmann's C++ JSON](https://github.com/nlohmann/json) LIB! 

run the following:
> If you want to keep using sudo under alias, change the binary name. (or use something like "doas" instead.)
```
# run this as sudo user, to avoid conflicts with permissions

make install

# for a program that uses fakeroot install it like this:

make install_fakeroot

```

### fakeroot fakesudo
fakesudo's fakeroot just uses the "fakeroot" binary.  
To change this you can just change the fakeroot name in the `fakeroot_sudo.cpp` file.  

## Managing fakesudo
currently fakesudo has one purpose and does not need managing.  
If there is an update just pull the repo and run `make install` again.  

## MAKEFILE
this is the guide for setting your flags.
```
CC          = COMPILER
CFLAGS      = same as CFLAGS

BUILD_DIR   = directory of builds
OUT_DIR     = directory of output
INSTALL_DIR = directory of installs

main_bin_name    = fakesudo binary name
manage_bin_name  = manager binary name

install_dir = upon using 'make install' you can set the install directory.

```
makefile things:  

``` makefile
install: installs the program (run this as super user)
install_fakeroot: installs the fakeroot variant. (run this as super user)
uninstall: speaks for itself (run this as super user)
full_uninstall: uninstalls itself plus all the created folders
bloat: compiles everything (don't use this)
dev: compiles the binaries in ./build/.
deep_clean: removes all created directories.
clean: removes just ./build/
setup: creates folders and configs
```

