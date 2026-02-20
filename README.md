# Trinity Framework

**Context-resilient AI agent workspaces. No infrastructure required.**

---

## The Problem

Every AI coding session starts the same way:

> "Let me re-explain everything we did yesterday..."
> "Remember that bug we fixed? Here's what happened..."
> "We decided X last week. Here's why..."

**Before Trinity:**
- Re-explain context every session
- Lose decisions when conversations reset
- Agent forgets who it is and what it's doing
- No continuity between sessions
- Complex setups that require databases, servers, or cloud services

**After Trinity:**
- Agent recovers context in 1-2 exchanges
- Decisions persist in simple markdown files
- Clear identity and recovery procedures
- Seamless continuity across resets
- Zero dependencies beyond bash and git

---

## How It Works

Trinity uses **protocol files** — simple markdown files that give your AI agent persistent memory:

| File | Purpose |
|------|---------|
| `AGENT.md` | Agent identity and recovery procedures |
| `STATUS.md` | Current priorities (update every session) |
| `AUTO-COMPACT.md` | Recovery context (update before limits) |

When a session starts, your agent reads these files and knows exactly who it is, what it's working on, and what to do next.

No databases. No servers. Just markdown files that travel with your project.

---

## Quick Start

### Path A — No terminal required

Don't use a coding agent? No problem. Trinity works in Claude.ai Projects, ChatGPT, Gemini, or any chat interface.

**[→ Start here: QUICKSTART-CLAUDE-AI.md](./QUICKSTART-CLAUDE-AI.md)**

---

### Path B — Full framework (coding agents)

**One-liner install:**
```bash
# Review first: https://github.com/jlchatha/trinity-framework/blob/v1.0/setup.sh
curl -sSL https://raw.githubusercontent.com/jlchatha/trinity-framework/v1.0/setup.sh | bash
```

**Or clone and inspect:**
```bash
git clone https://github.com/jlchatha/trinity-framework.git
cd trinity-framework
./setup.sh
```

**Then start working:**
```bash
cd ../trinity-apex-workspace
claude  # or cursor, aider, etc.
```

That's it. Your agent workspace is ready.

---

## What You Get

```
trinity-apex-workspace/
├── AGENT.md          # Agent identity and recovery
├── CLAUDE.md         # Symlink (Claude Code auto-reads this)
├── STATUS.md         # Current priorities
├── AUTO-COMPACT.md   # Recovery context
├── AAR/              # After Action Reviews
│   ├── sessions/     # Session documentation
│   └── incidents/    # Incident analysis
├── projects/         # Your project files
└── archives/         # Completed work
```

---

## Your First Session

1. **Open workspace** in your AI coding tool
2. **Agent reads protocol files** automatically
3. **Work normally** on your project
4. **Update STATUS.md** before ending session
5. **Next session** — agent recovers context seamlessly

See the [Quick Start Guide](docs/tutorials/quickstart.md) for detailed walkthrough.

---

## Why Protocol Files?

**Your system prompt tells your agent who to be.**
**Trinity tells your agent who to be, where it is, and how to recover.**

Static system prompts can't track:
- What you decided yesterday
- Where you left off
- What's currently broken
- What to do next

Protocol files can. And they're just markdown — readable, editable, version-controlled.

---

## Works With

- **Claude Code** (auto-reads CLAUDE.md)
- **Cursor** (AI reads workspace files)
- **Aider** (file-based context)
- **Any AI coding tool** that can read files

---

## Documentation

- [Quick Start Guide](docs/tutorials/quickstart.md) — Get running in 5 minutes
- [Protocol Files Reference](docs/reference/protocol-files.md) — Deep dive on the file system
- [AAR System](docs/guides/aar-system.md) — Documentation patterns

---

## Version

**v1.0 — APEX Single Agent**

This release provides the core protocol file system for a single AI agent. Future releases will add multi-agent coordination.

---

## License

MIT License — see [LICENSE](LICENSE) for details.

---

## Contributing

Contributions welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

---

*Trinity Framework — Because your AI agent shouldn't have amnesia.*
