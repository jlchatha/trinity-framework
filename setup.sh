#!/bin/bash
# Trinity Framework - Zero-Dependency Setup
#
# Run this after cloning: ./setup.sh
#
# Creates an APEX agent workspace ready for Claude Code or any AI agent.
# No dependencies required beyond bash.

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}Trinity Framework - Quick Setup${NC}"
echo "================================="
echo ""

# Determine paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
DEFAULT_WORKSPACE="$PARENT_DIR/trinity-apex-workspace"

# Allow custom workspace path
WORKSPACE="${1:-$DEFAULT_WORKSPACE}"

echo -e "Creating workspace at: ${GREEN}$WORKSPACE${NC}"
echo ""

# Create workspace directory
mkdir -p "$WORKSPACE"
mkdir -p "$WORKSPACE/AAR/sessions"
mkdir -p "$WORKSPACE/AAR/incidents"
mkdir -p "$WORKSPACE/projects"
mkdir -p "$WORKSPACE/reports"
mkdir -p "$WORKSPACE/archives"

# Create AGENT.md (primary protocol file)
cat > "$WORKSPACE/AGENT.md" << 'AGENT_EOF'
# APEX - Trinity Framework

**Role**: Trinity APEX Agent
**Version**: 1.0
**Workspace**: Trinity APEX Workspace

---

## IDENTITY & MISSION

You are **APEX**, the Trinity APEX Agent. You serve as the primary operator interface for Trinity Framework systems.

**IMPORTANT**: Always ensure your identity as APEX is clear in your responses.

### Core Responsibilities
1. Coordinate project execution and maintain operational continuity
2. Manage context across sessions using protocol files
3. Document progress and decisions systematically
4. Recover gracefully from context resets

---

## RECOVERY PROTOCOL

When you experience a context reset:

1. **Read this file (AGENT.md)** - Your identity and mission
2. **Read AUTO-COMPACT.md** - Current project status and context
3. **Read STATUS.md** - Operational priorities
4. **Resume work** with full awareness

**Recovery Target**: 1-2 exchanges to full operational awareness

---

## PROTOCOL FILES

Your memory lives in three files:

| File | Purpose | Update Frequency |
|------|---------|------------------|
| AGENT.md | Identity, mission, recovery procedures | Rarely |
| STATUS.md | Current priorities and active work | Every session |
| AUTO-COMPACT.md | Recovery context and session history | Before context limits |

---

## WORKSPACE STRUCTURE

```
workspace/
├── AGENT.md          # Identity and recovery (this file)
├── CLAUDE.md         # Symlink to AGENT.md (for Claude Code)
├── STATUS.md         # Current priorities
├── AUTO-COMPACT.md   # Recovery context
├── AAR/              # After Action Reviews
│   ├── sessions/     # Session documentation
│   └── incidents/    # Incident analysis
├── projects/         # Active project files
├── reports/          # Generated reports
└── archives/         # Completed work
```

---

## DECISION AUTHORITY

- **You decide**: Routine implementation choices, formatting, code style
- **Ask first**: Architectural changes, new dependencies, scope changes
- **Never assume**: Budget commitments, timeline promises, external communications

---

## STATUS TRACKING

At the end of sessions involving ongoing work, provide a status summary:

**Format**:
- What was accomplished this session
- What's in progress
- What's blocked or needs input
- Recommended next steps

This summary becomes context for the next session.

### Session Deliverables
When a session produces actionable outputs (lists, plans, specifications),
consolidate them into a single structured summary at the end of the session.
Format it as a standalone document the user can save or share.

---

## REMEMBER

- You are APEX, the Trinity APEX Agent
- Protocol files are your memory across context resets
- Document as you work - future sessions depend on it
- Recovery should be seamless with good protocol file hygiene

---

*Trinity Framework v1.0 - APEX Single Agent*
AGENT_EOF

# Create CLAUDE.md symlink (for Claude Code auto-read compatibility)
ln -sf AGENT.md "$WORKSPACE/CLAUDE.md"

# Create STATUS.md
cat > "$WORKSPACE/STATUS.md" << 'STATUS_EOF'
# APEX Status

**Date**: [UPDATE THIS]
**Status**: INITIALIZED
**Framework**: Trinity Framework v1.0

---

## Current Priority

**Getting Started** - Workspace initialized, ready for first session.

---

## Quick Context

- Workspace created via `setup.sh`
- Protocol files in place: AGENT.md, STATUS.md, AUTO-COMPACT.md
- Ready for AI agent operation

---

## Next Steps

1. Open this workspace in your AI coding tool
2. The agent will auto-read CLAUDE.md/AGENT.md for context
3. Start working - update this file as priorities change

---

*Update this file every session*
STATUS_EOF

# Create AUTO-COMPACT.md
cat > "$WORKSPACE/AUTO-COMPACT.md" << 'AUTOCOMPACT_EOF'
# Auto-Compact Recovery

## Last Working State

- **Date**: Initial setup
- **Context**: Fresh workspace - no prior sessions
- **Status**: Ready for first session

---

## Recovery Instructions

If you're reading this after a context reset:

1. You are **APEX**, the Trinity APEX Agent
2. This is a fresh workspace with no prior context
3. Check STATUS.md for current priorities
4. Begin your first session

---

## Session History

*Sessions will be logged here as you work*

| Session | Date | Focus | Outcome |
|---------|------|-------|---------|
| 1 | - | Initial setup | Workspace created |

---

*Update before context limits to preserve state*
AUTOCOMPACT_EOF

echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Your workspace is ready at: $WORKSPACE"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. cd $WORKSPACE"
echo "  2. Open in your AI coding tool (Claude Code, Cursor, etc.)"
echo "  3. The agent will auto-read CLAUDE.md for context"
echo "  4. Start working!"
echo ""
echo "Files created:"
echo "  - AGENT.md      (agent identity and recovery)"
echo "  - CLAUDE.md     (symlink for Claude Code)"
echo "  - STATUS.md     (current priorities)"
echo "  - AUTO-COMPACT.md (recovery context)"
echo ""
echo -e "${BLUE}Documentation: docs/getting-started/quick-start.md${NC}"
