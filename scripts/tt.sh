#!/usr/bin/env bash

# Big credit to ThePrimeagen, this script is based HEAVILY on his

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | cut -d ":" -f1 | grep "$window")
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d $@"
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    shift
    hasSession=$(tmux list-sessions | cut -d ":" -f1 | grep $session)
    if [ -z "$hasSession" ]; then
        cmd="tmux new -s $session -d $@ > /dev/null 2>&1"
        echo "Creating Session: $cmd"
        eval $cmd
    else
        echo "Reusing Session: $session"
    fi
}

attachSession() {
    session=$1
    shift
    if [ -n "$TMUX" ]; then
        tmux switch -t $session
    else
        tmux attach -t $session
    fi
}

runInWindow() {
    session=$1
    window=$2
    incmd=$3
    shift
    shift
    cmd="tmux send-keys -t $session:$window \"$incmd\" enter"
    eval $cmd
}

while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
    "dotfiles" | "dot")
        createSession dotfiles -c $DOTFILES
        attachSession dotfiles
        ;;
    "notes" | "note")
        createSession notes -c $NOTESDIR
        attachSession notes
        ;;
    "htb")
        createSession htb -c "$WORKSPACE/htb"
        runInWindow htb 0 "$DOTFILES/scripts/vpnselect.sh"
        attachSession htb
        ;;
    "thm")
        createSession thm -c "$WORKSPACE/thm"
        runInWindow thm 0 "$DOTFILES/scripts/vpnselect.sh"
        attachSession thm
        ;;
    "miner" | "anaxes" | "hash")
        createSession anaxes -c "$HOME"
        runInWindow anaxes 0 "ssh anaxes"
        attachSession anaxes
        ;;
    *) echo "Unknown command.. $curr"
    esac
done

