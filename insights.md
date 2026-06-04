# Insight 1 — Order Volume

What this measures:
Total number of orders in the dataset.

Why it matters:
This shows the scale of customer transaction activity.

Business implication:
A sufficiently large order base enables statistically meaningful retention analysis.

Result:
[125354]


# Insight 2 — Purchasing User Base

What this measures:
The number of unique users who placed at least one order.

Why it matters:
This helps estimate customer reach and forms the basis for repeat purchase analysis.

Business implication:
Comparing purchasing users against total orders reveals whether growth comes from customer acquisition or repeat transactions.

Result:
[80203]


# Insight 3 — Acquisition Channels

What this measures:
Distribution of users by acquisition source.

Why it matters:
Traffic quality strongly influences long-term retention.

Business implication:
Later cohort analysis can compare retention by channel.

Top source:
1	Search	69877


# Insight 4 — Retention Drop-off

Observation:
Retention drops sharply after first purchase.

Business interpretation:
Most users appear to exhibit one-time transactional behavior rather than recurring engagement.

Possible causes:
- low product repurchase frequency
- weak lifecycle retention campaigns
- acquisition channels driving low-loyalty traffic

Recommendation:
Investigate retention by acquisition channel to identify higher-quality sources.

Row	cohort_month	retained_users	retention_rate
1	0	80203	100.0
2	1	2943	3.67
3	2	2427	3.03
4	3	2162	2.7
5	4	1940	2.42

## Insight 5 — Retention by Acquisition Channel (Month 1)

Observation:
Retention rates across acquisition channels (Search, Organic, Email, Facebook, Display) are relatively similar, ranging between 3.5% and 4.0% in month 1.

Business interpretation:
Acquisition channel does not appear to be a strong differentiator for early-stage retention. User retention behavior is largely consistent across channels, suggesting that engagement is more influenced by product experience and post-purchase lifecycle factors rather than traffic source quality.


## Insight 6 — Repeat Purchase Segmentation

Observation:
Most users are one-time buyers, while a smaller segment accounts for multiple purchases.

Business interpretation:
The user base is highly skewed toward one-time transactional behavior, with a small proportion of users contributing to repeat purchases. This indicates the presence of a potential high-value customer segment that could be leveraged to improve retention and lifetime value.

## Insight 7 — Lifecycle Intervention Opportunities

Observation:
The majority of repeat purchases occur after 90+ days, while repeat activity within the first 30 days remains relatively low.

Business interpretation:
Users are not being effectively re-engaged during the early post-purchase lifecycle. This suggests missed retention opportunities within the first 30–90 days, where targeted reminder campaigns, repeat purchase incentives, and reactivation flows could accelerate return behavior and improve customer retention.


## Insight 8 — RFM Customer Segmentation

Observation:
The majority of customers fall into the “At Risk” segment, while only a small proportion qualify as Loyal Customers or Champions.

Business interpretation:
The customer base shows strong signs of retention weakness, with most users failing to maintain repeat purchasing behavior over time. The relatively small loyal and champion segments suggest an opportunity to improve customer lifetime value through stronger re-engagement strategies, retention incentives, and personalized lifecycle marketing.



