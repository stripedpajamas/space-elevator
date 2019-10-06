set -e

git fetch

checkedout=`git rev-parse --short HEAD`
echo "Current state: ${checkedout}"

if [[ "$checkedout" != "$1" || "$2" == "1" ]]; then
  echo "Resetting environment..."
  rm -rf node_modules # who knows
  git checkout $1
  git checkout -- .

  if [[ -e "yarn.lock" ]]; then
    yarn
  else
    npm i
  fi
fi
