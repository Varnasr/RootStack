-- ============================================================
-- RootStack: Geography Reference Tables
-- States and districts of India with basic metadata
-- ============================================================

CREATE TABLE IF NOT EXISTS states (
    state_id        TEXT PRIMARY KEY,
    state_name      TEXT NOT NULL,
    state_name_hi   TEXT,
    region          TEXT CHECK (region IN ('North', 'South', 'East', 'West', 'Central', 'Northeast')),
    state_type      TEXT CHECK (state_type IN ('State', 'UT')),
    capital         TEXT,
    area_sq_km      REAL,
    census_2011_pop INTEGER,
    created_at      TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS districts (
    district_id     TEXT PRIMARY KEY,
    district_name   TEXT NOT NULL,
    state_id        TEXT NOT NULL REFERENCES states(state_id),
    tier            TEXT CHECK (tier IN ('Metro', 'Urban', 'Semi-Urban', 'Rural', 'Tribal')),
    census_2011_pop INTEGER,
    area_sq_km      REAL,
    latitude        REAL,
    longitude       REAL,
    created_at      TEXT DEFAULT (datetime('now'))
);

CREATE INDEX idx_districts_state ON districts(state_id);
