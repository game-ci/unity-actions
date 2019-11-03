FROM gableroux/unity3d:2019.2.11f1-webgl

LABEL "com.github.actions.name"="Activate Unity"
LABEL "com.github.actions.description"="Activate license for Unity editor"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/webbertakken/unity-actions"
LABEL "homepage"="http://github.com/webbertakken/unity-actions"
LABEL "maintainer"="Webber Takken <webber@takken.io>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
