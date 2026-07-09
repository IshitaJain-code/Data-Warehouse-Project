
# 💄 Nykaa Retail Analytics Data Warehouse

An end-to-end retail analytics data warehouse built using **PostgreSQL** and **Star Schema modeling**. This project integrates a real-world Nykaa product catalog with synthetic operational datasets to support business intelligence, analytical reporting, and data-driven decision-making.

---

## 📖 Overview

Retail companies generate data from multiple operational systems such as product catalogs, customer management, order processing  and returns. These systems are optimized for daily transactions rather than analytical reporting.

This project consolidates these disparate data sources into a centralized **PostgreSQL Data Warehouse** using a dimensional model, enabling efficient SQL analysis and dashboard development.

---

## 🎯 Project Objectives

- Design a modern retail analytics data warehouse.
- Integrate multiple operational data sources into a unified analytical model.
- Build an end-to-end ETL pipeline using Python.
- Implement a Star Schema optimized for analytical queries.
- Perform data quality checks and transformations.
- Enable business intelligence through SQL and dashboards.

---

## 🏗️ Data Architecture

```
                Product Catalog (Real Dataset)
                          │
        ┌─────────────────┴─────────────────┐
        │                                   │
Customers (Synthetic)         Orders (Synthetic)
                                           │
Order Items (Synthetic)       Returns (Synthetic)
                          |     
                
                          │
                
            ETL (Extract → Transform → Load)
                          │
              Bronze → Silver → Gold Layers
                          │
               PostgreSQL Data Warehouse
                          │
            SQL Analytics & Business Views
                       
             
```

---

## 📂 Data Sources

### Real Dataset

**Product Catalog**

Contains:

- Product information
- Brand details
- Pricing
- Ratings
- Stock availability
- Product images
- Category information

### Synthetic Operational Datasets

- Customers
- Orders
- Order Items
- Promotions
- Returns

---

## 🏛️ Data Warehouse Design

### Fact Tables

- Fact Sales
- Fact Returns

### Dimension Tables

- Dim Product
- Dim Brand
- Dim Category
- Dim Customer
- Dim Promotion
- Dim Date

---

## 🔄 ETL Pipeline

### Extract

- Read CSV files
- Validate source data
- Load datasets into staging

### Transform

- Handle missing values
- Remove duplicates
- Standardize product and brand names
- Generate surrogate keys
- Calculate business metrics
- Validate referential integrity

### Load

- Full Refresh Strategy
- **TRUNCATE + INSERT**
- Load into PostgreSQL

---


## 📈 Data Pipeline

1. Load raw product catalog
2. Generate synthetic operational datasets
3. Perform data cleaning
4. Build staging tables
5. Create dimensions
6. Create fact tables
7. Load PostgreSQL warehouse
8. Execute analytical SQL queries
9. Build interactive dashboards

---

## 🔍 Data Quality Checks

- Missing value handling
- Duplicate detection
- Invalid price validation
- Rating validation
- Referential integrity checks
- Data type validation

---


## 📜 License

This project is intended for educational and portfolio purposes.

