ARG DISTRIBUTION=ubuntu
ARG JAVA_VENDOR=eclipse-temurin
ARG JAVA_VERSION=21

FROM eclipse-temurin:${JAVA_VERSION} AS ubuntu
RUN apt-get update && \
    apt-get install -y curl bash unzip

FROM eclipse-temurin:${JAVA_VERSION}-alpine AS alpine
RUN apk add curl bash unzip

FROM $DISTRIBUTION AS final

# Installs Kotlin
ARG KOTLIN_VERSION=2.0.0
RUN curl -Lf "https://github.com/JetBrains/kotlin/releases/download/v$KOTLIN_VERSION/kotlin-compiler-$KOTLIN_VERSION.zip" -o kotlin.zip && \
    unzip -d /usr/local/ kotlin.zip && \
    rm kotlin.zip && \
    chmod -R +x /usr/local/kotlinc/bin/ && \
    ln -s /usr/local/kotlinc/bin/kotlin /bin/kotlin && \
    ln -s /usr/local/kotlinc/bin/kotlinc /bin/kotlinc
ENV PATH=$PATH:/usr/local/kotlinc/bin/

ENTRYPOINT ["/bin/kotlin"]
