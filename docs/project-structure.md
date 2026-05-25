# Project Structure

This skill creates a clean Telegram bot structure instead of putting everything into one class.

## Plain Java Maven structure

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
```

## Spring Boot Maven structure

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
```

## Design principle

The bot class must stay thin.

Update processing should flow like this:

```txt
Update -> UpdateDispatcher -> CommandHandler / MessageHandler / CallbackQueryHandler
```
