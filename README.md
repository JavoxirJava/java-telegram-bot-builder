# java-telegram-bot-builder

`java-telegram-bot-builder` is a skill for generating clean Java Telegram bot starters using `org.telegram:telegrambots`.

It helps an AI agent create a reusable Telegram bot structure with:

- plain Java Maven or Spring Boot Maven support
- long polling and webhook modes
- automatic mode selection using config
- `/start`, `/help`, `/info` starter commands
- echo bot behavior
- reusable reply keyboard builder
- reusable inline keyboard builder
- in-memory user session/cache manager
- `.env.example` and documentation

## Install

```sh
npx skills add <your-github-username>/java-telegram-bot-builder
```

Replace `<your-github-username>` with your GitHub username or organization after publishing.

## Usage prompt examples

```txt
Use $java-telegram-bot-builder. Create a plain Java Maven Telegram echo bot using org.telegram:telegrambots with /start, /help, /info, reply/inline button builders, and in-memory user session cache.
```

```txt
Use $java-telegram-bot-builder. Create a Spring Boot Telegram bot that automatically uses webhook when WEBHOOK_URL exists, otherwise long polling. Add reusable keyboard builders and user session cache.
```

```txt
Use $java-telegram-bot-builder. Add reusable ReplyKeyboardMarkup and InlineKeyboardMarkup builders to my existing Java Telegram bot project. Do not add database or Redis.
```

## What this skill creates

The skill guides the agent to generate a Java Telegram bot project with a clean package structure:

```txt
config/
bot/
handler/
command/
keyboard/
session/
service/
util/
```

The starter bot supports:

- `/start` command
- `/help` command
- `/info` command
- ordinary text echo response
- callback query handling structure
- reply keyboard buttons
- inline keyboard buttons
- user state/session cache

## Main dependency

```xml
<dependency>
    <groupId>org.telegram</groupId>
    <artifactId>telegrambots</artifactId>
    <version>${telegrambots.version}</version>
</dependency>
```

## Config example

```env
BOT_TOKEN=your_bot_token_here
BOT_USERNAME=your_bot_username_here
BOT_MODE=polling
WEBHOOK_URL=
```

If `WEBHOOK_URL` is empty, the bot should run in long polling mode.

If `WEBHOOK_URL` exists, the bot should use webhook mode.

## What this skill does not do by default

This skill does not add by default:

- database
- Redis
- Docker
- frontend
- admin panel
- payment system
- queue system
- MTProto user-client API
- mass messaging/spam automation

## Recommended publish checklist

Before publishing this skill:

- [ ] Check `SKILL.md` frontmatter
- [ ] Confirm the scope is narrow
- [ ] Confirm examples are clear
- [ ] Confirm no secrets exist in files
- [ ] Add your GitHub repo path to install command
- [ ] Test with at least one plain Java prompt
- [ ] Test with at least one Spring Boot prompt

## License

Choose a license before publishing, for example MIT.
