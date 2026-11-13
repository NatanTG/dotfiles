function claude --description 'Claude Code com conta por pasta'
    switch $PWD
        case "$HOME/trabalho" "$HOME/trabalho/*" \
            "$HOME/Documents/projects/EMR" "$HOME/Documents/projects/EMR/*" \
            "$HOME/emr-agent-skills" "$HOME/emr-agent-skills/*"
            CLAUDE_CONFIG_DIR=$HOME/.claude-work command claude $argv
        case '*'
            command claude $argv
    end
end
