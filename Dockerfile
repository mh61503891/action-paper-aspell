FROM debian:stretch-slim

LABEL version="0.0.1"
LABEL repository="https://github.com/mh61503891/action-paper-aspell"
LABEL homepage="https://github.com/mh61503891/action-paper-aspell"
LABEL maintainer="Masayuki Higashino <mh.on.web@gmail.com>"

LABEL "com.github.actions.name"="GitHub Action for Aspell"
LABEL "com.github.actions.description"="GitHub Action for Aspell"
LABEL "com.github.actions.icon"="type"
LABEL "com.github.actions.color"="green"

COPY README.md /

RUN apt-get update && apt-get install -y aspell aspell-en git
COPY script/aspell.bash /script/aspell.bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
