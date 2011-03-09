set -e

img_dir=~/Pictures/Bing
mkdir -p $img_dir

curl "http://themeserver.microsoft.com/default.aspx?p=Bing&c=Desktop&m=en-US" 2>/dev/null |

    # Find a ref node.
    egrep -o "ref=\"[^\"]*\"" | 

    # Extract the url from it.
    egrep -o "http:[^\"]*(JPG|jpg)" | 

    while read url
    do
        # Make the url web ready.
        wurl=${url// /%20}

        # Image name is last part of url.
        file=$img_dir`expr "$url" : ".*\(/.*\)"`

        # Download only if file is missing.
        if [ -a "$file" ]
        then
            echo "$file" exists.
        else
            echo "$file" downloading.
            curl "$wurl" > "$file" 2>/dev/null
        fi
    done
