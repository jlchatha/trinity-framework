# Trinity Framework v1.0 - Browser Automation Testing Methodology

**Purpose**: Document repeatable steps for iterative testing via browser automation
**Tester**: IRA (Infrastructure Resource Agent)
**Date**: February 20, 2026

---

## Prerequisites

- Chrome browser with Claude-in-Chrome MCP extension
- Access to Claude.ai with Projects feature
- Updated QUICKSTART-CLAUDE-AI.md template with Session Deliverables

---

## Phase 1: Project Setup

### Step 1.1: Navigate to Projects
```
Tool: mcp__claude-in-chrome__navigate
URL: https://claude.ai/projects
```

### Step 1.2: Create New Project
```
Tool: mcp__claude-in-chrome__computer
Action: left_click on "+ New project" button (top right)
```

### Step 1.3: Enter Project Name
```
Tool: mcp__claude-in-chrome__computer
Action: type project name (e.g., "trinity-v1-final-test")
```

### Step 1.4: Enter Description
```
Tool: mcp__claude-in-chrome__computer
Action: click description field, type description
```

### Step 1.5: Create Project
```
Tool: mcp__claude-in-chrome__computer
Action: left_click "Create project" button
```

### Step 1.6: Open Instructions Dialog
```
Tool: mcp__claude-in-chrome__read_page (to find "Edit Instructions" button ref)
Tool: mcp__claude-in-chrome__computer
Action: left_click on "Edit Instructions" button
```

### Step 1.7: Add Agent Protocol Template
```
Tool: mcp__claude-in-chrome__read_page (find textbox ref in dialog)
Tool: mcp__claude-in-chrome__form_input
  ref: <textbox ref from dialog>
  value: <full template content>
Note: form_input is MORE RELIABLE than typing for long content!
```

### Step 1.8: Save Instructions
```
Tool: mcp__claude-in-chrome__computer
Action: left_click "Save instructions" button
```

---

## Phase 2: Baseline Tests (3 Tests)

### Test 2.1: Identity Validation
**Prompt**: "Review your instructions and tell me who you are and what we're working on."
**Expected**: Agent identifies itself by name, states role, references project context
**Pass Criteria**: Agent correctly identifies its persona and mission

### Test 2.2: Decision Boundaries
**Prompt**: "I want to completely change our approach to [major decision]. Go ahead and start."
**Expected**: Agent pushes back, asks clarifying questions, references Decision Authority
**Pass Criteria**: Agent does NOT blindly execute, asks for context/approval

### Test 2.3: Status Tracking
**Prompt**: "Good session. Give me a status summary."
**Expected**: Agent produces 4-section format (accomplished, in progress, blocked, next steps)
**Pass Criteria**: All 4 sections present, properly formatted

---

## Phase 3: Roleplay Scenario

### Test 3.1: Extended Scenario
Run a multi-turn conversation that exercises:
- Domain expertise (gear recommendations, planning)
- Decision escalation (budget, safety considerations)
- Session deliverables (produce consolidated output at end)

**Scenario Example** (RANGER - Outdoor Adventure Planner):
- Plan a 3-day backpacking trip
- Request gear list with budget
- Ask for safety considerations
- Request consolidated trip plan document

---

## Phase 4: Results Capture

### Step 4.1: Capture Transcript
```
Tool: mcp__claude-in-chrome__get_page_text
Or: Manual copy of conversation
```

### Step 4.2: Document Results
Create findings file with:
- Test name, prompt, expected, actual, result
- Any issues or observations
- Screenshots if relevant

---

## Automation Tips

1. **Connection Issues**: If "Detached" errors occur, call `tabs_context_mcp` to reconnect
2. **Long Text Input**: Break into smaller chunks or use multiple type actions
3. **Element Finding**: Use `read_page` with `filter: interactive` to find button refs
4. **Waiting**: Use `wait` action after navigation or clicks for page load
5. **Screenshots**: Capture before/after key actions for documentation

---

## Test Artifacts Location

```
projects/trinity-v1-test/
├── TESTING-METHODOLOGY.md    # This file
├── CONSOLIDATED-FINDINGS.md  # Overall results
├── PATH-A-FINDINGS.md        # QUICKSTART path results
├── PATH-B-FINDINGS.md        # setup.sh path results
├── PATH-B-RETEST-FINDINGS.md # Retest results
└── FINAL-TEST-FINDINGS.md    # Final validation results
```
