#!/bin/bash
# Verification script for Orca-management rename

echo "🔍 Verifying Orca-management rename..."
echo ""

# Check directory name
if [[ "$PWD" == *"Orca-management"* ]]; then
  echo "✅ Directory: Orca-management"
elif [[ "$PWD" == *"orca-pi-integration"* ]]; then
  echo "⚠️  Directory: Still orca-pi-integration (needs manual rename)"
  echo "   Run: cd /Users/Able && mv orca-pi-integration Orca-management"
else
  echo "⚠️  Directory: $PWD"
fi

# Check package.json
if [ -f "package.json" ]; then
  PKG_NAME=$(node -p "require('./package.json').name" 2>/dev/null)
  if [[ "$PKG_NAME" == "orca-management" ]]; then
    echo "✅ package.json name: orca-management"
  else
    echo "❌ package.json name: $PKG_NAME (expected: orca-management)"
  fi
  
  PKG_AUTHOR=$(node -p "require('./package.json').author" 2>/dev/null)
  if [[ "$PKG_AUTHOR" == "AbleVarghese" ]]; then
    echo "✅ package.json author: AbleVarghese"
  else
    echo "⚠️  package.json author: $PKG_AUTHOR"
  fi
else
  echo "❌ package.json: Not found"
fi

# Check README
if [ -f "README.md" ]; then
  if grep -q "Orca Management" README.md; then
    echo "✅ README.md: Updated branding (Orca Management)"
  else
    echo "❌ README.md: Branding not updated"
  fi
  
  if grep -q "AbleVarghese/orca-Abled" README.md; then
    echo "✅ README.md: GitHub links updated"
  else
    echo "⚠️  README.md: GitHub links may need updating"
  fi
else
  echo "❌ README.md: Not found"
fi

# Check git remotes
if git rev-parse --git-dir > /dev/null 2>&1; then
  ORIGIN=$(git remote get-url origin 2>/dev/null)
  if [[ "$ORIGIN" == *"AbleVarghese/orca-Abled"* ]]; then
    echo "✅ Git origin: AbleVarghese/orca-Abled"
  else
    echo "⚠️  Git origin: $ORIGIN"
  fi
  
  UPSTREAM=$(git remote get-url upstream 2>/dev/null)
  if [[ "$UPSTREAM" == *"stablyai/orca"* ]]; then
    echo "✅ Git upstream: stablyai/orca"
  else
    echo "ℹ️  Git upstream: $UPSTREAM (or not configured)"
  fi
else
  echo "⚠️  Not in a git repository"
fi

# Check for migration docs
if [ -f "MIGRATION-TO-ORCA-MANAGEMENT.md" ]; then
  echo "✅ Migration documentation: Present"
else
  echo "ℹ️  Migration documentation: Not found"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ "$PWD" == *"Orca-management"* ]] && [[ "$PKG_NAME" == "orca-management" ]]; then
  echo "✅ Rename complete! All checks passed."
else
  echo "⚠️  Rename incomplete. See MIGRATION-TO-ORCA-MANAGEMENT.md"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
