FROM beevelop/java

MAINTAINER Lee Meador <lee@leemeador.com>

## Originated with MAINTAINER Maik Hummel <m@ikhummel.com>

ENV ANT_HOME="/usr/share/ant" \
    MAVEN_HOME="/usr/share/maven" \
    GRADLE_HOME="/usr/share/gradle" \
    ANDROID_HOME="/opt/android"

ENV PATH $PATH:$ANT_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin

WORKDIR /opt

RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qq install -y wget curl sudo bzip2 ca-certificates maven ant gradle libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \

    # Clean up
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean
