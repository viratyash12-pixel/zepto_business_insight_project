
## 🧹 Data Cleaning
- Removed rows with ₹0 MRP or selling price
- Converted price fields from paise to rupees
- Checked for nulls and duplicate product names

## 🔍 Analysis Covered
- Product category breakdown
- In-stock vs. out-of-stock counts
- Top 10 best-value products by discount %
- High-MRP products currently out of stock
- Estimated revenue per category (`MRP × quantity`)
- Products priced above ₹500 with <10% discount
- Top 5 categories by average discount %
- Weight-based segmentation (low / medium / bulk)
- Total inventory weight per category

## 📊 Dashboard
A self-contained, browser-openable HTML dashboard summarizing the SQL insights:
- KPI cards — total products, in-stock rate, avg. discount, estimated revenue
- Revenue by category, stock status, top discount categories, weight class distribution
- Filterable, sortable product table

Currently built on a generated sample dataset matching the source schema — swap in real BigQuery query results to make it live (see comments in the HTML file).

## 🛠️ Tech Stack
- SQL (Google BigQuery / Standard SQL)
- HTML, CSS, JavaScript + Chart.js (dashboard)

## 🚀 How to Use
1. Run the queries in `zepto_business_insight_project.sql` against your BigQuery dataset (update the project/dataset/table references).
2. Open `zepto_business_insights_dashboard.html` in any browser — no server or install needed.
