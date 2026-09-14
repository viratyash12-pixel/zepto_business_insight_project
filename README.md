# Zepto Business Insight Project

A SQL-based exploratory data analysis of Zepto's product catalog, built and run on Google BigQuery.

## What it covers
- **Data exploration** — row counts, null checks, duplicate product names, category breakdown
- **Data cleaning** — removing zero-price rows, converting paise → rupees
- **Business insights**:
  - Top 10 best-value products by discount %
  - High-MRP products currently out of stock
  - Estimated revenue per category
  - Products with MRP > ₹500 but discount < 10%
  - Top 5 categories by average discount %
  - Weight-based product segmentation (low/medium/bulk)
  - Total inventory weight per category

## Stack
- SQL (BigQuery / Standard SQL)
