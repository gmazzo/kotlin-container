ARG BASE_IMAGE=eclipse-temurin:21-alpine

FROM $BASE_IMAGE

ARG BASE_IMAGE

RUN if [ -z "${BASE_IMAGE##*alpine*}" ]; then \
      apk add curl bash unzip; \
    else \
      apt-get update && \
      apt-get install -y curl bash unzip; \
    fi

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
