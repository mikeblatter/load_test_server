 #!/usr/bin/env bash
set -e

case $1 in
     dev)
          cd /rails && bundle exec unicorn -E development -c config/unicorn_docker.rb
          ;;
     worker)
          cd /rails; bundle exec rake jobs:work
          ;;
     test)
          cd /rails; bundle exec rake test
          ;;
     *)
          echo "[dev, worker, test] expected as arguments"
          ;;
esac