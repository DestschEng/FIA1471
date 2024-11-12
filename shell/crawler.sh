#!/bin/bash

# Set output directory
OUTPUT_DIR="yahoo_finance_data"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to log messages
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$OUTPUT_DIR/crawler.log"
}

# Function to download Yahoo Finance data
download_yahoo_data() {
    local symbol=$1
    local filename="$OUTPUT_DIR/raw_${symbol}_${TIMESTAMP}.json"
    
    # Current timestamp in seconds
    local current_timestamp=$(date +%s)
    # Timestamp for 24 hours later
    local end_timestamp=$((current_timestamp + 86400))
    
    local url="https://query1.finance.yahoo.com/v8/finance/chart/${symbol}?period1=${current_timestamp}&period2=${end_timestamp}&interval=1m&includePrePost=true&events=div%7Csplit%7Cearn&&lang=en-US&region=US"
    
    log_message "Starting download for $symbol"
    
    if curl -s -o "$filename" \
        "$url" \
        -H 'accept: */*' \
        -H 'accept-language: en-US,en;q=0.9' \
        -H 'origin: https://finance.yahoo.com' \
        -H 'referer: https://finance.yahoo.com/' \
        -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
        -H 'sec-ch-ua-mobile: ?0' \
        -H 'sec-ch-ua-platform: "Windows"' \
        -H 'sec-fetch-dest: empty' \
        -H 'sec-fetch-mode: cors' \
        -H 'sec-fetch-site: same-site' \
        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'; then
        
        log_message "Successfully downloaded data for $symbol to $filename"
        echo "$filename"
    else
        log_message "Error downloading data for $symbol"
        echo "ERROR"
    fi
}

# Main execution
SYMBOL="$1"  # Get stock symbol from command line argument

if [ -z "$SYMBOL" ]; then
    log_message "No stock symbol provided"
    echo "ERROR: Please provide a stock symbol as argument"
    exit 1
fi

# Execute download and output filename
download_yahoo_data "$SYMBOL"