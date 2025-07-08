#!/bin/bash

# Claude Context System Setup Script
# Usage: curl -sSL https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/setup-claude-context.sh | bash

echo "🤖 Setting up Claude Context System..."

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "⚠️  Warning: Not in a git repository. Initialize with 'git init' first? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        git init
    fi
fi

# Download template files
echo "📥 Downloading context templates..."
curl -so claude-context.md https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/templates/claude-context-template.md
curl -so claude-tasks.md https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/templates/claude-tasks-template.md
curl -so claude-decisions.md https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/templates/claude-decisions-template.md
curl -sO https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-safety-simple.md
curl -sO https://raw.githubusercontent.com/karlwaldman/claude-context-mvp/main/claude-workflow-template.md

# Add to .gitignore
if ! grep -q "claude-\*-working.md" .gitignore 2>/dev/null; then
    echo "claude-*-working.md" >> .gitignore
    echo "📝 Added working files to .gitignore"
fi

# Get project info
PROJECT_NAME=$(basename "$PWD")
BRANCH=$(git branch --show-current 2>/dev/null || echo "main")

# Update context file with project info
echo "🔧 Customizing context for: $PROJECT_NAME"
sed -i.bak "s/\[BRANCH_NAME\]/$BRANCH/g" claude-context.md
sed -i.bak "s/\[TIMESTAMP\]/$(date -u +"%Y-%m-%d %H:%M UTC")/g" claude-context.md
sed -i.bak "s/\[Desktop\/Mobile\/Codespace\]/Desktop/g" claude-context.md

# Update task file
sed -i.bak "s/\[TIMESTAMP\]/$(date -u +"%Y-%m-%d %H:%M UTC")/g" claude-tasks.md
sed -i.bak "s/\[STATUS\]/READY/g" claude-tasks.md

# Clean up backup files
rm -f *.bak

echo "
✅ Claude Context System installed!

📋 Next steps:
1. Edit claude-context.md to describe your project goals
2. Add initial tasks to claude-tasks.md
3. Commit the context system:
   git add claude-*.md .gitignore
   git commit -m 'Add Claude context system for AI pair programming'

🚀 Start using:
Tell Claude: 'Read claude-context.md and claude-tasks.md to understand this project'

📱 For mobile access, consider creating a mobile dashboard
"