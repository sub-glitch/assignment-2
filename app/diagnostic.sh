#!/bin/bash

COMMAND=$1
ARGUMENT=$2

case "$COMMAND" in
    system)
        ./health-check.sh system
        ;;

    network)
        if  [ -z "$ARGUMENT" ]
        then
            echo "Usage: $0 network <host>"
            exit 2
        fi

        ./health-check.sh network "$ARGUMENT"
        ;;

    disk)
        ./health-check.sh disk
        ;;

    help)
        echo "Usage: $0 <command> [argument]"
        echo "Commands:"
        echo "  system          Check system health"
        echo "  network <host>  Check network connectivity to the specified host"
        echo "  disk            Check disk usage"
        echo "  help            Show this help message"
        ;;

     "")
         echo "No command provided. Use '$0 help' for usage information."
          exit 2
          ;;

    *)
        echo "Unknown command: $COMMAND. Use '$0 help' for usage information."
        exit 2
        ;;

    

esac
