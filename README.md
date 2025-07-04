# kotlin-container
An unofficial Docker image for running Kotlin scripts.

[![Latest](https://img.shields.io/docker/image-size/gmazzo/kotlin)](https://hub.docker.com/r/gmazzo/kotlin)
[![Build Status](https://github.com/gmazzo/kotlin-container/actions/workflows/build.yaml/badge.svg)](https://github.com/gmazzo/kotlin-container/actions/workflows/build.yaml)
[![Users](https://img.shields.io/badge/users_by-Sourcegraph-purple)](https://sourcegraph.com/search?q=content:gmazzo/kotlin-container%40+-repo:github.com/gmazzo/kotlin-container)

[![Contributors](https://contrib.rocks/image?repo=gmazzo/kotlin-container)](https://github.com/gmazzo/kotlin-container/graphs/contributors)

## Usage
Given a Kotlin script `./scripts/hello.kts`:
```kotlin
println("Hello, World!")
```

```bash
docker run -v ./scripts:/scripts gmazzo/kotlin /scripts/hello.kts
```

## Variants
Default `latest` is based on `eclipse-temurin:21-alpine` targeting the [latest Kotlin release](https://github.com/Jetbrains/kotlin/releases/latest) (updated monthly)

There are also specific tags for other JDK versions (`11`, `17`, and `21`) and `Amazon Corretto`, `Eclipse Temurin`, and `Azul Zulu` vendors. 
You can explore the full list at [Docker Hub](https://hub.docker.com/repository/docker/gmazzo/kotlin/tags)
