FROM gableroux/unity3d:2019.2.11f1

LABEL "com.github.actions.name"="Request Unity Manual Activation File"
LABEL "com.github.actions.description"="Request the manual activation file for activating Unity personal"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/webbertakken/unity-actions"
LABEL "homepage"="http://github.com/webbertakken/unity-actions"
LABEL "maintainer"="Webber Takken <webber@takken.io>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
