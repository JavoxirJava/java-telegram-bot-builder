# Button Builder

This skill requires reusable button builders for Telegram keyboards.

The goal is to avoid manually writing long keyboard markup code every time.

## Supported button types

- `ReplyKeyboardMarkup`
- `InlineKeyboardMarkup`

## Reply keyboard builder

The reply keyboard builder should accept a simple list of button texts.

Example target usage:

```java
ReplyKeyboardMarkup markup = ReplyKeyboardBuilder.fromList(
    List.of("Profile", "Settings", "Help"),
    2
);
```

Recommended features:

- build from `List<String>`
- configurable row size
- resize keyboard support
- one-time keyboard support when needed

## Inline keyboard builder

Inline buttons need both visible text and callback data.

Callback data must be provided by the developer.

Example target usage:

```java
List<ButtonItem> buttons = List.of(
    new ButtonItem("Profile", "profile"),
    new ButtonItem("Settings", "settings"),
    new ButtonItem("Help", "help")
);

InlineKeyboardMarkup markup = InlineKeyboardBuilder.fromList(buttons, 2);
```

## ButtonItem

Recommended model:

```java
public record ButtonItem(String text, String callbackData) {
}
```

For older Java versions, create a final class with constructor and getters.

## Rules

- Do not auto-generate callback data.
- Do not duplicate keyboard creation boilerplate in handlers.
- Keep button builder classes small and reusable.
- Validate empty lists safely.
