# Quick Start After Rename

Once you've renamed the directory to `Orca-management`, here's what to do:

## 1. First Time Setup

```bash
# You're now in /Users/Able/Orca-management

# Verify the rename worked
./verify-rename.sh

# Clean rebuild (recommended)
rm -rf node_modules
pnpm install

# Run tests
pnpm test

# Build the app
pnpm run build:electron-vite
```

## 2. Commit Your Changes

```bash
git status
# Should show: modified README.md, package.json
#              new: migration docs

git add README.md package.json \
        MIGRATION-TO-ORCA-MANAGEMENT.md \
        RENAME-SUMMARY.md \
        QUICK-START-AFTER-RENAME.md \
        verify-rename.sh \
        .project-rename-complete

git commit -m "Refactor: Rename project to Orca-management

- Update package.json name, description, homepage, and author
- Update README.md branding and GitHub references
- Add comprehensive migration documentation
- Add automated verification script

This establishes this fork's identity as 'Orca Management' while
maintaining upstream sync capability and preserving all existing
functionality."
```

## 3. Optional: Update Your Shell

If you had any aliases or environment variables pointing to the old path:

```bash
# Check for references
grep -r "orca-pi-integration" ~/.zshrc ~/.bashrc ~/.bash_profile 2>/dev/null

# Edit and replace with "Orca-management"
```

## 4. Optional: Push to GitHub

```bash
# Push to your fork
git push origin main

# Or if you're on a different branch
git push origin $(git branch --show-current)
```

## 5. Continue Development

Everything works the same as before:

```bash
# Start development
pnpm dev

# Run specific tests
pnpm test path/to/test.ts

# Lint
pnpm lint

# Format
pnpm format
```

## Upstream Sync (Unchanged)

Pulling updates from the original Orca project still works:

```bash
# Fetch upstream changes
git fetch upstream

# Merge upstream main into your branch
git merge upstream/main

# Or rebase
git rebase upstream/main
```

## Troubleshooting

### "Module not found" errors after rename

```bash
# Clean everything and reinstall
rm -rf node_modules
rm -rf pnpm-lock.yaml
pnpm install
```

### Git thinks directory moved

That's correct! Git will show:

```
renamed: ../orca-pi-integration/ -> .
```

This is fine and expected.

### Build fails

1. Make sure you're in the right directory: `pwd` should show `/Users/Able/Orca-management`
2. Rebuild: `rm -rf node_modules && pnpm install`
3. Check Node version: `node --version` (should match project requirements)

### Verification script shows warnings

Run `./verify-rename.sh` and it will tell you exactly what needs to be fixed.

## What Didn't Change

✅ All source code and imports work the same
✅ Git remotes stay the same
✅ Build process unchanged
✅ Tests unchanged
✅ Development workflow unchanged
✅ TypeScript configurations unchanged
✅ Dependencies unchanged

The rename only affects **project metadata** (name, branding) and the **directory location** on your machine.

---

**Questions?** See `MIGRATION-TO-ORCA-MANAGEMENT.md` for full details.
