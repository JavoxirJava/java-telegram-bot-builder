# Environment Example

Create `.env.example` or equivalent config documentation.

```env
BOT_TOKEN=your_bot_token_here
BOT_USERNAME=your_bot_username_here
BOT_MODE=auto
WEBHOOK_URL=
```

## Meaning

- `BOT_TOKEN` — token from BotFather
- `BOT_USERNAME` — bot username without `@`
- `BOT_MODE` — `auto`, `polling`, or `webhook`
- `WEBHOOK_URL` — public HTTPS webhook URL

## Auto mode

If `WEBHOOK_URL` is empty, use polling.

If `WEBHOOK_URL` is present, use webhook.
