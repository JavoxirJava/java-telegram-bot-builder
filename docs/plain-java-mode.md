# Plain Java Mode

Use plain Java mode for lightweight standalone Telegram bots.

## When to choose plain Java

- User wants a simple starter
- No Spring Boot project exists
- Bot can run as a standalone process
- Polling mode is enough
- Minimal dependencies are preferred

## Recommended files

```txt
Main.java
config/BotConfig.java
bot/TelegramLongPollingBotImpl.java
bot/BotModeResolver.java
handler/UpdateDispatcher.java
command/StartCommand.java
command/HelpCommand.java
command/InfoCommand.java
keyboard/ReplyKeyboardBuilder.java
keyboard/InlineKeyboardBuilder.java
session/UserSessionCache.java
service/EchoService.java
```

## Main startup behavior

The main method should:

1. Load config.
2. Detect polling or webhook mode.
3. Register the correct bot implementation.
4. Log startup mode.

## Rules

- Keep dependencies minimal.
- Prefer polling if no webhook URL exists.
- Do not add Spring Boot dependencies in plain Java mode.
