# After Action Review (AAR) System

The AAR system provides structured documentation patterns for capturing lessons learned, session summaries, and incident analysis.

## Overview

```
AAR/
├── sessions/     # Session documentation
└── incidents/    # Incident analysis
```

## Session Documentation

### When to Create

- End of significant work sessions
- After completing major milestones
- Before extended breaks from a project

### Session Template

```markdown
# Session [N] - [Date]

## Focus
[What this session was about]

## Accomplished
- [What was completed]
- [Decisions made]
- [Progress achieved]

## Blockers
- [Issues encountered]
- [Unresolved questions]

## Next Session
- [What to pick up next]
- [Priority items]

## Notes
[Any additional context worth preserving]
```

### Naming Convention

```
AAR/sessions/session-NNNN-YYYY-MM-DD.md
```

Example: `session-0042-2025-01-15.md`

## Incident Documentation

### When to Create

- System failures or outages
- Significant bugs discovered
- Recovery from context loss
- Any event worth analyzing

### Incident Template

```markdown
# Incident - [Brief Description]

**Date**: [When it happened]
**Severity**: [High/Medium/Low]
**Status**: [Resolved/Investigating/Mitigated]

## Summary
[One paragraph description]

## Timeline
- [HH:MM] - [What happened]
- [HH:MM] - [Next event]

## Root Cause
[What caused the incident]

## Resolution
[How it was fixed]

## Lessons Learned
- [What we learned]
- [What to do differently]

## Action Items
- [ ] [Follow-up task 1]
- [ ] [Follow-up task 2]
```

### Naming Convention

```
AAR/incidents/incident-YYYY-MM-DD-brief-description.md
```

Example: `incident-2025-01-15-context-overflow.md`

## Best Practices

### Write for Recovery

Your future self (or future session) will read these documents after losing context. Write accordingly:

- Be specific, not vague
- Include file paths and exact details
- Don't assume prior knowledge
- Date everything

### Keep It Lightweight

AARs should be helpful, not burdensome:

- Short sessions might not need documentation
- Routine work doesn't need incident reports
- Use judgment about what's worth capturing

### Cross-Reference Protocol Files

AARs supplement protocol files:

- **STATUS.md** — Current state (always current)
- **AUTO-COMPACT.md** — Recovery context (recent history)
- **AAR/sessions/** — Detailed history (when needed)

Update protocol files every session. Create AARs when there's something worth preserving in detail.

## Integration with Protocol Files

When ending a session:

1. Update **STATUS.md** with current priorities
2. Update **AUTO-COMPACT.md** with recovery context
3. Optionally create AAR session doc for detailed record

When recovering:

1. Read protocol files first (quick recovery)
2. Reference AAR docs only if more context needed

---

*Trinity Framework v1.0 - APEX Single Agent*
