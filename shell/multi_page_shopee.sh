mkdir -p shopee_log  # Create the log directory if it doesn't exist

for page in {1..3}
do
    curl "https://shopee.vn/api/v4/search/search_suggestion?bundle=popsearch&limit=8&offset=0" \
    -H "accept: application/json" \
    -H "accept-language: en-US,en;q=0.9,vi-VN;q=0.8,vi;q=0.7" \
    -H "af-ac-enc-dat: 8797dcf03266520d" \
    -H "af-ac-enc-sz-token;" \
    -H "content-type: application/json" \
    -H "cookie: REC_T_ID=97ddafb1-9504-11ee-8b8c-0e8694b875c9; SPC_F=9Ubjd5IxOywVIJy5EIJPtx8uWcu70k3A; SPC_CLIENTID=OVViamQ1SXhPeXdWjmudgwvtfbuwbwrc; _hjSessionUser_868286=eyJpZCI6Ijc2NWI0ZDI4LWQ3NWUtNTAxMy1iN2FjLTIxNjA4M2NhNDJlNCIsImNyZWF0ZWQiOjE3MDIwOTkwNjQ4MDAsImV4aXN0aW5nIjp0cnVlfQ==; _ga_M32T05RVZT=GS1.1.1702108574.2.0.1702108611.23.0.0; _ga=GA1.2.1037470669.1702099063; _ga_4GPP1ZXG63=GS1.1.1707038082.5.0.1707038089.0.0.0; _QPWSDCXHZQA=c48d2add-b300-4117-c786-0b4c4bdd5e09; REC7iLP4Q=b569bef2-4916-4ad6-a941-f1896e05f0a3; SP_USE_OLD_FEED=1; SC_DFP=rzhbCrYGkYhqrthvBTMxqFhYwKhJMuix; SPC_SEC_SI=v1-MEk2YlFISm1vZ29ucXhDMDl/ave1ElXBAs+3DWqGzy31HUiOM9/CrzZSp6h/jxA0cvMwnFTfoDbRGSCBAIn3x+8lAh4nb4Oe9+qNNKmyeAY=; SPC_SI=XX7yZgAAAABXM1VDakFQSYPWHwMAAAAAb3ZJUmlaR2M=; fblo_421039428061656=y; SPC_ST=.Y0RaRE9LSFAzWEN5SFMxURCnH3KhP+8h8OC2sgvNFO+VNCgd32k095J2t7ekrSg1EBg/NimKHVbKEqK6s0cEcjCacXv2ylWzi77VvQpNCt5kKfUtgFpmQuuuNO1EKBY9/YE8Lcg/ulEwll5KFpKVPlKqpwJcz0mz0LvKiY24jTMdksmokmJl4SC6mtHx3ekBA9CAoy7jkZw7vHP7NTF9vci2MauWyxbGRJGst9edrXw=; SPC_EC=.Y0RaRE9LSFAzWEN5SFMxURCnH3KhP+8h8OC2sgvNFO+VNCgd32k095J2t7ekrSg1EBg/NimKHVbKEqK6s0cEcjCacXv2ylWzi77VvQpNCt5kKfUtgFpmQuuuNO1EKBY9/YE8Lcg/ulEwll5KFpKVPlKqpwJcz0mz0LvKiY24jTMdksmokmJl4SC6mtHx3ekBA9CAoy7jkZw7vHP7NTF9vci2MauWyxbGRJGst9edrXw=; SPC_U=117694717; SPC_T_IV=a0cxZmhTSGhMZzQ2YTZLQg==; SPC_R_T_ID=jv4DLCE5EZexcwkZbn/+GrwxNCnY+mU3aUR5NV0KFwK6gxDb4gtrNm53wHJ3alzKxlVGmU8273jYxFQ2mBlyM76r9q03sF2wmmVxeGoquRO5ZQFsRh8fffDbWvbL/ZUbWuNRH7QH8xE7xYaRPa04vSapfRBHR7VgsYKFoWYIZAI=; SPC_R_T_IV=a0cxZmhTSGhMZzQ2YTZLQg==; SPC_T_ID=jv4DLCE5EZexcwkZbn/+GrwxNCnY+mU3aUR5NV0KFwK6gxDb4gtrNm53wHJ3alzKxlVGmU8273jYxFQ2mBlyM76r9q03sF2wmmVxeGoquRO5ZQFsRh8fffDbWvbL/ZUbWuNRH7QH8xE7xYaRPa04vSapfRBHR7VgsYKFoWYIZAI=; __LOCALE__null=VN; csrftoken=Xek7Euzvd3ewvMVw3qrYxSiPvJEDlIrM; _sapid=2cc11d05aa3e33639a60df3d67f60b054365504e864529dfdf68b388; SPC_CDS_CHAT=7574b3f4-1973-4005-a254-183ad935c330; SPC_IA=1; AC_CERT_D=U2FsdGVkX1/ws5wJ/B6pntAsQH/U7/inXUJE4E/NQO8E9kCW6t7xc0nhyXlH5AIjVfJ2Whtv5iy/IxrTKA9flovSpUZ8JqjKVPOgKYzCYWKS9OdrgXDAMtiuopTSk5eEXss4OLb9dSMgsMJe2gtXSWZEv/r2ewawqV+HHbR4zgpJgZThfEAxk5o9LECcu3ssbk2pBVNAfSk6dIorQ2tmUcJ3dKOppyVaBGq95Gt0vQYl/Wo9Sln5v15SHzyS9jOHI1DLCBQSIl99bJG/NwTlCKXsruReNr+Zo7sPaWMitm3GH4ZCnzZcWFP9LwwEqSQ917Riy2ee9i3LEVFhm5iVY8q/hrmORuCC4LDaRWh/JjXhrnpnNLDPzlP3vQ6ibVanGjkx1PUyV1mvNk8EcnEvq3yvg2Fkml9G8td+t6Wp0LZZ7wpozTTx+IYXfV5ANcsmmxL1aGVhLUpAZReTbD6uhirxMhN0x7CN1JlKUACyOT2SIc2xzZj9BpCSXTx4vmVOSN9iYdmN4Fb6LQI8xQk15ki3NKqr4IqUR2ep//+brp6gjPC9RuBBECS8kO+YU2wWz9xgS+oETr+l+v1Xps5Uq71tTmvTQiMvMMUr2eXVsOrKrvIBYJy8TFjVgD9vmfsJPImJMvQycOpcAc47grctlEB7uaD+3sx79k3UAr87m0TnRmBKwikhn1vtrw46cnosha/dhF6ccmwigHHbn4zkWuNLdI+taweP8rWRIJ4dYJmMhDlb+kE8BfKGE5C7ZNhZYrYA0ial67OydKpYf6S+1osZELG4kflDcUBloI8AGmEU1vGqLMnq4/pPF2Hvi6TyOhPwihYccT0jm7ySaxH/UDWgoQHEWI4l+qoN9XgSQ3z4/k6NXS6iOJThxCuQdAhEEbf4/rvgnNaYh6moJFgVgPeRIKQ2P/93Ms05x4wawzjUdrTTjFeZJSvf1Ulh9mDVswIsFM/czpbMBaFZ+EKdstg6xFEjXUi+eAi4KycA/i/4XEyKCEs7b4wcL4eW5ePSFqvzuFKiXUJLuRh9czJu8X8zScCF5LcsE4SDkE7sYIYrdw6IvCxbdvrTZkH2JHA7fSQFYq5azQYcqXHsuXFIsg==" \
    -H "priority: u=1, i" \
    -H "referer: https://shopee.vn/Thi%E1%BA%BFt-B%E1%BB%8B-%C4%90i%E1%BB%87n-T%E1%BB%AD-cat.11036132?page=$page&sortBy=pop" \
    -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
    -H "sec-ch-ua-mobile: ?0" \
    -H 'sec-ch-ua-platform: "Windows"' \
    -H "sec-fetch-dest: empty" \
    -H "sec-fetch-mode: cors" \
    -H "sec-fetch-site: same-origin" \
    -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" \
    -H "x-api-source: pc" \
    -H "x-csrftoken: Xek7Euzvd3ewvMVw3qrYxSiPvJEDlIrM" \
    -H "x-requested-with: XMLHttpRequest" \
    -H "x-sap-ri: 21fa1e671c92f4ce2238b1300501c06106cd5f7942e23f0b3165" \
    -H "x-sap-sec: yHi2oD/PkhZWHbKQHhGfHPKQphCFHSnQQGC6HpEQLhCDHesQshGxHsBQEhCBHECQ7hCjHsnQKhGDHSlQJhCCHpIQ4tYQHoDQ3LCYHofQ4hCAHplQ6hGfHs/QMhGHHoOQ0GGlHHOQPhCWHeQQBtG7HPDQdhCQHSZ3B/CQHhwLbhfQHrsdHhwf5tMYHhgn0o1T9SCQHhYsyNaCObCQHhYF7xt1TfDaM3VQHrxfHLCQHhCynFCdHhYhEClqHPeMuS0nnTZMB+p/HhCQHBkKHORtvjc8tS54VasdHhYQHtCQHhYJIDVEHOlnHtCQVhfQHhCQiVhBHtCQHhCQQICQHhG8FLVSF4GtgZMa5l0mL9y2ifceK+flTYkjS8Yk4kxG6NAt1yuXw1eQnY1uYsFh4bKG3tg/0dCAPjWXw2Gi+MH8eQp3Seoc199UOPVso31KMc0/wvihJYG7Ni+RsjHYS2XD1dlmis6CnMHL8+fpgx2g4G5lAijAcQAOWGxLYaMPSq2JtY4PXyRNP5/Ni1dpPzmj3GLBwltRna7UwjHLUYoihLTAAx7vkuKNdFOPUnFA6S9wUypoVwlKAH0emm2+kD80Zn5WZ/OfwoWxHF5XN2f02hxQHoLmMqYAFwo506HRJMXA8ZUU+3bYf4CNjI5ZiaAt1OuIkCPayBZ1GPmGNhj63txOxUBCOzo4GdQ6Ya7j/BktiLsYQkrOnithQg0DW4CGilNfa8vVSOH2KbWv4YiK5a83WFzIyofYoPoqheAJ7PWEX6RBodn9ntLuZ6EkEcDOLyPPH0A8SvjPlEhNg2hJTlfh+eBT7nHOibB7QGLVd/hPeB7DSMuiYDMzPZJbiGTiRVaz5WL4fymQ4kGcmVT2P5yZGv/qxFQE9PzWlcOAKB2u3ykLuqkyHIKqAKSGv9ebRD1ak+y0w3coOJwsxXkrQTUZed2MEgSq0js+7Ko3PT1K6VU+LU9gLLTwUW6O2K7Ir1L9aa/boPFE2WUsy3URN1vD3xE9kEYdT+SUIGxFdPqfwOqD2j3i1a7Cu9wgIOnDJST+KZyD/31wV2GdTIvUUIrTzLKQHhYBaN0CXQhbPGnQHhGQJN3oShCQH5YdGlWKHhCQAMwsPm2rMt9znl/CHhCQHhfQHhw+fGCQeLCQH5zeVH1pV7MMftCQHhfQHhwbxhCQehCQHOYFlCV1yEnA" \
    -H "x-shopee-language: vi" \
    -H "x-sz-sdk-version: 1.12.2" \
    --create-dirs -o "shopee_log/shopee_data_$(date +%Y%m%d_%H%M%S).json"
done