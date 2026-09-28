#!/bin/bash



COMMAND=$1
ARGUMENT=$2

case "$COMMAND" in
    system)
        echo "System INFO"
        echo "==============================="
        echo "Hostname: $(hostname)"
        echo "Kernel: $(uname -r)"
        echo "Uptime: $(uptime -p)"

        echo 
        echo "Memory: $(free -h)"

        echo
        echo "CPU:"
        lscpu | grep -E 'Model name|^CPU\(s\):'
        ;;

    network)
        if [ -z "$ARGUMENT" ]; then
        echo "Usage: diagnostic network <host>"
        exit 2
        fi

        echo "Network Check"
        echo "============="
        echo "Host: $ARGUMENT"

        if ping -c 4 "$ARGUMENT" > /dev/null 2>&1; then
            echo "Connectivity: successful"
            exit 0
        else
            echo "Connectivity: failed"
            exit 1
        fi
        ;;

    disk)
        echo "Disk INFO"
        echo "==============================="
        df -h
        ;;

    *)
        echo "Unknown command: $COMMAND. Use '$0 help' for usage information."
        exit 1
        ;;    
esac        