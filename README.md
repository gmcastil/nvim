Neovim Configuration
--------------------
# Installing language servers

## Lua-Ls
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

## Bash
To install the Bash language server on Mac OS:
```bash
npm i -g bash-language-server
```
## Clangd
This works pretty much out of the box

## VHDL-LS (VHDL Language Server)
```bash
# First, need to install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Clone and build
git clone https://github.com/VHDL-LS/rust_hdl.git
cd rust_hdl
cargo build --release
# Install to a local place
cargo install vhdl_ls
# Copy all of the VHDL libraries to the local location
cp -av vhdl_libraries ~/.local/
```

# Install tree-sitter
The tree-sitter CLI tools are an NPM package, so run
```sh
npm i -g tree-sitter-cli
```

# Additional tools
## Ripgrep
The package manager of choice works fine on Debian
```bash
apt-get install ripgrep
```
or on Mac OS
```bash
brew install ripgrep
```


