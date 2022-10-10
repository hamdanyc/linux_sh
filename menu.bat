#!/usr/bin/bash

clear
echo " --- Choose option to run ---"
PS3="Select: "

select opt in shiny ngrok stop-shiny stop-ngrok quit; do

  case $opt in
    shiny)
      sh shiny-app.bat
      echo "Start shiny server"
      ;;
    ngrok)
      sh ngrok.bat
      echo "Start ngrok tunnel"
      ;;
    stop-shiny)
      echo "Stop shiny server"
      ;;
    stop-ngrok)
      echo "Stop ngrok tunnel"
      ;;
    quit)
      break
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done
