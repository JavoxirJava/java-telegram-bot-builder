---
name: java-telegram-bot-builder
description: Use this skill when the user wants to create a Java Telegram bot using org.telegram:telegrambots with a clean starter structure, reusable ReplyKeyboardMarkup and InlineKeyboardMarkup builders, in-memory user session/state cache, and automatic polling/webhook mode selection based on configuration. This skill supports both plain Java Maven and Spring Boot Maven projects depending on user or project requirements.
---

# java-telegram-bot-builder

## Purpose

Use this skill to create a clean, reusable, production-conscious Java Telegram bot starter using the `org.telegram:telegrambots` library.

The generated bot must be ready to run as a starter echo bot and easy to extend into a real business bot.

The skill must help the agent create:

- a clean Java Telegram bot project structure
- either plain Java + Maven or Spring Boot + Maven, depending on user/client requirements
- Telegram bot registration/configuration
- long polling mode
- webhook mode
- automatic mode selection from config
- `/start`, `/help`, and `/info` commands
- reusable reply keyboard builder
- reusable inline keyboard builder
- developer-provided callback data for inline buttons
- in-memory user session/state cache by Telegram user ID
- simple echo behavior as the default starter flow
- clear README and `.env.example`

## When to use this skill

Use this skill when the user asks to:

- create a Telegram bot in Java
- build a Java Telegram bot starter
- generate Telegram bot project structure
- use `org.telegram:telegrambots`
- create reusable Telegram button classes
- support reply and inline buttons
- manage user state/session in memory
- create a bot that starts as an echo bot
- support polling and webhook modes
- create either plain Java or Spring Boot Telegram bot project

Example user requests:

```txt
Use $java-telegram-bot-builder. Create a Java Telegram bot starter with polling/webhook support, reusable button builders, session cache, and /start /help /info commands.
```

```txt
Use $java-telegram-bot-builder. Build a Spring Boot Telegram bot with org.telegram:telegrambots, inline/reply button builders, and user state cache.
```

```txt
Use $java-telegram-bot-builder. Generate a plain Java Maven Telegram echo bot with clean structure and reusable keyboard helpers.
```

## When not to use this skill

Do not use this skill when the user wants:

- Telegram Bot API in another language such as Node.js, Python, Go, or PHP
- Telegram MTProto user-client API
- Telegraf, grammy, aiogram, Pyrogram, Telethon, or TDLib
- frontend UI
- admin dashboard
- forced database integration
- forced Redis integration
- complex microservice architecture
- payment bot implementation as the first step
- mass messaging/spam automation
- account automation through Telegram user accounts

If the user asks for MTProto user-client functionality, do not use this skill. Use a Telegram MTProto-specific skill instead.

## Scope

This skill is intentionally narrow.

It creates a clean Java Telegram bot starter, not a full business product.

Included:

- Java Telegram Bot API using `org.telegram:telegrambots`
- Maven setup
- plain Java mode
- Spring Boot mode when requested or detected
- long polling mode
- webhook mode
- automatic mode selection using config
- bot config files
- command handlers
- message handlers
- callback query handlers
- button builders
- user session cache
- starter echo behavior
- README and `.env.example`

Excluded by default:

- database persistence
- Redis cache
- Docker unless requested
- CI/CD unless requested
- frontend
- admin panel
- complex role/permission system
- payment integration
- multilingual content system
- analytics
- queue systems

## Project mode decision

Before generating code, decide which mode to use.

### Use Spring Boot mode when

- the user explicitly asks for Spring Boot
- the existing project is Spring Boot
- the user needs dependency injection/configuration properties
- the user wants a service-layer backend application
- webhook endpoint support is needed inside a web server

### Use plain Java mode when

- the user asks for a lightweight starter
- there is no existing Spring Boot project
- the bot only needs to run as a simple standalone process
- the user wants minimal dependencies

### If unclear

If the user has not specified project type and no existing project context is available, prefer plain Java + Maven for a lightweight starter.

If webhook mode is required and the user provides a domain, Spring Boot mode is recommended.

## Required dependency

Use the official Java Telegram Bots library:

```xml
<dependency>
    <groupId>org.telegram</groupId>
    <artifactId>telegrambots</artifactId>
    <version>${telegrambots.version}</version>
</dependency>
```

Use a current stable version when creating a real project. Do not invent a version if the user has an existing dependency management policy.

For Spring Boot projects, include Spring Boot dependencies only if Spring Boot mode is selected.

## Configuration rules

The bot must read config from environment variables or application properties.

Required config:

```env
BOT_TOKEN=your_bot_token_here
BOT_USERNAME=your_bot_username_here
BOT_MODE=polling
WEBHOOK_URL=
```

Recommended behavior:

- if `WEBHOOK_URL` is present and non-empty, use webhook mode
- otherwise use long polling mode
- `BOT_MODE` may explicitly override auto detection if needed

Do not hardcode bot token or username in source code.

## Recommended structure: plain Java Maven

```txt
src/main/java/com/example/bot/
  Main.java
  config/
    BotConfig.java
  bot/
    TelegramLongPollingBotImpl.java
    TelegramWebhookBotImpl.java
    BotModeResolver.java
  handler/
    UpdateDispatcher.java
    CommandHandler.java
    MessageHandler.java
    CallbackQueryHandler.java
  command/
    StartCommand.java
    HelpCommand.java
    InfoCommand.java
  keyboard/
    ButtonItem.java
    ReplyKeyboardBuilder.java
    InlineKeyboardBuilder.java
  session/
    UserSession.java
    UserState.java
    UserSessionCache.java
  service/
    EchoService.java
  util/
    Texts.java
src/main/resources/
  application.properties.example
.env.example
README.md
```

## Recommended structure: Spring Boot Maven

```txt
src/main/java/com/example/bot/
  TelegramBotApplication.java
  config/
    BotProperties.java
    TelegramBotConfig.java
  bot/
    TelegramLongPollingBotImpl.java
    TelegramWebhookBotImpl.java
    BotModeResolver.java
  controller/
    TelegramWebhookController.java
  handler/
    UpdateDispatcher.java
    CommandHandler.java
    MessageHandler.java
    CallbackQueryHandler.java
  command/
    StartCommand.java
    HelpCommand.java
    InfoCommand.java
  keyboard/
    ButtonItem.java
    ReplyKeyboardBuilder.java
    InlineKeyboardBuilder.java
  session/
    UserSession.java
    UserState.java
    UserSessionCache.java
  service/
    EchoService.java
  util/
    Texts.java
src/main/resources/
  application.yml
.env.example
README.md
```

## Workflow

When this skill is used, follow this workflow:

1. Identify whether the project should be plain Java Maven or Spring Boot Maven.
2. Check whether the user already has a project.
3. If existing project exists, preserve its package style and dependency versions.
4. Add `org.telegram:telegrambots` dependency.
5. Create config model for token, username, mode, and webhook URL.
6. Create bot mode resolver.
7. Create long polling bot implementation.
8. Create webhook bot implementation only when needed or when starter must support both.
9. Create update dispatcher.
10. Create command, message, and callback handlers.
11. Add `/start`, `/help`, and `/info` commands.
12. Add echo message behavior.
13. Create reusable reply keyboard builder.
14. Create reusable inline keyboard builder.
15. Create `UserSession`, `UserState`, and `UserSessionCache`.
16. Add `.env.example` and config example.
17. Add README with run instructions.
18. Avoid unnecessary technologies.

## Command behavior

### `/start`

Must greet the user and show a simple starter menu.

Recommended response:

```txt
Assalomu alaykum! Bot ishga tushdi.
Quyidagi menyudan foydalaning yoki istalgan matn yuboring.
```

### `/help`

Must explain available commands.

Recommended response:

```txt
Buyruqlar:
/start - botni boshlash
/help - yordam
/info - bot starter haqida ma'lumot
```

### `/info`

Must briefly explain that the bot was generated using the `java-telegram-bot-builder` structure.

Recommended response:

```txt
Bu bot java-telegram-bot-builder structure asosida yaratilgan.
Unda polling/webhook support, reply/inline button builders va user session cache mavjud.
```

## Echo behavior

The starter bot must echo ordinary user text messages that are not commands.

Example:

User:

```txt
Salom
```

Bot:

```txt
Echo: Salom
```

Echo behavior must be easy to replace with real business logic.

## Button builder rules

The project must not create Telegram buttons by repeating long boilerplate code everywhere.

Create reusable builders for:

- `ReplyKeyboardMarkup`
- `InlineKeyboardMarkup`

### Reply keyboard rules

The reply keyboard builder should support:

- building from `List<String>`
- configurable row size
- resize keyboard option
- one-time keyboard option when needed

Example target API:

```java
ReplyKeyboardMarkup markup = ReplyKeyboardBuilder.fromList(
    List.of("Profile", "Settings", "Help"),
    2
);
```

### Inline keyboard rules

The inline keyboard builder should support:

- building from `List<ButtonItem>`
- configurable row size
- text and callback data per button
- developer-provided callback data

Do not auto-generate callback data.

Example target API:

```java
List<ButtonItem> buttons = List.of(
    new ButtonItem("Profile", "profile"),
    new ButtonItem("Settings", "settings"),
    new ButtonItem("Help", "help")
);

InlineKeyboardMarkup markup = InlineKeyboardBuilder.fromList(buttons, 2);
```

## ButtonItem model

Create a small immutable model for inline buttons.

Recommended shape:

```java
public record ButtonItem(String text, String callbackData) {
}
```

For Java versions below records support, use a simple final class with constructor and getters.

## User session/cache rules

Create an in-memory session cache based on Telegram user ID.

Recommended structure:

```java
private final ConcurrentHashMap<Long, UserSession> sessions = new ConcurrentHashMap<>();
```

The session must support:

- `userId`
- current `UserState`
- current step name
- temporary data map
- created time
- updated time

Recommended model:

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

Recommended states:

```java
public enum UserState {
    IDLE,
    WAITING_INPUT,
    PROCESSING
}
```

The cache is not a replacement for a database. State must be treated as temporary runtime data.

## Handler rules

The bot must separate update handling into dedicated classes.

Do not put all logic inside the bot class.

Recommended dispatch flow:

```txt
Update -> UpdateDispatcher
  -> command handler if message starts with /
  -> callback query handler if callback query exists
  -> message handler for ordinary text messages
```

## Polling/webhook rules

The bot should support both modes.

### Long polling

Use long polling when:

- `WEBHOOK_URL` is empty
- no public domain is configured
- the user wants local development

### Webhook

Use webhook when:

- `WEBHOOK_URL` is present
- the app is deployed behind HTTPS domain
- Spring Boot mode is selected or an HTTP server exists

### Auto detection

Recommended logic:

```java
boolean webhookEnabled = webhookUrl != null && !webhookUrl.isBlank();
```

If webhook is enabled, register webhook bot.
Otherwise, register long polling bot.

## Code quality rules

The generated code must:

- be simple and readable
- use clear package names
- avoid unnecessary abstractions
- keep Telegram-specific code isolated
- separate config, bot registration, handlers, keyboard builders, and session management
- not hardcode secrets
- not use global mutable static state unless there is a clear reason
- use `ConcurrentHashMap` for runtime session cache
- handle null update fields safely
- handle unknown callbacks gracefully
- log startup mode clearly

## Security and safety rules

Do not create functionality for:

- spam messaging
- scraping users
- bypassing Telegram limits
- mass unsolicited messages
- user account automation through MTProto
- storing bot token in source code
- exposing webhook endpoint without a secret/path strategy when production deployment is requested

For production webhook deployments, recommend:

- HTTPS domain
- secret webhook path
- externalized config
- server logs without token leakage

## Documentation rules

Always include README instructions for:

- required Java version
- Maven run command
- required environment variables
- how polling mode works
- how webhook mode works
- how to add commands
- how to add buttons
- how user session cache works

Always include `.env.example`.

## Do not overbuild

The starter must remain lightweight.

Do not add database, Redis, Docker, CI/CD, frontend, admin panel, OAuth, payments, queues, or complex architecture unless explicitly requested.

## Final output requirements

When asked to create a full skill package, generate:

```txt
java-telegram-bot-builder/
  SKILL.md
  README.md
  docs/
    project-structure.md
    button-builder.md
    session-cache.md
    polling-vs-webhook.md
    spring-boot-mode.md
    plain-java-mode.md
  references/
    dependencies.md
    env-example.md
  assets/
  scripts/
```

The skill package must be ZIP-ready.

## Test prompts

Use these prompts to test the skill:

```txt
Use $java-telegram-bot-builder. Create a plain Java Maven Telegram echo bot using org.telegram:telegrambots with /start, /help, /info, reply/inline button builders, and in-memory user session cache.
```

```txt
Use $java-telegram-bot-builder. Create a Spring Boot Telegram bot that automatically uses webhook when WEBHOOK_URL exists, otherwise long polling. Add reusable keyboard builders and user session cache.
```

```txt
Use $java-telegram-bot-builder. Add reusable ReplyKeyboardMarkup and InlineKeyboardMarkup builders to my existing Java Telegram bot project. Do not add database or Redis.
```
