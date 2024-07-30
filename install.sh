#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Display ASCII art
echo -e "${RED}  ________  ___      ___  ________   ${NC}"
echo -e "${GREEN} /\"       )|\"  \\    /\"  ||\"      \"\\  ${NC}"
echo -e "${YELLOW}(:   \\___/  \\   \\  //   |(.  ___  :) ${NC}"
echo -e "${BLUE} \\___  \\    /\\\\  \\/.    ||: \\   ) || ${NC}"
echo -e "${MAGENTA}  __/  \\\\  |: \\.        |(| (___\\ || ${NC}"
echo -e "${CYAN} /\" \\   :) |.  \\    /:  ||:       :) ${NC}"
echo -e "${RED}(_______/  |___|\\__/|___|(________/  ${NC}"

# Prompt untuk memasukkan EVM address
read -p "Masukkan EVM Address Anda: " EVM_ADDR

# Buat file docker-compose.yml
echo "version: '3.8'

services:
  verifier:
    image: whoami39/cysic-verifier:latest
    environment:
      - EVM_ADDR=$EVM_ADDR
    volumes:
      - ./data/data:/app/data
      - ./data/cysic/:/root/.cysic/
    network_mode: 'host'
    restart: unless-stopped
" > docker-compose.yml

# Buat direktori yang diperlukan
mkdir -p ./data/data ./data/cysic

# Jalankan docker-compose
docker-compose up -d
