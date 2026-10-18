# 🧪 better-call-lilbro

> Better call lil bro: he cooks your code while you're out.

Use **Claude Code on your Mac from Telegram or Slack on your phone**: start sessions, send
prompts, get replies, tap Allow / Deny when Claude needs permission, answer its questions, pick up
a session you started on your laptop, see your screen and run Terminal commands. Nothing to host:
a small app on your Mac talks to your own private bot.

## You need

- A Mac with [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and logged in
  (typing `claude` in a terminal works)
- [Homebrew](https://brew.sh)
- Telegram on your phone, or a Slack workspace where you may install apps (or both)

## Install (5 minutes)

Paste this into Terminal:

```bash
brew install rajaryan12123/lilbro/lilbro
lilbro setup
```

Setup asks where you want to use lilbro from: **1) Telegram 2) Slack**, or both (`1,2`). It walks
you through each:

- **Telegram:** open **@BotFather**, send `/newbot`, pick a name and a username ending in `bot`,
  and paste the token it gives you.
- **Slack:** pick a name and a slash command for your app (e.g. `/lilbro`). Setup opens Slack's
  "Create app" page already filled in: pick the workspace and create it. Then copy the two tokens
  it asks for and press Enter. They're read from the clipboard and never shown.

Then you message your bot once, so only **you** can use it, and setup asks whether to allow shell
mode (off unless you say yes). It starts, and macOS asks a few times whether **lilbro** may use
your Downloads, Desktop and Documents folders and record the screen (for screenshots): click
**Allow** (or Don't Allow for anything you want to keep private). Your bot messages you 🟢. Send it
`/help` (Slack: `/lilbro help`).

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
| Add Telegram, Slack or PagerDuty later | `lilbro add telegram` · `lilbro add slack` · `lilbro add pagerduty` |
| Turn one off | `lilbro remove telegram` · `lilbro remove slack` · `lilbro remove pagerduty` |
| Change bots, users or shell mode | `lilbro setup` |
| Remove it | `lilbro uninstall`, then `brew uninstall lilbro` |

## Handy from your phone

Besides prompts and sessions, a few commands help when you're away from the Mac
(Slack: `/<your command> <name>`):

| Send | What it does |
|---|---|
| `/mcp` | which MCP servers work; **Reconnect** buttons for ones that dropped, a sign-in link for claude.ai connectors |
| `/gcloud_adc` | sign in to Google Cloud again (Application Default Credentials): tap the link, sign in, send back the code (it's hidden right away) · `/gcloud_adc status` |
| `/autoack` | PagerDuty auto-acknowledge, if you connected it: on/off, health, the last 14 hours |

**PagerDuty auto-ack** (optional, `lilbro add pagerduty`): every few minutes lilbro acknowledges new
incidents assigned to you on the services you pick, so PagerDuty doesn't call you; incidents stay
open for triage. Ones a person triggered by hand, or from other teams' services, still ring. You
get a short "📟 Acked N alerts from 12:42 to 13:12" every half hour (your choice in setup). It needs
a PagerDuty *user* API token (My Profile → User Settings → Create API User Token).

## Good to know

- **Only you can use your bot.** Messages from anyone else are ignored.
- **Your tokens stay on your Mac.** If one leaks, revoke it (Telegram: `/revoke` to @BotFather;
  Slack: regenerate it in the app's settings) and run `lilbro setup`.
- **Telegram or Slack can see your prompts and Claude's replies** (bot chats aren't end-to-end
  encrypted; in a company Slack, its admins' retention rules apply).
- **Shell mode** (off unless you allow it in setup) runs Terminal commands from your chat: anyone
  who gets into your Telegram or Slack account could run anything on your Mac. In Slack, sudo
  passwords are typed in a form, so they never become a message.
- **macOS asks before lilbro touches your folders or screen.** If a popup comes up while you're
  away, whatever triggered it waits until someone answers. Approve them once at the Mac (setup
  does this, or run `lilbro permissions`). Change them later in System Settings → Privacy &
  Security → Files & Folders / Screen & System Audio Recording → lilbro.
- Your Mac has to be awake and online for the bot to answer.
