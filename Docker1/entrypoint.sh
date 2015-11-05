#!/bin/bash

echo $GITURL

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    git pull
fi

cd /app/*

if [ $(pwd) = /app ]; then
  git clone $GITURL
  cd /app/*
  npm install
  npm start
else
	if [ $LOCAL = $REMOTE ]; then
	    echo "Up-to-date"
            npm start
	elif [ $LOCAL = $BASE ]; then
	    git pull
            npm install
            npm start
	fi
fi
