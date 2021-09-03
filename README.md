# fakesudo
> for emulating SU privileges, it is recommended to use **FAKEROOT**.  
  
run sudo commands as regular user.  

## Installing fakesudo
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
