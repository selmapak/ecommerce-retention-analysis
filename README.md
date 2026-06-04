# E-commerce Retention Cohort Analysis

## Project Overview

This project analyzes customer retention patterns using the Google BigQuery public e-commerce dataset.

The goal is to evaluate repeat purchase behavior, identify churn patterns, and understand customer lifecycle dynamics.

---

## Dataset

Source: Google BigQuery Public Dataset  
`bigquery-public-data.thelook_ecommerce`

Tables used:
- users  
- orders  

---

## Business Questions

- How many customers return after their first purchase?
- What does repeat purchase behavior look like over time?
- Which acquisition channels bring higher quality users?
- When should lifecycle interventions occur?
- How are customers distributed by value (RFM segmentation)?

---

## Key Metrics

**Total Orders:** 125,354  
**Unique Purchasing Users:** 80,203  
**Average Orders per Customer:** 1.56  

This indicates moderate repeat purchase activity, but suggests further retention analysis is required.

---

## Monthly Retention Results

| Month | Retention Rate |
|------|----------------|
| 0 | 100% |
| 1 | 3.67% |
| 2 | 3.03% |
| 3 | 2.70% |
| 4 | 2.42% |

---

## Key Finding

Customer retention drops sharply after the first purchase.

Only 3.67% of users return in month 1, and retention continues to decline steadily over time.

This suggests that the majority of users behave as one-time purchasers rather than recurring customers.

---

## Business Interpretation (Retention Overview)

- Acquisition is strong, but repeat engagement is weak  
- Users are not consistently returning after first purchase  
- Retention decline suggests limited lifecycle activation strategies  
- Product or category may naturally support low-frequency purchases  

---

## Retention by Acquisition Channel (Month 1)

### Results

Retention rates across acquisition channels are relatively similar, ranging between **3.5% and 4.0%**.

| Channel   | Month 1 Retention |
|----------|------------------|
| Search   | ~3.7% |
| Organic  | ~3.7% |
| Email    | ~4.0% |
| Facebook | ~3.5% |
| Display  | ~3.6% |

### Key Insight

Acquisition channel does not significantly impact early retention.  
Retention behavior is largely consistent across traffic sources.

---

## Repeat Purchase Segmentation

### Results

Most users are one-time buyers, while a smaller group accounts for multiple purchases.

- One-time buyers: dominant segment  
- Repeat users (2+ orders): smaller proportion  
- Power users: minimal but high-value group  

### Key Insight

Customer base is heavily skewed toward one-time transactional behavior.

---

## Lifecycle Intervention Opportunities

### Results

| Repeat Window | Users |
|--------------|------|
| 90+ Days | 24,047 |
| 31–60 Days | 2,594 |
| 8–30 Days | 2,449 |
| 61–90 Days | 2,251 |
| 0–7 Days | 1,528 |

### Key Insight

Most repeat purchases occur after 90+ days.

Early retention (0–30 days) is weak, indicating a missed opportunity for early lifecycle engagement.

---

## RFM Customer Segmentation

### Results

| Segment | Users |
|---------|------|
| At Risk | 65,050 |
| Recent Buyers | 8,321 |
| Loyal Customers | 4,686 |
| Champions | 1,737 |

### Key Insight

The majority of users fall into the “At Risk” segment, while only a small portion are high-value customers.

---

## Overall Business Takeaways

- Retention is the primary weakness in the customer lifecycle  
- Acquisition channels are not strong differentiators of retention quality  
- Repeat purchase behavior is concentrated in a small user segment  
- Early lifecycle (first 30–90 days) is the most critical intervention window  
- Customer base is heavily skewed toward low-engagement users  

---

## Skills Demonstrated

- SQL (BigQuery)  
- Cohort Analysis  
- Retention Analysis  
- Behavioral Segmentation  
- RFM Modeling  
- Business Interpretation  
- Product Analytics Thinking  