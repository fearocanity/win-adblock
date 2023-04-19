# win-adblock
A simple batch script that sets adblocker to your windows. This tool uses AdGuard DNS.

## Installation
Using `bitsadmin` tool:

```
bitsadmin /transfer mydownload /priority normal "https://raw.githubusercontent.com/fearocanity/win-adblock/master/adblock.bat" "%USERPROFILE%\Desktop\adblock.bat"
```

## Run
- Run `CMD` as Administrator
- Then Run these commands:
```
cd %USERPROFILE%\Desktop
adblock
```
- Then pick *(by number)* an adapter you want to apply the adblock.
- And wait until it's done.
- Now test it, to websites that have Ads.

> Although, this doesn't block all the ads but it will lessen the annoyance.

## Friendly Note
> **Note**: If you're going to execute `*.bat,*.com` on GitHub, make sure to check src first. 