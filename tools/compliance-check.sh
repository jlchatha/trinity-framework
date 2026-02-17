#!/bin/bash
# Trinity Framework - Protocol File Compliance Check
#
# Validates that required protocol files exist and have proper structure.
# Run from your workspace directory: ./tools/compliance-check.sh
#
# Exit codes:
#   0 - All checks passed
#   1 - Required file missing
#   2 - Structure validation warning (non-fatal)

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

ERRORS=0
WARNINGS=0

echo "Trinity Framework - Compliance Check"
echo "====================================="
echo ""

# Check required files
check_file() {
    local file=$1
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file exists"
        return 0
    else
        echo -e "${RED}✗${NC} $file NOT FOUND"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

# Check for section in file
check_section() {
    local file=$1
    local section=$2
    local alt_section=$3

    if grep -qi "$section" "$file" 2>/dev/null || grep -qi "$alt_section" "$file" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} Has $section section"
        return 0
    else
        echo -e "  ${YELLOW}⚠${NC} Missing $section section"
        WARNINGS=$((WARNINGS + 1))
        return 1
    fi
}

echo "Checking required files..."
echo ""

# AGENT.md
if check_file "AGENT.md"; then
    check_section "AGENT.md" "IDENTITY" "Identity"
    check_section "AGENT.md" "RECOVERY" "Recovery"
fi
echo ""

# STATUS.md
if check_file "STATUS.md"; then
    check_section "STATUS.md" "Current Priority" "Priority"
fi
echo ""

# AUTO-COMPACT.md
if check_file "AUTO-COMPACT.md"; then
    check_section "AUTO-COMPACT.md" "Last Working State" "Recovery"
fi
echo ""

# CLAUDE.md symlink (optional but recommended)
if [ -L "CLAUDE.md" ]; then
    echo -e "${GREEN}✓${NC} CLAUDE.md symlink exists"
elif [ -f "CLAUDE.md" ]; then
    echo -e "${YELLOW}⚠${NC} CLAUDE.md exists but is not a symlink (should link to AGENT.md)"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${YELLOW}⚠${NC} CLAUDE.md not found (recommended for Claude Code)"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Summary
echo "====================================="
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}All checks passed!${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}Passed with $WARNINGS warning(s)${NC}"
    exit 0
else
    echo -e "${RED}$ERRORS error(s), $WARNINGS warning(s)${NC}"
    exit 1
fi
