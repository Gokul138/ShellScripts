# pull

sudo rm *~

git status

git add -A

git pull origin master

if [ "$1" == "" ]; then

git commit -am "default"

echo ** The commit might have \"default\" as commit tag **

else

echo ** The commit might have \""$1"\" as commit tag **

git commit -am "$1"

fi

git push origin master
