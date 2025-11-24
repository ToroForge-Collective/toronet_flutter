# Publishing Toronet SDK to pub.dev

This guide contains all the commands and steps needed to publish the Toronet Flutter SDK to pub.dev.

## Prerequisites

1. **Create a pub.dev account**
   - Visit: https://pub.dev
   - Sign in with your Google account
   - Verify your email address

2. **Verify package ownership**
   - Ensure you have ownership/uploader rights for the `toronet` package
   - If the package doesn't exist yet, you'll create it during first publish

## Pre-Publishing Checklist

### 1. Update Version Number

Edit `pubspec.yaml` and increment the version:

```bash
# Current version format: MAJOR.MINOR.PATCH
# Example: 0.0.2 -> 0.0.3 (patch) or 0.1.0 (minor) or 1.0.0 (major)
```

**Command to check current version:**
```bash
grep "^version:" pubspec.yaml
```

**To update version manually:**
- Open `pubspec.yaml`
- Change the `version:` line (e.g., `version: 0.0.3`)

### 2. Update CHANGELOG.md

Ensure `CHANGELOG.md` includes all recent changes:

```bash
# View current changelog
cat CHANGELOG.md
```

Add a new version entry if needed with all recent features and changes.

### 3. Verify Package Quality

Run these commands to ensure package quality:

```bash
# Format all code
dart format .

# Analyze code for issues
dart analyze

# Check for publish issues (dry run)
dart pub publish --dry-run
```

**Expected output from dry run:**
- Lists files that will be published
- Shows package metadata
- Should complete without errors

### 4. Verify Required Files

Ensure these files exist:

```bash
# Check for required files
ls -la README.md CHANGELOG.md LICENSE pubspec.yaml
```

**Required files:**
- ✅ `README.md` - Package documentation
- ✅ `CHANGELOG.md` - Version history
- ✅ `LICENSE` - License file (check if exists)
- ✅ `pubspec.yaml` - Package configuration

**If LICENSE is missing, create one:**
```bash
# Check if LICENSE exists
ls LICENSE

# If missing, you can create a basic one or copy from another project
```

### 5. Test the Package

Test that the package works correctly:

```bash
# Get dependencies
dart pub get

# Run analyzer
dart analyze

# Test example (if applicable)
cd example
flutter pub get
flutter analyze
cd ..
```

## Publishing Commands

### Step 1: Final Verification

```bash
# Navigate to package root
cd /Users/macproi/StudioProjects/Packages/toronet

# Format code
dart format .

# Run analyzer
dart analyze

# Dry run (MANDATORY - do this first!)
dart pub publish --dry-run
```

### Step 2: Review Dry Run Output

The dry run will show:
- Files that will be published
- Package metadata
- Any warnings or errors

**Fix any issues before proceeding!**

### Step 3: Publish to pub.dev

Once dry run passes:

```bash
# Publish the package
dart pub publish
```

**What happens:**
1. You'll be prompted to log in with your Google account (first time only)
2. Review the package details
3. Confirm the files to be published
4. Package is uploaded to pub.dev

### Step 4: Verify Publication

After publishing:

1. **Check pub.dev website:**
   - Visit: https://pub.dev/packages/toronet
   - Package should appear within a few minutes

2. **Verify version:**
   ```bash
   # Check published version
   curl https://pub.dev/api/packages/toronet | grep version
   ```

3. **Test installation:**
   ```bash
   # In a test project, try adding the package
   flutter pub add toronet
   ```

## Post-Publishing

### Update Local Repository

```bash
# Tag the release in git (optional but recommended)
git tag -a v0.0.3 -m "Release version 0.0.3"
git push origin v0.0.3

# Commit any remaining changes
git add .
git commit -m "Prepare for pub.dev release v0.0.3"
git push
```

## Common Issues and Solutions

### Issue: "Package already exists"

**Solution:**
- You need to be added as an uploader to the existing package
- Or the package name is taken (unlikely if you own it)

### Issue: "Invalid version"

**Solution:**
- Version must be higher than the last published version
- Check current published version: https://pub.dev/packages/toronet
- Increment version in `pubspec.yaml`

### Issue: "Missing LICENSE"

**Solution:**
```bash
# Create a LICENSE file (choose appropriate license)
# Example: MIT License
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2024 Toronet

[Add your license text here]
EOF
```

### Issue: "Analysis errors"

**Solution:**
```bash
# Fix all analyzer errors
dart analyze

# Fix formatting issues
dart format .
```

### Issue: "Authentication failed"

**Solution:**
```bash
# Re-authenticate
dart pub logout
dart pub publish  # Will prompt for login again
```

## Quick Reference: Complete Publishing Workflow

```bash
# 1. Navigate to package directory
cd /Users/macproi/StudioProjects/Packages/toronet

# 2. Update version in pubspec.yaml (manually edit)

# 3. Update CHANGELOG.md (manually edit)

# 4. Format and analyze
dart format .
dart analyze

# 5. Dry run
dart pub publish --dry-run

# 6. If dry run passes, publish
dart pub publish

# 7. Verify on pub.dev
# Visit: https://pub.dev/packages/toronet
```

## Version Numbering Guidelines

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.0.0): Breaking changes
- **MINOR** (0.1.0): New features, backward compatible
- **PATCH** (0.0.3): Bug fixes, backward compatible

**Examples:**
- `0.0.2` → `0.0.3` (patch: bug fix)
- `0.0.2` → `0.1.0` (minor: new features)
- `0.0.2` → `1.0.0` (major: breaking changes)

## Important Notes

⚠️ **Once published, you CANNOT:**
- Unpublish a version
- Modify a published version
- Decrease version numbers

✅ **You CAN:**
- Publish new versions with higher numbers
- Update package metadata (description, etc.) for future versions
- Deprecate old versions

## Next Steps After Publishing

1. **Announce the release** (if applicable)
2. **Update documentation** if needed
3. **Monitor for issues** on pub.dev
4. **Plan next version** features

## Support

- **pub.dev documentation**: https://dart.dev/tools/pub/publishing
- **pub.dev support**: https://github.com/dart-lang/pub-dev/issues
- **Package page**: https://pub.dev/packages/toronet

---

**Last Updated:** After multi-chain bridge integration
**Current Version:** Check `pubspec.yaml`

