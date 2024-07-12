ARG BASE=eclipse-temurin:21-alpine

FROM $BASE

ARG KOTLIN_VERSION=2.0.0

# Installs required dependencies
RUN apk add curl bash unzip

# Installs Kotlin
RUN curl -Lf "https://github.com/JetBrains/kotlin/releases/download/v$KOTLIN_VERSION/kotlin-compiler-$KOTLIN_VERSION.zip" -o kotlin.zip && \
    unzip -d /usr/local/ kotlin.zip && \
    rm kotlin.zip && \
    chmod -R +x /usr/local/kotlinc/bin/ && \
    ln -s /usr/local/kotlinc/bin/kotlin /bin/kotlin && \
    ln -s /usr/local/kotlinc/bin/kotlinc /bin/kotlinc

ENV PATH=$PATH:/usr/local/kotlinc/bin/

ENTRYPOINT ["/bin/kotlin"]
