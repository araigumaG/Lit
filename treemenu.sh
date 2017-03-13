#! /bin/sh
#
#         Generate HTML directory Tree menu with POSIXism
#             "Write Once, Run Anywhere, Run for Good"
#
# Original Author: BRAVEMAN LONGBRIDGE
#                  @shellshoccarjpn
#####################################################################

#####################################################################
# TREE
#####################################################################
#                                                                   #
# === opts ==========================================================
DIR="$1"                                                            #
#                                                                   #
# === 1.Prepare =====================================================
LF=$(printf '\\\n_')                                                #
LF=${LF%_}                                                          #
#                                                                   #
# === 2.Header ======================================================
cat <<__RESPONSE                                                    |
  HTTP/1.0 200 OK
  Date: $DATE
  Expires: $DATE
  Server: Slash Bin Slash sh
  Content-Type: text/html;charset="UTF-8"

__RESPONSE
sed 's/^ *//'                                                       #
#                                                                   #
# === 3.Body ========================================================
# --- 1.html                                                        #
cat <<__RESPONSE                                                    |
  <!DOCTYPE html>
  <html lang="en">
  <head>
  <meta charset="UTF-8">
  <title>$dir Tree Menu</title>
  </head>
  <body>
  <h1>TREE $dir</h1>
  <div>
__RESPONSE
sed 's/^ *//'                                                       #
#                                                                   #
# --- 2.tree                                                        #
echo ${DIR} '<br />'                                                #
find "${DIR}"                                                       |
grep -v '/\..*'                                                     |
while read TREEPATH                                                 #           
do                                                                  #
  if [ -d "$TREEPATH" ] ; then                                      #
     echo "${TREEPATH}%"                                            #
  else                                                              #
     echo "${TREEPATH}"                                             #
  fi                                                                #
done                                                                |
sed "s:$DIR::"                                                      |
sed '/^$/ d'                                                        |
sort                                                                |
sed 's/\(.*\)\/\([^/]*\)$/\1|'"$LF"'\&#9472\;<a href="\.&">\2<\/a>/'|
grep -v '^%$'                                                       |
sed 's/%/\//g'                                                      |
sed 's:^/[^/|]*:|　:'                                               |
sed '/\/.*|/ s:/[^/|]*[/|]:|　|:g'                                  |
sed 's/|[-_.0-9a-zA-Z]*|/|　|/g'                                    |
sed '/.*>/ s:\(.*\):\1<br />:'                                      |
sed 's/\/<\//<\//'                                                  |
tr -d '\n'                                                          #
#                                                                   #
# --- 3.Footer html                                                 #
cat <<-__RESPONSE                                                   |
  </div>
  </body>
  </html>
__RESPONSE
sed 's/^ *//'                                                       #
#                                                                   #
# === 4.Finish ======================================================
exit 0                                                              #
