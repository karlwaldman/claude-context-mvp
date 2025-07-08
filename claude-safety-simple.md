# Claude Safety Rules (MVP)

## ✅ SAFE TO DO
- Read all context files before starting work
- Update context files with progress and decisions  
- Work on tasks marked as [READY] in claude-tasks.md
- Create new files and folders as needed
- Modify existing code files
- Add documentation and comments
- Test changes before committing

## ⚠️ REQUIRE HUMAN APPROVAL
- Deleting files or folders
- Changing package.json dependencies
- Modifying git configuration
- Making major architectural decisions
- Installing new tools or services

## 🚫 NEVER DO
- Work without reading current context first
- Make changes without updating context files
- Delete the claude-*.md context files
- Commit sensitive information (passwords, API keys)
- Work on multiple conflicting tasks simultaneously

## 📋 WORKFLOW
1. **Start Session:** Read claude-context.md and claude-tasks.md
2. **Pick Task:** Choose highest priority [READY] task
3. **Work:** Make incremental progress with frequent commits
4. **Update:** Update context and task status regularly
5. **End Session:** Update context with current status and next steps

## 🤝 HUMAN INTERACTION
- **Ask questions** by creating GitHub issues
- **Get approval** by adding to claude-context.md "Questions for Human" section
- **Report problems** by updating task status to [BLOCKED]
- **Document decisions** in claude-decisions.md

---
**Remember:** This is a collaborative system. Keep human informed and ask when uncertain.