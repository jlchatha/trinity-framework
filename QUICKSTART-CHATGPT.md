# Trinity Framework — ChatGPT Quick Start

**For users of ChatGPT and Custom GPTs.**
No terminal. No install. Just paste and go.

---

## What This Is

Trinity Framework gives your AI agent **identity, memory across sessions, and operational discipline** through a structured protocol you configure in ChatGPT.

Without it, every conversation starts from zero. Your agent doesn't know your project, your preferences, or what you worked on yesterday. You re-explain everything, every time.

With Trinity, your agent reads its protocol at the start of every session and picks up where you left off.

---

## Two Setup Options

### Option A: Custom GPT (Recommended)
Best for dedicated project assistants with full protocol support.

### Option B: Custom Instructions
Quick setup that applies to all ChatGPT conversations. More limited but faster.

---

## Option A: Custom GPT Setup (5 Minutes)

### Step 1: Create a GPT

1. Go to [chatgpt.com](https://chatgpt.com)
2. Click your profile → **My GPTs** → **Create a GPT**
3. Click the **Configure** tab (not Create)

### Step 2: Configure Your GPT

**Name**: Your agent name (e.g., "ATLAS - Portfolio Project")

**Description**: Brief description of what this agent does

**Instructions**: Paste the Agent Protocol Template below

### Step 3: Save and Start Chatting

Click **Save** (choose "Only me" for private use). Open your GPT and start working.

---

## Option B: Custom Instructions Setup (2 Minutes)

### Step 1: Open Custom Instructions

1. Click your profile icon → **Settings**
2. Go to **Personalization** → **Custom Instructions**

### Step 2: Configure Both Fields

**"What would you like ChatGPT to know about you?"**
```
I use Trinity Framework for AI agent protocols.
My current project: [project name]
My agent's name: [AGENT NAME]
Current phase: [planning/development/testing]
```

**"How would you like ChatGPT to respond?"**
Paste a condensed version of the protocol focusing on:
- Identity acknowledgment
- Decision authority boundaries
- Status tracking format

### Step 3: Save

Click **Save**. These instructions now apply to all new conversations.

---

## Agent Protocol Template

For Custom GPTs, paste this into the **Instructions** field. Replace everything in `[brackets]` with your specifics.

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
2. Reference any uploaded knowledge files for context
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
2. Check any uploaded knowledge files for current state
3. Ask the human operator: "Last time we worked on [X]. Should I continue from there, or are we shifting focus?"

Never guess. Never fabricate project history. If you don't know, ask.
```

---

## Your First Session

After creating your GPT or setting Custom Instructions, start a conversation:

**You**: "Hey [agent name], let's get started. Review your instructions and confirm you understand the project."

**Agent**: *(Should introduce itself, reference the project context you provided, and ask what to focus on.)*

**You**: "Today I want to work on [specific task]."

From here, your agent operates within the framework. It knows its role, respects decision boundaries, and tracks status across sessions.

---

## Making It Stick Across Sessions

### For Custom GPTs
GPTs persist your instructions, so every conversation with that GPT starts with your agent protocol loaded. To maintain continuity:

**Option A — Knowledge Files**
Upload a STATUS.md file to your GPT's knowledge. Update it periodically with current project state.

**Option B — Status at Conversation Start**
Copy the status summary from the end of your last session. Paste it at the beginning of your next conversation.

### For Custom Instructions
Custom Instructions apply globally but don't support file uploads. Use the "Status at Conversation Start" approach.

---

## ChatGPT-Specific Tips

- **Custom GPTs vs Custom Instructions**: GPTs are better for dedicated project assistants. Custom Instructions are better for general enhancement across all chats.
- **Knowledge Files**: Custom GPTs support uploading files (PDFs, docs, code). Use this for project documentation, specs, or a running STATUS.md.
- **Memory Feature**: ChatGPT's Memory feature can complement Trinity protocols, but don't rely on it for critical project state—use explicit status tracking.
- **Conversation History**: ChatGPT Plus saves conversation history. You can reference prior chats, but explicit status summaries are more reliable.

---

## Graduating to the Full Framework

This quick start gives you the core value: **identity, context persistence, and operational discipline**. If you want more, the full Trinity Framework adds:

- **STATUS.md**: Machine-readable project state that agents update automatically
- **AUTO-COMPACT.md**: Recovery protocol for context window resets
- **Multi-agent coordination**: Run multiple specialized agents on the same project

**Full framework**: https://github.com/jlchatha/trinity-framework

---

## Platform Comparison

| Platform | Setup Location | File Upload | Persistence |
|----------|---------------|-------------|-------------|
| Claude.ai | Project Instructions | Yes | Per-project |
| Gemini | Gem Instructions | No | Per-Gem |
| **ChatGPT** | **GPT Configuration** | **Yes** | **Per-GPT** |

The protocol is the same. The delivery mechanism changes.

---

*Trinity Framework v1.0 — Cross-Platform Agent Protocols*
*Full framework: https://github.com/jlchatha/trinity-framework*
