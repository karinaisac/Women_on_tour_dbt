# women_on_tour_dbt

## Overview
An analytics project examining women artists' concert tour performance, built on a real-world messy dataset sourced from Kaggle. The dataset covers several major women artists and tracks the number of shows and tours they performed, along with actual gross, inflation-adjusted gross (2022 USD), and average gross revenue per show.

The goal is to surface insights into revenue trends, artist productivity, and per-show efficiency across the history of major women's tours.

**Source dataset:** [[Women on Tour — Kaggle]]([url](https://www.kaggle.com/datasets/amruthayenikonda/dirty-dataset-to-practice-data-cleaning))

## Stack
- **Warehouse:** Google BigQuery
- **Transformation:** dbt
- **Visualization:** Looker Studio (Google Data Studio)
- **Source format:** CSV exported from Kaggle, uploaded to BigQuery

## Data Cleaning
The dataset was scraped from Wikipedia and contained several inconsistencies that required cleaning in the staging layer:

| Issue | Example | Fix applied |
|---|---|---|
| Currency symbols and commas in numeric fields | `$780,000,000` | Stripped symbols, cast to numeric |
| Footnote markers in tour titles | `The Eras Tour †` | Removed special characters |
| Reference columns with no analytical value | `[1]` | Dropped in staging |
| Inconsistent symbols in tour names | Various | Regex cleaning |

### Data sample (pre-cleaning)
| Rank | Peak | All Time Peak | Actual Gross | Adjusted Gross (2022 $) | Artist | Tour Title | Year(s) | Shows | Average Gross | Ref. |
|------|------|---------------|--------------|--------------------------|--------|------------|---------|-------|---------------|------|
| 1 | 1 | 2 | $780,000,000 | $780,000,000 | Taylor Swift | The Eras Tour † | 2023–2024 | 56 | $13,928,571 | [1] |

## Model Structure
The dataset consisted of a single source table, so no intermediate layer was needed — data flows directly from staging to marts.

```
models/
├── staging/
│   └── stg_women_on_tour.sql     -- Type casts, currency parsing, symbol/footnote removal
└── marts/
    ├── dim_artists.sql            -- Artist dimension (name, tour count)
    └── fct_tours.sql              -- Tour-level fact table (gross, shows, avg gross, year)
```

| Model | Type | Key detail |
|---|---|---|
| `stg_women_on_tour` | View | Cleans raw Wikipedia-scraped data; casts monetary fields to numeric |
| `dim_artists` | View | Artist-level summary |
| `fct_tours` | View | Full tour-level fact table for dashboard consumption |

## Dashboard & Key Findings
The dashboard uses pink as the primary color, reflecting the focus on women artists. Four charts are included:

### 1. Adjusted gross revenue by artist
<img width="722" height="565" alt="adj gross rev 2" src="https://github.com/user-attachments/assets/1a1debd4-3c0f-46bd-a8da-a20d48b8de14" />

Adjusted to 2022 USD for fair comparison across decades. Taylor Swift and Madonna lead, which correlates directly with their higher tour counts.

### 2. Total tours by artist
<img width="750" height="565" alt="total tours" src="https://github.com/user-attachments/assets/4c95ffc3-fa38-48e4-a27e-624f7ba7c1b3" />

Taylor Swift and Madonna are the most prolific, each with four tours in the dataset.

### 3. Total actual gross over time
<img width="720" height="528" alt="total actual gross" src="https://github.com/user-attachments/assets/6886e919-c84d-4986-a60a-53bd01fe216f" />

The long-run trend is clearly upward. Two notable dips align with real-world events:
- **2009–2011:** Revenue decline coinciding with the global financial crisis
- **2020–2022:** Zero revenue during the COVID-19 pandemic, when live events were suspended globally

### 4. Average gross per show by artist
<img width="728" height="513" alt="avg gross per show" src="https://github.com/user-attachments/assets/66016b0a-8ab8-47e2-aa28-b4efb67bc25e" />

An interesting efficiency angle: despite Madonna having more tours and higher total adjusted revenue than Beyoncé, Beyoncé ranks higher on average gross per show — suggesting she commands more revenue per performance despite a smaller overall footprint.

## Dashboard
[View the full dashboard →](https://datastudio.google.com/reporting/0e7a55c6-80e9-4082-81e3-a77263e47f7d)
