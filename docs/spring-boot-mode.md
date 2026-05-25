# Spring Boot Mode

Use Spring Boot mode when the user or existing project needs a backend application structure.

## When to choose Spring Boot

- User explicitly asks for Spring Boot
- Existing project already uses Spring Boot
- Webhook endpoint is needed
- Dependency injection is useful
- Configuration properties are preferred

## Recommended files

```txt
TelegramBotApplication.java
config/BotProperties.java
config/TelegramBotConfig.java
controller/TelegramWebhookController.java
bot/TelegramLongPollingBotImpl.java
bot/TelegramWebhookBotImpl.java
handler/UpdateDispatcher.java
keyboard/ReplyKeyboardBuilder.java
keyboard/InlineKeyboardBuilder.java
session/UserSessionCache.java
```

## application.yml example

```yaml
telegram:
  bot:
    token: ${BOT_TOKEN}
    username: ${BOT_USERNAME}
    mode: ${BOT_MODE:auto}
    webhook-url: ${WEBHOOK_URL:}
```

## Rules

- Use constructor injection.
- Do not hardcode secrets.
- Keep controllers thin.
- Keep bot logic in handlers/services.
- Register polling or webhook mode based on config.
