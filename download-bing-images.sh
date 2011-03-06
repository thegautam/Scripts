img_dir=~/Pictures/Bing
mkdir -p $img_dir

curl "http://themeserver.microsoft.com/default.aspx?p=Bing&c=Desktop&m=en-US" | egrep -o "http:[^\"]*(JPG|jpg)" | while read url
do
    wurl=${url// /%20}
    file=$img_dir`expr "$url" : ".*\(/.*\)"`
    if [ ! -a "$file" ]
    then
        curl "$wurl" > "$file"
    fi
done
