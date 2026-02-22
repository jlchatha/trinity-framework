# TEMPLATE-SMITH - SAGE Consultation Prep

**Prepared by**: IRA
**Date**: February 22, 2026
**Purpose**: Research findings and questions for SAGE consultation

---

## Executive Summary

TEMPLATE-SMITH is a proposed Trinity Framework agent that monitors an Instagram account for persona template requests, generates custom templates, and responds. This document presents research findings on the two key technical challenges and frames questions for SAGE.

---

## CHALLENGE 1: Trigger Mechanism

### Problem Statement
Claude Code is not a persistent daemon - CRON jobs cannot directly invoke it. We need a way to schedule periodic execution (e.g., every 10 minutes to check Instagram).

### Research Findings

#### Option A: claude-code-scheduler (Community Tool)
**Source**: [GitHub - jshchnz/claude-code-scheduler](https://github.com/jshchnz/claude-code-scheduler)

| Aspect | Details |
|--------|---------|
| How it works | Natural language scheduling → native OS scheduler (launchd/crontab/Task Scheduler) |
| Execution | Runs `claude -p "your command"` at scheduled times |
| Authentication | Uses Claude Code's existing auth |
| Permissions | Supports `--dangerously-skip-permissions` for autonomous tasks |
| Git integration | Worktree isolation for safe autonomous changes |
| Requirements | Claude Code v1.0.33+, CLI in PATH |
| Logging | Output to `~/.claude/logs/<task-id>.log` |

**Verdict**: Most mature community solution. Cross-platform. Active development.

#### Option B: runCLAUDErun (macOS Only)
**Source**: [runCLAUDErun](https://runclauderun.com/)

Native macOS app for scheduling Claude Code tasks. No scripts or cron needed. macOS-only limitation.

#### Option C: GitHub Actions
**Source**: [SmartScope Guide](https://smartscope.blog/en/generative-ai/claude/claude-code-scheduled-automation-guide/)

Use `anthropics/claude-code-action` in GitHub Actions with scheduled workflows. Built-in secret management, logging, and error notifications.

**Consideration**: Requires GitHub infrastructure, adds complexity.

#### Option D: Claude Code SDK (Anthropic Recommended)
**Source**: [GitHub Issue #4785](https://github.com/anthropics/claude-code/issues/4785)

Anthropic explicitly closed the request for native scheduled hooks, stating:
> "I think it is better to build this type of automation on top of the Claude Code SDK, not through hooks."

**Implication**: For production use, SDK-based approach is Anthropic's recommended path.

#### Option E: systemd timer / launchd (DIY)
Write wrapper script, configure native OS scheduler. More control, more maintenance.

### Trigger Mechanism Summary

| Option | Complexity | Cross-Platform | Production-Ready |
|--------|------------|----------------|------------------|
| claude-code-scheduler | Low | Yes | Community |
| runCLAUDErun | Low | macOS only | Community |
| GitHub Actions | Medium | Yes | Enterprise |
| Claude Code SDK | High | Yes | Official |
| systemd/launchd DIY | Medium | Platform-specific | DIY |

---

## CHALLENGE 2: Instagram Automation

### Problem Statement
How do we monitor Instagram for template requests and respond? Two approaches: browser automation (Chrome MCP) or official API.

### Research Findings

#### Option A: Browser Automation (Chrome MCP)

**What we have**: Claude-in-Chrome MCP tools already available.

**Risks** (per [Security Boulevard](https://securityboulevard.com/2025/06/from-puppeteer-stealth-to-nodriver-how-anti-detect-frameworks-evolved-to-evade-bot-detection/)):
- Instagram actively detects and bans automation
- Browser automation leaves detectable fingerprints
- Session persistence issues (frequent logouts)
- ToS violation risk → account termination
- "Anti-detect frameworks keep losing their evasion capabilities"

**ToS Considerations** (per [SpurNow Guide](https://www.spurnow.com/en/blogs/instagram-dm-automation-rules)):
- "Never use browser bots or Chrome extensions - those get accounts banned"
- Only messaging users who engaged in last 24 hours is allowed
- Cold outreach = spam = ban

**Verdict**: High risk. Existing tools work but account could be terminated.

#### Option B: Official Instagram Graph API + ig-mcp

**Source**: [ig-mcp on GitHub](https://github.com/jlbadano/ig-mcp)

An MCP server for Instagram Business accounts already exists!

**Requirements**:
- Instagram Business/Creator account (not personal)
- Facebook Page connected to account
- Meta Developer account + App credentials
- Advanced Access approval for DMs (2-6 weeks review)

**Limitations** (per [CreatorFlow](https://creatorflow.so/blog/instagram-api-rate-limits-explained/)):
- 200 DMs/hour rate limit
- 24-hour messaging window (must wait for user engagement first)
- 1 automated message per user per 24-hour period
- Cannot send unsolicited messages

**Process** (per [bot.space](https://www.bot.space/blog/the-instagram-dm-api-your-ultimate-guide-to-automation-sales-and-customer-loyalty-svpt5)):
- Create Facebook Developer App
- Request permissions: `instagram_basic`, `instagram_manage_messages`, `pages_messaging`
- Submit for Meta review (2-6 weeks)
- Implement token refresh (tokens expire in 60 days)

**Verdict**: Compliant but constrained. Only responds to user-initiated engagement.

### Instagram Automation Summary

| Approach | Risk | ToS Compliant | User Experience |
|----------|------|---------------|-----------------|
| Browser (Chrome MCP) | HIGH (ban risk) | Gray area | Full control |
| Official API (ig-mcp) | LOW | Yes | Must wait for user to engage first |

---

## ALTERNATIVE PLATFORMS TO CONSIDER

Given Instagram's constraints, should we consider other platforms?

### Discord
- Well-documented bot API
- No approval process for basic bots
- Users can `@mention` or DM the bot directly
- Rich formatting (embeds, code blocks)
- Trinity Framework could have a Discord server

### Twitter/X
- API access tiers (free tier very limited)
- Can monitor mentions
- Character limits may constrain responses (need to link to Gists)

### Slack
- If targeting enterprise users
- Slack apps have good documentation

### GitHub Discussions
- Already have the repo
- Native to developer audience
- No additional infrastructure

---

## SAGE CONSULTATION QUESTIONS

### Architecture Questions

1. **Platform Selection**: Given Instagram's 24-hour engagement window requirement, is Instagram the right platform? Would Discord or GitHub Discussions be better suited for a template request service?

2. **Browser vs API Trade-off**: If we proceed with Instagram, should we:
   - Use browser automation (risky but full control)
   - Use official API (compliant but reactive-only)
   - Hybrid (API for responses, manual monitoring for discovery)

3. **Trigger Mechanism**: For scheduling, which approach balances reliability with simplicity?
   - `claude-code-scheduler` (community, works now)
   - Claude Code SDK (official recommendation, more development)
   - GitHub Actions (enterprise-grade, adds complexity)

### Implementation Questions

4. **MVP Scope**: What's the minimum viable version to validate this concept?
   - Just respond to DMs? Or also comments/mentions?
   - Generate templates on-demand or queue for batch processing?
   - Auto-respond or queue for human review first?

5. **Failure Modes**: How do we handle:
   - Instagram session expiry (browser approach)
   - Rate limiting (API approach)
   - Malformed/unclear requests
   - Abusive/spam requests

6. **Disclosure Requirements**: Instagram requires bots to be identified as automated. How should TEMPLATE-SMITH's bio/responses indicate this?

### Strategic Questions

7. **Audience Alignment**: Is our target audience (developers wanting AI personas) actually on Instagram? Or are they more likely on:
   - Discord (gaming/dev communities)
   - Twitter/X (tech thought leaders)
   - Reddit (r/ChatGPT, r/ClaudeAI)
   - GitHub (already developers)

8. **Competitive Differentiation**: What makes TEMPLATE-SMITH valuable vs:
   - Users just asking ChatGPT/Claude directly for a persona
   - Existing prompt libraries (PromptBase, etc.)
   - The Trinity Framework README itself

9. **Resource Allocation**: Given this requires:
   - New private repo
   - Instagram account setup
   - Meta API approval (if API route)
   - Ongoing maintenance

   Is this the highest-value use of development time right now?

---

## IRA'S PRELIMINARY RECOMMENDATIONS

### On Platform
**Lean toward Discord or GitHub Discussions** over Instagram. Developer audience is more likely there, and both have friendlier automation policies. Instagram's 24-hour window requirement makes it reactive-only, defeating the "proactive outreach" vision.

### On Trigger Mechanism
**Start with `claude-code-scheduler`** for MVP. It works now, is cross-platform, and handles the scheduling complexity. Migrate to SDK-based approach if/when this becomes production-critical.

### On MVP Scope
1. Create `@trinityframework` Discord bot (or GitHub Discussions integration)
2. Monitor for keyword triggers ("template request", "persona help")
3. Parse request → Generate template → Post Gist → Respond with link
4. Queue unclear requests for human review
5. Log everything for iteration

### On Validation
Before building anything:
1. Manually respond to 5-10 template requests to validate demand
2. Track conversion (did they use the template?)
3. Identify patterns in requests

---

## FILES REFERENCED

- `/home/alreadyinuse/git/trinity-framework/TEMPLATE-SMITH-PROPOSAL.md` - Original proposal
- `/home/alreadyinuse/git/trinity-framework/CROSS-PLATFORM-TESTING.md` - Platform templates ready

---

## SOURCES

### Scheduling
- [claude-code-scheduler](https://github.com/jshchnz/claude-code-scheduler)
- [runCLAUDErun](https://runclauderun.com/)
- [GitHub Issue #4785 - Scheduled Hooks Request](https://github.com/anthropics/claude-code/issues/4785)
- [SmartScope - Claude Code Cron Guide](https://smartscope.blog/en/generative-ai/claude/claude-code-cron-schedule-automation-complete-guide-2025/)

### Instagram
- [Instagram DM Automation Rules 2026](https://www.spurnow.com/en/blogs/instagram-dm-automation-rules)
- [Instagram API Rate Limits](https://creatorflow.so/blog/instagram-api-rate-limits-explained/)
- [ig-mcp - Instagram MCP Server](https://github.com/jlbadano/ig-mcp)
- [Bot Detection Evolution](https://securityboulevard.com/2025/06/from-puppeteer-stealth-to-nodriver-how-anti-detect-frameworks-evolved-to-evade-bot-detection/)
- [Instagram Graph API Guide](https://www.bot.space/blog/the-instagram-dm-api-your-ultimate-guide-to-automation-sales-and-customer-loyalty-svpt5)

---

*Prepared for SAGE consultation - ready when HISTORIAN frees Chrome MCP*
