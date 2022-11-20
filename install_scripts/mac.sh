#!/bin/bash
brew install --HEAD tree-sitter
brew install --HEAD luajit
brew install --HEAD neovim

brew install lua-language-server
npm i -g typescript
npm install -g @volar/vue-language-server
npm install -g @tailwindcss/language-server

mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/download/2022-11-07/rust-analyzer-aarch64-apple-darwin.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
