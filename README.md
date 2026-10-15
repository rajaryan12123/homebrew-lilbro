# 🧪 better-call-lilbro

> Better call lil bro: he cooks your code while you're out.

Use **Claude Code on your Mac from Telegram on your phone**: start sessions, send prompts, get
replies, tap Allow / Deny when Claude needs permission, pick up a session you started on your
laptop, and run Terminal commands. Nothing to host: a small app on your Mac talks to your own
private Telegram bot.

## You need

- A Mac with [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and logged in
  (typing `claude` in a terminal works)
- [Homebrew](https://brew.sh)
- Telegram on your phone

## Install (5 minutes)

**1. Make your Telegram bot.** In Telegram, open **@BotFather**, send `/newbot`, pick a name and a
username ending in `bot`. It gives you a **token** like `123456789:AAH...`. Keep it secret.

**2. Install.** Paste this into Terminal:

```bash
brew install rajaryan12123/lilbro/lilbro
lilbro setup
```

Setup asks for your bot token, then asks you to message your bot so only **you** can use it, and
whether to turn on shell mode. Then it starts, and macOS asks a few times whether **lilbro** may
use your Downloads, Desktop and Documents folders and record the screen (for `/screenshot`): click
**Allow** (or Don't Allow for anything you want to keep private). Your bot messages you 🟢. Send it
`/help`.

It starts by itself when you log in and restarts if it crashes. Everything stays on your Mac in
`~/.better-call-lilbro/`.

## Everyday use

| To | Run |
|---|---|
| See if it's running | `lilbro status` |
| Something's wrong | `lilbro doctor` |
| Let macOS ask for folder and screen access again | `lilbro permissions` (at the Mac) |
| Watch the log | `lilbro logs` |
| Restart / stop / start | `lilbro restart` · `lilbro stop` · `lilbro start` |
| Update | `brew update && brew upgrade lilbro && lilbro restart` |
| Change bot, user or shell mode | `lilbro setup` |
| Remove it | `lilbro uninstall`, then `brew uninstall lilbro` |

## Good to know

- **Only you can use your bot.** Messages from anyone else are ignored.
- **Your token stays on your Mac.** If it leaks, send `/revoke` to @BotFather and run `lilbro setup`.
- **Telegram can see your prompts and Claude's replies** (bot chats aren't end-to-end encrypted).
- **Shell mode** (off unless you turn it on) runs Terminal commands from Telegram: anyone who gets
  into your Telegram account could run anything on your Mac.
- **macOS asks before lilbro touches your folders or screen.** If a popup comes up while you're
  away, whatever triggered it waits until someone answers. Approve them once at the Mac (setup
  does this, or run `lilbro permissions`). Change them later in System Settings → Privacy &
  Security → Files & Folders / Screen & System Audio Recording → lilbro.
- Your Mac has to be awake and online for the bot to answer.
