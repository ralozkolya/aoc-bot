#!/bin/bash

echo "SESSION=${SESSION}" >> /etc/environment
echo "LEADERBOARD=${LEADERBOARD}" >> /etc/environment
echo "RECIPIENT=${RECIPIENT}" >> /etc/environment

cron -f