#!/bin/bash

function show_help {
  echo "Usage: $0 -f FILE -o OUTPUT [-c COUNT] [-i INTERVAL]"
  echo "Usage: $0 --help"
  echo
  echo "  -f FILE      Name of the file containing the list of hosts"
  echo "  -o OUTPUT    Name of the output file"
  echo "  -c COUNT     Number of ping packets to send (default: 3)"
  echo "  -i INTERVAL  Time interval between ping packets in seconds (default: 1)"
  echo "  --help       Show this help message and exit"
}

function echoerr() { echo "$@" 1>&2; }

COUNT=3
INTERVAL=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    -f)
      FILE="$2"
      shift 2
      ;;
    -o)
      OUTPUT="$2"
      shift 2
      ;;
    -c)
      COUNT="$2"
      shift 2
      ;;
    -i)
      INTERVAL="$2"
      shift 2
      ;;
    --help)
      show_help
      exit 0
      ;;
    *)
      echoerr "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

if [ -z "$FILE" ]; then
  echoerr "Error: No hosts file specified"
  show_help
  exit 1
fi

if ! [ -e "$FILE" ]; then
  echoerr "Error: File $FILE not found"
  exit 1
fi

if [ -z "$OUTPUT" ]; then
  echoerr "Error: Output file is not specified"
  show_help
  exit 1
fi

while read -r host; do
  if [ -n "$host" ]; then
    echo -n "Pinging host: $host... "

    ping_output=$(ping -c $COUNT -i $INTERVAL $host 2>&1)

    if echo "$ping_output" | grep -q "Unknown host"; then
      echo "Error"
      echoerr "$host cannot be resolved"
      timestamp=$(date +"%Y-%m-%d %H:%M:%S")
      echo "$timestamp | $host | UNRESOLVABLE | Sent: 0 | Received: 0 | Lost: n/a" >> $OUTPUT
      continue
    fi

    result=$(echo "$ping_output" | grep 'packets transmitted')
    packets_sent=$(echo $result | awk '{print $1}')
    packets_received=$(echo $result | awk '{print $4}')
    packets_lost_percentage=$(echo $result | awk '{print $7}')

    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    if [ "$packets_received" -gt 0 ]; then
      echo "OK"
      log_result="OK"
    else
      echo "DOWN"
      log_result="DOWN"
    fi

    echo "$timestamp | $host | $log_result | Sent: $packets_sent | Received: $packets_received | Lost: $packets_lost_percentage" >> $OUTPUT
  fi
done < "$FILE"

