FROM codesimple/elm:0.19

LABEL "com.github.actions.name"="Actions for Elm"
LABEL "com.github.actions.description"="For running Elm commands"
LABEL "com.github.actions.icon"="truck"
LABEL "com.github.actions.color"="yellow"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
