#!/usr/bin/env bash
if which git
then 
  echo "There it is"
else
  echo "git's not install"
  exit
fi

PROJECTNAME=$1
SCRIPTPATH=`pwd -P`
SCRIPTPATHGIT=$SCRIPTPATH'/.git'

if [ -z "$1" ]
  then
    echo PROJECT NAME IS NULL
    exit
fi


echo INIT PROJECT $PROJECTNAME

echo Current Path: $SCRIPTPATH

touch README.md
git add README.md
git commit -m "add README (init new prj)"
git push -u origin master

mkdir tempDirectory
cd tempDirectory

git clone https://github.com/vuhoangha/base-heroku-boilerplate.git

rm -rf .git
cd ..

cp -rf tempDirectory/base-heroku-boilerplate/* $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.babelrc $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.env $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.eslintignore $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.eslintrc $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.gitignore $SCRIPTPATH
cp tempDirectory/base-heroku-boilerplate/.nvmrc $SCRIPTPATH

configFileName=package.json
versionConfig='equix-lambda-user'
sed -i -e "s/$versionConfig/$PROJECTNAME/g" $configFileName
rm -rf tempDirectory
npm install
