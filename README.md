Neovim Configuration
--------------------
# Installing language servers
To install the Lua language server on Mac OS:
```sh
brew install lua-language-server
```
This isn't available in the standard Debian repositories, so it'll need to be built from source.
```sh
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh
```
Unfortunately, there does not appear to be a simple way to install it
locally and there are plenty of path dependancies that the tool has.
It seems to be structured more as a web application than as an actual
program to be installed. The easiest way is to just leave it in place
and use a wrapper script that points to it.

To install the Bash language server on Mac OS:
```bash
npm -i -g bash-language-server
```


