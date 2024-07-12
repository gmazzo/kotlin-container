# kotlin-container
An unofficial Docker image for running Kotlin scripts.

## Usage
Given a Kotlin script `hello.kts`:
```kotlin
println("Hello, World!")
```

```bash
docker run -v ./scripts:/scripts gmazzo/kotlin /scripts/hello.kts
```
