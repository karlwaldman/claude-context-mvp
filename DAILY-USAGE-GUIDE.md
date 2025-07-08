# Daily Usage Guide: Claude Context System

## 🔄 For Existing Git Projects

### Initial Setup (One Time - 5 minutes)
```bash
# Navigate to your existing project
cd ~/your-existing-project

# Copy the context files from this MVP
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-context.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-tasks.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-decisions.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-safety-simple.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-workflow-template.md

# Add to .gitignore if you want these private
echo "claude-*-working.md" >> .gitignore

# Customize claude-context.md for your project
# Edit the file to describe YOUR project's goals

# Commit the context system
git add claude-*.md .gitignore
git commit -m "Add Claude context system for AI pair programming"
git push
```

### Daily Workflow

#### Morning Start (2 minutes)
```bash
# 1. Pull latest changes
git pull

# 2. Start Claude session and tell it:
"Please read claude-context.md and claude-tasks.md to understand the current project state"

# 3. Claude will know:
# - What you were working on
# - Current priorities
# - Any blockers or questions
```

#### During Development
```bash
# Tell Claude to update context regularly:
"Update claude-context.md with our current progress"

# When switching tasks:
"Update claude-tasks.md - mark task X as complete, start task Y"

# When making decisions:
"Add this decision to claude-decisions.md"
```

#### Mobile Interruptions
1. Get a Slack/email while away from desk
2. Open GitHub mobile app
3. Edit `claude-context.md` 
4. Add: "URGENT: Customer reported bug in login flow"
5. Next Claude session will prioritize this

#### End of Day (2 minutes)
```bash
# Have Claude summarize:
"Update claude-context.md with today's progress and tomorrow's priorities"

# Commit all context updates
git add claude-*.md
git commit -m "End of day context update"
git push
```

---

## 🆕 For New Projects

### Project Creation (10 minutes)
```bash
# Create new project
mkdir my-new-project
cd my-new-project
git init

# Download context system
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-context.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-tasks.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-decisions.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-safety-simple.md
curl -O https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-workflow-template.md

# Create initial project files
echo "# My New Project" > README.md
echo "node_modules/\n.env\nclaude-*-working.md" > .gitignore

# Have Claude help set up the project:
"Read claude-context.md, then help me set up a new [React/Python/etc] project. 
Update the context file with our project goals."
```

### First Week Workflow

#### Day 1: Planning
```
Claude: "Let's plan the project architecture. I'll update claude-tasks.md with our initial tasks and claude-decisions.md with our tech stack choices."
```

#### Day 2-3: Implementation
```
Morning: "Read our context files. What should we work on today?"
Claude reads context and continues where you left off
Evening: "Update context with today's progress"
```

#### Day 4-5: Iteration
```
From mobile: Edit claude-tasks.md to add "Customer wants dark mode"
Next session: Claude sees the new requirement and prioritizes it
```

---

## 💡 Pro Tips

### 1. Context Branching
```bash
# Working on a feature branch?
git checkout -b feature/dark-mode
# Context files go with you!
# Update them specific to this feature
```

### 2. Team Collaboration
```bash
# Team member adds to claude-tasks.md:
"[READY] Fix CSS bug in header - assigned to Claude+Karl"

# You start Claude session:
"Check claude-tasks.md for tasks assigned to us"
```

### 3. Project Templates
Create templates for different project types:
- `claude-context-webapp.md`
- `claude-context-api.md`
- `claude-context-mobile.md`

### 4. Quick Mobile Updates
Bookmark these URLs (replace with your repo):
- `github.com/YOU/PROJECT/edit/main/claude-context.md`
- `github.com/YOU/PROJECT/edit/main/claude-tasks.md`

### 5. Integration with Existing Tools
```markdown
<!-- In claude-tasks.md -->
## 🎯 Active Tasks
1. **[READY]** Fix issue #234
   - GitHub: https://github.com/org/repo/issues/234
   - Jira: https://company.atlassian.net/browse/PROJ-123
```

---

## 📊 Real-World Examples

### Example 1: Bug Fix During Lunch
```
12:00 PM - Get urgent Slack about bug
12:01 PM - Open GitHub mobile
12:02 PM - Edit claude-context.md: "URGENT: Payment flow broken"
12:03 PM - Back to lunch
2:00 PM - Start Claude: "Read context - we have an urgent bug"
2:01 PM - Claude sees the URGENT note and prioritizes the fix
```

### Example 2: Weekend Idea
```
Saturday - Have great idea for optimization
Open GitHub mobile, add to claude-tasks.md:
"[IDEA] Cache API responses to reduce load"
Monday - Claude sees the idea and helps implement it
```

### Example 3: Handoff to Teammate
```
Your context update: "Implemented user auth, but stuck on OAuth redirect. 
See error details in claude-decisions.md under 'OAuth Issue'"

Teammate's Claude session: "Read the context files. Karl is stuck on OAuth. 
Let's look at the error in claude-decisions.md and help solve it."
```

---

## 🚀 Advanced: CI/CD Integration

```yaml
# .github/workflows/context-check.yml
name: Context Freshness Check
on: [push]
jobs:
  check-context:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Check context age
        run: |
          # Alert if context hasn't been updated in 24 hours
          LAST_UPDATE=$(git log -1 --format=%ct claude-context.md)
          CURRENT_TIME=$(date +%s)
          AGE=$((CURRENT_TIME - LAST_UPDATE))
          if [ $AGE -gt 86400 ]; then
            echo "::warning::Context hasn't been updated in 24 hours"
          fi
```

---

## 🎯 Success Metrics

You'll know the system is working when:
- ✅ Never ask "what was I working on?" 
- ✅ Claude immediately continues your work from any device
- ✅ Can handle interruptions without losing context
- ✅ Smooth handoffs between human and AI
- ✅ Clear history of decisions and progress
- ✅ Mobile updates seamlessly integrate into workflow

---

## 🆘 Troubleshooting

**Claude seems confused about the project?**
- Make sure Claude reads claude-context.md FIRST in every session
- Update context more frequently (every 30 min)

**Too many context files to manage?**
- Use claude-workflow-template.md as a checklist
- Set up git aliases: `git config alias.ctx 'add claude-*.md'`

**Team conflicts in context files?**
- Treat like any other code: pull before editing
- Use clear timestamps in updates
- Consider separate context files per developer

---

Start using this system today and watch your development flow transform!