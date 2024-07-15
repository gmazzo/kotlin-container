# kotlin-container
An unofficial Docker image for running Kotlin scripts.

[![Docker Image](https://img.shields.io/docker/image-size/gmazzo/kotlin)](https://hub.docker.com/repository/docker/gmazzo/kotlin/general)

## Usage
Given a Kotlin script `./scripts/hello.kts`:
```kotlin
println("Hello, World!")
```

```bash
docker run -v ./scripts:/scripts gmazzo/kotlin /scripts/hello.kts
```

## Variantes
Default `latest` is based on `eclipse-temurin:21-alpine` targeting the [latest Kotlin release](https://github.com/Jetbrains/kotlin/releases/latest) (updated monthly)

There are also specific tags for other JDK versions (`11`, `17`, and `21`) and `Amazon Corretto`, `Eclipse Temurin`, and `Azul Zulu` vendors.
