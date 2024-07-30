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

# Prompt user for EVM address
read -p "Enter your EVM address: " EVM_ADDR

# Direktori data
DATA_DIR="./data/data"
CYSIC_DIR="./data/cysic"

# Menarik Docker image terbaru
echo -e "${GREEN}Pulling latest Docker image...${NC}"
docker pull whoami39/cysic-verifier:latest

# Menjalankan Docker container
echo -e "${GREEN}Running Docker container...${NC}"
docker run -e EVM_ADDR="$EVM_ADDR" \
           -v $DATA_DIR:/app/data \
           -v $CYSIC_DIR:/root/.cysic/ \
           --network host \
           whoami39/cysic-verifier:latest
