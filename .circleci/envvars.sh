#!/usr/bin/env bash

set -e
set -u

help () {
  echo
  echo '# This will set all required environment variables on the CircleCI project.'
  echo
  echo '# Supply values to set when prompted.'
  echo '# Values left blank will not be updated.'
  echo
  echo 'Values may also be provided via' \
       'the corresponding environment variable (prefixed with CI_).'
  echo 'Optionally, set NONINTERACTIVE=true to skip all prompts.'
  echo
  echo 'For example, assuming CIRCLE_TOKEN is set in your environment,' \
       'update TWINE_PASSWORD with'
  echo
  echo '    $ NONINTERACTIVE=true CI_TWINE_PASSWORD=password .circleci/envvars.sh'
}

help_circleci_repo () {
  echo
  echo '> GitHub repository name, e.g., my-user/my-repo'
}

help_circleci_token () {
  echo
  echo '> Get a personal CircleCI API Token at' \
       'https://circleci.com/account/api'
}

help_codecov () {
  echo
  echo '> Get the Repository Upload Token at' \
       "https://codecov.io/gh/${circle_repo}/settings"
}

envvar () {
  name=$1
  value=${2:-}
  if [[ -n $value ]]; then
    if [[ -z $circle_token ]]; then
      echo
      echo 'Error: missing CircleCI token.'
      exit 2
    fi

    curl -X POST \
      --header 'Content-Type: application/json' \
      -u "${circle_token}:" \
      -d '{"name": "'$name'", "value": "'$value'"}' \
      "https://circleci.com/api/v1.1/project/github/${circle_repo}/envvar"
  fi
}

main () {
  noninteractive=$1

  circle_repo=${CIRCLE_REPO:-}
  [[ -n "${circle_repo}" || $noninteractive == 'true' ]] || help_circleci_repo
  if [[ -z $circle_repo && $noninteractive != 'true' ]]; then
    read -p '> CircleCI Repo (CIRCLE_REPO): ' circle_repo
  fi

  circle_token=${CIRCLE_TOKEN:-}
  [[ -n "${circle_token}" || $noninteractive == 'true' ]] || help_circleci_token
  if [[ -z $circle_token && $noninteractive != 'true' ]]; then
    read -p '> CircleCI API token (CIRCLE_TOKEN): ' circle_token
  fi

  twine_username=${CI_TWINE_USERNAME:-}
  if [[ -z $twine_username && $noninteractive != 'true' ]]; then
    read -p '> PyPI username (TWINE_USERNAME): ' twine_username
  fi

  twine_password=${CI_TWINE_PASSWORD:-}
  if [[ -z $twine_password && $noninteractive != 'true' ]]; then
    read -p '> PyPI password (TWINE_PASSWORD): ' twine_password
  fi

  codecov_token=${CI_CODECOV_TOKEN:-}
  [[ -n "${codecov_token}" || $noninteractive == 'true' ]] || help_codecov
  if [[ -z $codecov_token && $noninteractive != 'true' ]]; then
    read -p '> Codecov token (CODECOV_TOKEN): ' codecov_token
  fi

  aws_default_region=${CI_AWS_DEFAULT_REGION:-}
  if [[ -z $aws_default_region && $noninteractive != 'true' ]]; then
    read -p '> AWS default region (AWS_DEFAULT_REGION): ' aws_default_region
  fi

  aws_access_key_id=${CI_AWS_ACCESS_KEY_ID:-}
  if [[ -z $aws_access_key_id && $noninteractive != 'true' ]]; then
    read -p '> AWS access key id (AWS_ACCESS_KEY_ID): ' aws_access_key_id
  fi

  aws_secret_access_key=${CI_AWS_SECRET_ACCESS_KEY:-}
  if [[ -z $aws_secret_access_key && $noninteractive != 'true' ]]; then
    read -p '> AWS secret access key (AWS_SECRET_ACCESS_KEY): ' aws_secret_access_key
  fi

  envvar 'TWINE_USERNAME' "${twine_username}"
  envvar 'TWINE_PASSWORD' "${twine_password}"
  envvar 'CODECOV_TOKEN' "${codecov_token}"
  envvar 'AWS_DEFAULT_REGION' "${aws_default_region}"
  envvar 'AWS_ACCESS_KEY_ID' "${aws_access_key_id}"
  envvar 'AWS_SECRET_ACCESS_KEY' "${aws_secret_access_key}"
}

noninteractive=${NONINTERACTIVE:-false}
if [[ $noninteractive != 'true' ]]; then
  help
fi
main $noninteractive
