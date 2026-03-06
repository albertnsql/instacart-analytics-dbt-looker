# dbt Data Warehouse Models

This directory contains the dbt project responsible for transforming raw Instacart data into analytics-ready warehouse tables.

The dbt project follows a layered modeling approach:

Raw Data
↓
Staging Models
↓
Intermediate Models
↓
Analytics Marts

---

## Model Layers

### Staging Layer

Located in:

```
models/staging/
```

Purpose:

* Clean raw source tables
* Standardize column names
* Apply basic transformations

Examples:

* stg_orders
* stg_products
* stg_order_products_prior

---

### Intermediate Layer

Located in:

```
models/intermediate/
```

Purpose:

* Build reusable transformations
* Combine staging models
* Prepare logic used by marts

Example:

* int_orders_enriched

---

### Mart Layer

Located in:

```
models/marts/
```

Purpose:

* Create analytics-ready tables used by BI tools.

Key marts:

Fact Tables

* fact_orders
* fact_order_items

Dimension Tables

* dim_customer
* dim_product
* dim_date

Analytical Models

* product_performance
* customer_rfm
* customer_cohorts

---

## dbt Features Used

* Incremental models for large fact tables
* Modular model layering
* YAML documentation
* Reusable transformations
* Star schema design
