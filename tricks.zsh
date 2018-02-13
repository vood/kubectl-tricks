ORIGKUBECTL=`which kubectl`

function kubectl () {
  if [[ $1 == "delete"  ]]; then
    if [[ $3 == "" ]]; then
      $ORIGKUBECTL $@
      return
    fi

    echo "Are you sure you would like to delete $2 $3?"
    vared -p "To confirm, please enter the $2's name: " -c tmp
    if [[ !$tmp == $1 ]]; then
      echo "Error: $tmp does not match $1. Aborting."
    fi
  fi

  $ORIGKUBECTL $@
}

function kubectx () {
  echo "kubectl context set to $1.k8s.people.ai."
  kubectl config set current-context $1.k8s.people.ai > /dev/null
}
