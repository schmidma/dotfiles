function kill-other-ssh-sessions --description "Interactively terminate all other SSH sessions except the current one"
    argparse -n kill-other-ssh-sessions 'y/yes' 'h/help' -- $argv
    or return 2

    if set -q _flag_help
        echo "Usage: kill-other-ssh-sessions [--yes|-y]"
        echo
        echo "Default: show other SSH/PTY sessions and ask before killing."
        echo "  -y, --yes    Skip confirmation and terminate directly."
        return 0
    end

    set -l me (tty | string replace -r '^/dev/' '')

    set -l sessions (who | awk -v me="$me" '
        $2 ~ /^pts\// && $2 != me {
            print $2
        }
    ' | sort -u)

    if test (count $sessions) -eq 0
        echo "No other SSH sessions found."
        return 0
    end

    echo "Current session kept:"
    echo "  $me"
    echo

    echo "Other sessions found:"
    for session in $sessions
        echo
        echo "== $session =="

        who -u | awk -v tty="$session" '$2 == tty { print "  login: " $0 }'

        set -l proc_count (pgrep -t "$session" | wc -l | string trim)
        echo "  processes: $proc_count"

        ps -t "$session" -o pid,ppid,stat,etime,cmd --forest 2>/dev/null | sed 's/^/  /'
    end

    echo

    if not set -q _flag_yes
        read -l --prompt-str "Terminate these sessions? [y/N] " answer

        switch (string lower -- $answer)
            case y yes
                # continue
            case '*'
                echo "Aborted. No sessions were terminated."
                return 0
        end
    end

    for session in $sessions
        echo "Terminating $session"
        pkill -TERM -t "$session"
    end
end
