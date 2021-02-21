#!/bin/bash

echo "HOME: ${HOME}"
echo "SERVER_HOME: ${SERVER_HOME}"
echo "SERVER_TITLE: ${SERVER_TITLE}"
echo "SERVER_NAME: ${SERVER_NAME}"

# func: keep tmserver running
run_tmserver() {
  cd $SERVER_HOME
  while :
  do
    echo "TrackManiaServer starting..."
    ./ManiaPlanetServer /nodaemon /nologs \
      /dedicated_cfg="cfg_server.xml" \
      /game_settings="MatchSettings/cfg_tracklist.xml"
    echo "TrackManiaServer exited, restarting in 15 seconds..."
    sleep 15
  done
}

# run services
run_tmserver &
wait
