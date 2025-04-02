FROM debian:12.9-slim


RUN apt-get update
RUN apt-get install -y git haxe nodejs npm openjdk-17-jdk

RUN mkdir /app
RUN mkdir -p /src/{flash, haxe}

WORKDIR /app

ARG GIT_BRANCH=master
RUN git clone --branch ${GIT_BRANCH} https://github.com/tram98/ax3

WORKDIR /app/ax3

RUN haxelib setup /usr/share/haxe/lib
RUN haxelib install format
RUN haxelib install hxjava

# remove the auto-runner line from build.hxml, otherwise the build will try to run the compiler
RUN sed -i '/-cmd java -jar converter.jar config-local.json/d' build.hxml
RUN haxe build.hxml

ENTRYPOINT [ "java", "-jar", "converter.jar", "/src/config.json" ]
