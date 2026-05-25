# Polling vs Webhook

The generated bot should support both long polling and webhook mode.

## Long polling

Use long polling when:

- no public HTTPS domain exists
- local development is needed
- `WEBHOOK_URL` is empty

Long polling is the default lightweight mode.

## Webhook

Use webhook when:

- a public HTTPS domain exists
- `WEBHOOK_URL` is configured
- deployment environment supports receiving Telegram updates through HTTP

Spring Boot is recommended for webhook mode because it can expose a webhook controller easily.

## Auto detection

Recommended logic:

```java
boolean webhookEnabled = webhookUrl != null && !webhookUrl.isBlank();
```

If webhook is enabled, register webhook bot.
Otherwise, register long polling bot.

## Environment variables

```env
BOT_TOKEN=your_bot_token_here
BOT_USERNAME=your_bot_username_here
BOT_MODE=auto
WEBHOOK_URL=
```

`BOT_MODE=auto` can be used when the app should decide based on `WEBHOOK_URL`.
