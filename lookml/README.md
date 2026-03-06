# LookML Semantic Layer

This directory contains the LookML semantic layer built on top of the dbt analytics warehouse.

The semantic layer defines reusable dimensions, measures, and explores that enable business users to analyze data without writing SQL.

---

## LookML Structure

```
lookml/
│
├── instacart.model.lkml
└── views/
    ├── dim_customer.view.lkml
    ├── dim_product.view.lkml
    ├── dim_date.view.lkml
    ├── fact_orders.view.lkml
    ├── fact_order_items.view.lkml
    ├── product_performance.view.lkml
    ├── customer_cohorts.view.lkml
    └── customer_rfm.view.lkml
```

---

## Explores

The LookML model exposes reusable explores for key analytics domains.

### Orders

Revenue and order trend analysis.

### Order Items

Basket composition and product-level sales.

### Product Performance

Product revenue, margin, and reorder analysis.

### Customer RFM

Customer segmentation using Recency, Frequency, and Monetary metrics.

### Customer Cohorts

Customer retention analysis over time.

---

## Semantic Layer Features

* Business-friendly metric definitions
* Reusable explores
* Dimension groups for time analysis
* Drill paths for metric validation
* Structured view organization
