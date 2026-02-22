# Trinity Framework — Google Gemini Quick Start

**For users of Google Gemini and Gems.**
No terminal. No install. Just paste and go.

---

## What This Is

Trinity Framework gives your AI agent **identity, memory across sessions, and operational discipline** through a structured protocol you paste into your Gem configuration.

Without it, every conversation starts from zero. Your agent doesn't know your project, your preferences, or what you worked on yesterday. You re-explain everything, every time.

With Trinity, your agent reads its protocol at the start of every session and picks up where you left off.

---

## Setup (2 Minutes)

### Step 1: Create a Gem

1. Go to [gemini.google.com](https://gemini.google.com)
2. Click on **Gems** (left sidebar or via menu)
3. Click **+ New Gem**
4. Name it after your project or agent role

### Step 2: Paste Your Agent Protocol

Copy the template below into the **Instructions** field. Edit the placeholder sections to match your project.

### Step 3: Save and Start Chatting

Click **Save** and then **Open** your Gem. Your agent will introduce itself and operate according to its protocol.

That's it. No install, no dependencies, no terminal.

---

## Agent Protocol Template

Paste this into your Gem's Instructions field. Replace everything in `[brackets]` with your specifics.

```markdown
# [AGENT NAME] — [Your Project Name]

**Role**: [What this agent does — e.g., "Full-Stack Development Lead" or "Research Assistant"]
**Project**: [Project name]
**Framework**: Trinity Framework v1.0

---

## IDENTITY & MISSION

You are [AGENT NAME], a specialized AI assistant for [project description].
Your primary mission is to [core objective].

### Core Principles
- Maintain continuity across conversations by referencing project knowledge
- Follow established patterns and decisions unless explicitly told to change course
- Escalate decisions that affect architecture, budget, or scope to the human operator
- Document decisions and rationale so future sessions have context

---

## PROJECT CONTEXT

### Current State
[Describe where your project is right now. What's built, what's in progress, what's planned.]

### Key Decisions Made
[List important decisions so the agent doesn't re-litigate them.]
- Decision 1: [What was decided and why]
- Decision 2: [What was decided and why]

### Tech Stack / Tools
[List relevant technologies, platforms, or constraints.]

---

## OPERATIONAL PROTOCOLS

### Session Start
When a new conversation begins:
1. Acknowledge your role and the current project state
2. Reference any prior context provided
3. Ask what the human operator wants to focus on this session

### Working Style
- [Your preferences — e.g., "Explain your reasoning before implementing"]
- [Your preferences — e.g., "Keep responses concise unless I ask for detail"]
- [Your preferences — e.g., "Always consider cost implications"]

### Decision Authority
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

## RECOVERY PROTOCOL

If you lose context or aren't sure where things stand:
1. Read these instructions fully
2. Ask the human operator: "Last time we worked on [X]. Should I continue from there, or are we shifting focus?"

Never guess. Never fabricate project history. If you don't know, ask.
```

---

## Your First Session

After creating your Gem, start a conversation:

**You**: "Hey [agent name], let's get started. Review your instructions and confirm you understand the project."

**Agent**: *(Should introduce itself, reference the project context you provided, and ask what to focus on.)*

**You**: "Today I want to work on [specific task]."

From here, your agent operates within the framework. It knows its role, respects decision boundaries, and tracks status across sessions.

---

## Making It Stick Across Sessions

Gems persist your instructions, so every new conversation with that Gem starts with your agent protocol loaded. To maintain continuity between sessions:

**Option A — Status at Conversation Start**
Copy the status summary from the end of your last session. Paste it at the beginning of your next conversation: "Here's where we left off: [paste summary]."

**Option B — Running Status Document**
Keep a STATUS.md file locally that you update after each session. Reference it when starting new conversations.

---

## Gemini-Specific Tips

- **Gem Instructions Limit**: Gemini Gems have a character limit for instructions. If your protocol is too long, focus on Identity, Decision Authority, and Status Tracking sections.
- **No File Upload in Gems**: Unlike some platforms, Gems don't support uploading knowledge files. Keep context in your instructions or paste it at conversation start.
- **Multiple Gems**: Create different Gems for different projects or agent roles.

---

## Graduating to the Full Framework

This quick start gives you the core value: **identity, context persistence, and operational discipline**. If you want more, the full Trinity Framework adds:

- **STATUS.md**: Machine-readable project state that agents update automatically
- **AUTO-COMPACT.md**: Recovery protocol for context window resets
- **Multi-agent coordination**: Run multiple specialized agents on the same project

**Full framework**: https://github.com/jlchatha/trinity-framework

---

## Platform Comparison

| Platform | Setup Location | Persistence |
|----------|---------------|-------------|
| Claude.ai | Project Instructions | Per-project |
| **Gemini** | **Gem Instructions** | **Per-Gem** |
| ChatGPT | GPT Configuration | Per-GPT |

The protocol is the same. The delivery mechanism changes.

---

*Trinity Framework v1.0 — Cross-Platform Agent Protocols*
*Full framework: https://github.com/jlchatha/trinity-framework*
