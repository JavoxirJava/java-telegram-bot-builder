# Dependencies Reference

## Main library

Use:

```xml
<dependency>
    <groupId>org.telegram</groupId>
    <artifactId>telegrambots</artifactId>
    <version>${telegrambots.version}</version>
</dependency>
```

## Maven properties example

```xml
<properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
    <telegrambots.version>REPLACE_WITH_CURRENT_STABLE_VERSION</telegrambots.version>
</properties>
```

Do not invent a dependency version if the existing project already manages versions.

## Optional Spring Boot dependencies

Only add Spring Boot dependencies when Spring Boot mode is selected.

Do not add Redis, database, Docker, or queue dependencies unless explicitly requested.
