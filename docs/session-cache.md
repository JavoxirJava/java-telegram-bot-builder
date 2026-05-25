# Session Cache

The starter bot should include an in-memory user session cache.

This cache is used to track temporary user flow state such as current step, user state, and temporary values.

## Recommended storage

```java
private final ConcurrentHashMap<Long, UserSession> sessions = new ConcurrentHashMap<>();
```

The key is Telegram user ID.

## UserSession model

Recommended fields:

```java
public class UserSession {
    private Long userId;
    private UserState state;
    private String step;
    private Map<String, Object> data;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
```

## UserState enum

```java
public enum UserState {
    IDLE,
    WAITING_INPUT,
    PROCESSING
}
```

## Required methods

The cache manager should provide methods like:

```java
UserSession getOrCreate(Long userId);
void updateState(Long userId, UserState state);
void updateStep(Long userId, String step);
void putData(Long userId, String key, Object value);
Object getData(Long userId, String key);
void clear(Long userId);
```

## Important note

This cache is runtime-only.

It is not a database replacement. If the app restarts, sessions may be lost. For production persistence, database or Redis can be added only when the user asks for it.
