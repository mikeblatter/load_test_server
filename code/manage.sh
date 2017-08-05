 #!/usr/bin/env bash
set -e

case $1 in
     dev)
          cd /opt/loadtestserver; bundle exec unicorn -E development -c config/unicorn_docker.rb
          ;;
     worker)
          cd /opt/loadtestserver; bundle exec rake jobs:work
          ;;
     test)
          cd /opt/loadtestserver; bundle exec rake test
          ;;
     *)
          echo "I do not understand the command"
          ;;
esac