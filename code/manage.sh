 #!/usr/bin/env bash
set -e

case $1 in
     dev)
          cd /opt/loadtestserver
          bundle exec rake assets:precompile
          bundle exec rails generate symmetric_encryption:new_keys production
          bundle exec unicorn -E development -c config/unicorn_docker.rb
          ;;
     worker)
          bundle exec rails generate symmetric_encryption:new_keys production
          cd /opt/loadtestserver; bundle exec rake jobs:work
          ;;
     test)
          cd /opt/loadtestserver; bundle exec rake test
          ;;
     *)
          echo "[dev, worker, test] expected as arguments"
          ;;
esac