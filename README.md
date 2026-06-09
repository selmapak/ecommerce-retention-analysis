# E-Commerce Customer Retention & Lifecycle Analysis

## Dashboard Preview

![Dashboard](images/dashboard.png)
---

## Project Overview

This project analyzes customer retention, repeat purchase behavior, customer lifecycle trends, and RFM segmentation using the Google BigQuery public e-commerce dataset.

Using SQL and Excel, the analysis identifies retention weaknesses, evaluates acquisition channel performance, and uncovers opportunities to improve customer lifetime value through lifecycle interventions.

---

## Dataset

**Source:** Google BigQuery Public Dataset

`bigquery-public-data.thelook_ecommerce`

**Tables Used**

* orders
* users

---

## Business Questions

* How many customers return after their first purchase?
* How quickly does customer retention decline over time?
* Do acquisition channels influence retention performance?
* When do repeat purchases typically occur?
* Which customer segments represent the greatest churn risk?
* What opportunities exist to improve customer lifetime value?

---

## Dashboard Overview

The dashboard includes:

* KPI Summary Cards
* Monthly Retention Curve
* Retention by Acquisition Channel
* Customer Recency Distribution
* RFM Customer Segmentation

---

## Key Findings

### Customer Retention

* Month 1 retention is **3.67%**
* Retention declines steadily to approximately **1.37%** by Month 12
* Most users behave as one-time purchasers rather than repeat customers

### Acquisition Channels

* Retention performance is relatively consistent across all traffic sources
* Email achieved the highest Month 1 retention (**4.39%**)
* Facebook showed the lowest Month 1 retention (**3.78%**)

### Lifecycle Analysis

* Most repeat purchases occur after **90+ days**
* Early repeat purchase activity remains relatively weak
* The first 30–90 days represent an important engagement opportunity

### RFM Segmentation

* **82%** of customers fall into the **At Risk** segment
* Champions account for only **2%** of customers
* Loyal Customers represent approximately **6%** of the user base

---

## Business Recommendations

Based on the analysis, potential retention initiatives include:

* Post-purchase onboarding campaigns
* Customer reactivation programs
* Product replenishment reminders
* Lifecycle email automation
* Personalized retention incentives

---

## SQL Analyses Performed

1. Total Order Volume
2. Unique Purchasing Users
3. Acquisition Channel Distribution
4. Cohort Retention Analysis
5. Retention by Acquisition Channel
6. Repeat Purchase Segmentation
7. Lifecycle Intervention Analysis
8. RFM Customer Segmentation

---

## Skills Demonstrated

* SQL
* Common Table Expressions (CTEs)
* Window Functions
* Cohort Analysis
* Retention Analysis
* Customer Segmentation
* RFM Analysis
* Data Visualization
* Excel Dashboard Design
* Business Analytics

---


