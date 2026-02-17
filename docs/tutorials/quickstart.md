# Trinity Framework Quick Start Guide

Get up and running with Trinity Framework in under 5 minutes.

## What You'll Get

A workspace where your AI agent:
- **Remembers context** across sessions via protocol files
- **Recovers seamlessly** from context resets
- **Documents progress** systematically
- **Maintains continuity** even as conversations reset

## Prerequisites

- Bash shell (Linux, macOS, or WSL)
- Git
- An AI coding tool (Claude Code, Cursor, Aider, etc.)

## Quick Setup

```bash
# 1. Clone the repository
git clone https://github.com/jlchatha/trinity-framework.git
cd trinity-framework

# 2. Run setup (creates workspace alongside this repo)
./setup.sh

# 3. Navigate to your new workspace
cd ../trinity-apex-workspace
```

That's it. Your workspace is ready.

## What Setup Creates

```
trinity-apex-workspace/
├── AGENT.md          # Agent identity and recovery procedures
├── CLAUDE.md         # Symlink (for Claude Code auto-read)
├── STATUS.md         # Current priorities (update every session)
├── AUTO-COMPACT.md   # Recovery context (update before limits)
├── AAR/              # After Action Reviews
│   ├── sessions/     # Session documentation
│   └── incidents/    # Incident analysis
├── projects/         # Your project files
├── reports/          # Generated reports
└── archives/         # Completed work
```

## Your First Session

### 1. Open the Workspace

Open `trinity-apex-workspace` in your AI coding tool:

```bash
# Claude Code
cd trinity-apex-workspace
claude

# Or open the folder in Cursor/VS Code with AI extension
```

### 2. The Agent Reads Protocol Files

When you start a session, the agent automatically reads:
- **CLAUDE.md** → Links to AGENT.md (identity)
- **STATUS.md** → Current priorities
- **AUTO-COMPACT.md** → Recovery context

### 3. Work Normally

Work on your project as usual. The agent now has:
- Clear identity (APEX)
- Recovery procedures
- A place to track state

### 4. Before Ending Your Session

Update the protocol files:

```markdown
# In STATUS.md - update current priorities
## Current Priority
Working on [your current task]

# In AUTO-COMPACT.md - update last working state
## Last Working State
- **Date**: [today]
- **Context**: [what you were doing]
- **Next Action**: [what to do next]
```

### 5. Next Session

When you start a new session (even after a context reset):
1. Agent reads protocol files automatically
2. Recovers full context in 1-2 exchanges
3. Continues where you left off

## The Protocol File System

| File | Purpose | Update When |
|------|---------|-------------|
| **AGENT.md** | Identity, mission, recovery procedures | Rarely (role changes) |
| **STATUS.md** | Current priorities, active work | Every session |
| **AUTO-COMPACT.md** | Recovery context, session history | Before context limits |

## Why This Works

Traditional AI conversations forget everything when context resets. Trinity Framework uses protocol files as external memory:

1. **Agent reads files** → Knows who it is and what it's doing
2. **You update files** → Context survives resets
3. **Agent recovers** → Seamless continuity

No complex infrastructure. No databases. Just markdown files that travel with your project.

## Custom Workspace Location

```bash
# Create workspace in a specific location
./setup.sh ~/my-projects/my-agent-workspace
```

## Next Steps

- Read [Protocol Files Reference](../reference/protocol-files.md) for details
- Explore [AAR System](../guides/aar-system.md) for documentation patterns

---

*Trinity Framework v1.0 - APEX Single Agent*
