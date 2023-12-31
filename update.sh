echo "Processing of Update Github"
unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Operating System: " ${machine}

if [ "$machine" == "Mac" ]; then
    echo "Removing all .DS_Store files from MacOS"
    find . -name ".DS_Store" -exec rm {} \;
fi

echo "Pulling from USER:" $USER
git pull

if [ "$USER" == "tpn" ]; then
    git add .
    git commit -m "Update files for serve God"
    git push origin God
fi
echo "Finished Process of Updated"
