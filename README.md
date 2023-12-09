# AoC Signal bot

Used to send a [Signal](https://signal.org/) message each time a private leaderboard on [Advent of Code](https://adventofcode.com/) is updated.

## Configuration

Environmental variables needed to be provided are listed in `.env.example`:

```text
SESSION= # Session ID
LEADERBOARD= # Private leaderboard ID
RECIPIENT= # Signal group ID
```

You'll need to manually link `signal-cli` to an active account, or register a new one
