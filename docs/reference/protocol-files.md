# Protocol Files Reference

Protocol files are markdown documents that give your AI agent persistent memory across sessions. They're the core of Trinity Framework.

## Overview

| File | Purpose | Update Frequency |
|------|---------|------------------|
| **AGENT.md** | Identity and recovery procedures | Rarely |
| **STATUS.md** | Current priorities and active work | Every session |
| **AUTO-COMPACT.md** | Recovery context and session history | Before context limits |

## AGENT.md

The identity file. Defines who your agent is and how it should recover from context resets.

### Required Sections

```markdown
# [Agent Name] - Trinity Framework

## IDENTITY & MISSION
- Role definition
- Core responsibilities
- Operational scope

## RECOVERY PROTOCOL
1. Read this file (AGENT.md)
2. Read AUTO-COMPACT.md
3. Read STATUS.md
4. Resume work

## PROTOCOL FILES
- Table of files and their purposes

## WORKSPACE STRUCTURE
- Directory layout reference
```

### Best Practices

- Keep identity stable across sessions
- Update only when agent role fundamentally changes
- Include clear recovery steps
- Reference other protocol files

## STATUS.md

The priorities file. Tracks what the agent is currently working on.

### Required Sections

```markdown
# [Agent Name] Status

**Date**: [Current date]
**Status**: [ACTIVE/BLOCKED/COMPLETE]

## Current Priority
[What you're working on right now]

## Quick Context
- [Key context point 1]
- [Key context point 2]

## Next Steps
1. [Immediate next action]
2. [Following action]
```

### Best Practices

- Update every session
- Keep current priority singular and clear
- Include enough context to resume immediately
- Date your updates

## AUTO-COMPACT.md

The recovery file. Contains detailed context for seamless session recovery.

### Required Sections

```markdown
# Auto-Compact Recovery

## Last Working State
- **Date**: [When]
- **Context**: [What was happening]
- **Status**: [Current state]

## Recovery Instructions
[Steps to recover if reading after reset]

## Session History
| Session | Date | Focus | Outcome |
|---------|------|-------|---------|
| N | [date] | [focus] | [outcome] |
```

### Best Practices

- Update before hitting context limits
- Include specific details that would be lost
- Maintain session history table
- Write for your future self

## CLAUDE.md Symlink

For Claude Code compatibility, `CLAUDE.md` should be a symlink to `AGENT.md`:

```bash
ln -sf AGENT.md CLAUDE.md
```

Claude Code automatically reads `CLAUDE.md` at session start, which loads your agent's identity.

## File Relationships

```
CLAUDE.md ──symlink──> AGENT.md (identity)
                           │
                           ▼
                      STATUS.md (priorities)
                           │
                           ▼
                   AUTO-COMPACT.md (recovery context)
```

The agent reads these in order during recovery:
1. AGENT.md — "Who am I?"
2. STATUS.md — "What am I doing?"
3. AUTO-COMPACT.md — "What happened and what's next?"

## Validation

Use the compliance check to verify protocol files:

```bash
./tools/compliance-check.sh
```

Or use the GitHub Actions workflow (`.github/workflows/trinity-compliance.yml`).

---

*Trinity Framework v1.0 - APEX Single Agent*
