#!/bin/bash
# ============================================================
# RootStack Setup Script
# Creates and seeds the SQLite database
# ============================================================

set -e

DB_FILE="${1:-rootstack.db}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "RootStack Database Setup"
echo "========================"
echo "Database: $DB_FILE"
echo ""

# Remove existing database if present
if [ -f "$DB_FILE" ]; then
    read -p "Database $DB_FILE already exists. Overwrite? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    rm "$DB_FILE"
fi

# Apply schemas in order
echo "Applying schemas..."
for schema in "$ROOT_DIR"/schemas/*.sql; do
    echo "  $(basename "$schema")"
    sqlite3 "$DB_FILE" < "$schema"
done

# Apply seed data in order
echo "Seeding data..."
for seed in "$ROOT_DIR"/seed_data/*.sql; do
    echo "  $(basename "$seed")"
    sqlite3 "$DB_FILE" < "$seed"
done

# Verify
echo ""
echo "Verification:"
echo "  States:     $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM states;')"
echo "  Districts:  $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM districts;')"
echo "  Sectors:    $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM sectors;')"
echo "  Indicators: $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM indicators;')"
echo "  Values:     $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM indicator_values;')"
echo "  Schemes:    $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM schemes;')"
echo "  Budgets:    $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM scheme_budgets;')"
echo "  Stacks:     $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM stacks;')"
echo "  Tools:      $(sqlite3 "$DB_FILE" 'SELECT COUNT(*) FROM tools;')"
echo ""
echo "Done! Database created at: $DB_FILE"
echo ""
echo "Try running some queries:"
echo "  sqlite3 $DB_FILE < queries/01_health_dashboard.sql"
echo "  sqlite3 $DB_FILE < queries/02_policy_analysis.sql"
echo "  sqlite3 $DB_FILE < queries/03_cross_cutting.sql"
