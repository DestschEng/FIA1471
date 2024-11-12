#!/bin/bash

# URL Shopee
url='https://shopee.vn/api/v4/search/search_items?by=sales&extra_params=%7B%22global_search_session_id%22%3A%22gs-dba1c2bb-432f-402b-8748-6eaa7541b6b1%22%2C%22search_session_id%22%3A%22ss-328a9a68-dcf7-4988-b633-c4d6ee3f94a0%22%7D&limit=60&match_id=11036132&newest=0&order=desc&page_type=search&scenario=PAGE_CATEGORY&version=2&view_session_id=97c137d4-ebdf-4f0a-b0b7-21616bebfc01'

# Headers của yêu cầu
headers=(
  '-H' 'accept: application/json'
  '-H' 'accept-language: en-US,en;q=0.9,vi-VN;q=0.8,vi;q=0.7'
  '-H' 'af-ac-enc-dat: 41984435253113fd'
  '-H' 'content-type: application/json'
  '-H' 'cookie: <cookie của bạn>'
  '-H' 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'
  # Các header khác thêm vào đây...
)

# Danh sách proxy từ file
proxies=(
  "198.23.239.134:6540:zcviuvns:zmvt03mahzd4"
  "207.244.217.165:6712:zcviuvns:zmvt03mahzd4"
  "107.172.163.27:6543:zcviuvns:zmvt03mahzd4"
  "64.137.42.112:5157:zcviuvns:zmvt03mahzd4"
  "173.211.0.148:6641:zcviuvns:zmvt03mahzd4"
  "161.123.152.115:6360:zcviuvns:zmvt03mahzd4"
  "167.160.180.203:6754:zcviuvns:zmvt03mahzd4"
  "154.36.110.199:6853:zcviuvns:zmvt03mahzd4"
  "173.0.9.70:5653:zcviuvns:zmvt03mahzd4"
  "173.0.9.209:5792:zcviuvns:zmvt03mahzd4"
)

# Chọn proxy ngẫu nhiên
proxy=${proxies[$RANDOM % ${#proxies[@]}]}
proxy_host=$(echo $proxy | cut -d: -f1)
proxy_port=$(echo $proxy | cut -d: -f2)
proxy_user=$(echo $proxy | cut -d: -f3)
proxy_pass=$(echo $proxy | cut -d: -f4)

# Gửi request với proxy
curl -x "$proxy_host:$proxy_port" -U "$proxy_user:$proxy_pass" "$url" "${headers[@]}"
