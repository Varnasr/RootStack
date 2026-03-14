-- ============================================================
-- RootStack: Sector & Theme Taxonomy
-- Classification system used across all OpenStacks
-- ============================================================

CREATE TABLE IF NOT EXISTS sectors (
    sector_id       TEXT PRIMARY KEY,
    sector_name     TEXT NOT NULL,
    description     TEXT,
    parent_id       TEXT REFERENCES sectors(sector_id),
    created_at      TEXT DEFAULT (datetime('now'))
);

-- Pre-defined sector hierarchy matching OpenStacks focus areas
-- Inserted via seed_data/sectors.sql
