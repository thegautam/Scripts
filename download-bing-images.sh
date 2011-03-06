img_dir=~/Pictures/Bing
mkdir -p $img_dir

curl "http://themeserver.microsoft.com/default.aspx?p=Bing&c=Desktop&m=en-US" 2>/dev/null | egrep -o "http:[^\"]*(JPG|jpg)" | while read url
do
    wurl=${url// /%20}
    file=$img_dir`expr "$url" : ".*\(/.*\)"`
 if [ -a "$file" ]
 then
     echo "$file" exists.
 else
     echo "$file" downloading.
     curl "$wurl" > "$file" 2>/dev/null
 fi
done
