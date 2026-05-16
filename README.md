# AirBnB CDC Ingestion & AI-Driven Personalization Data Pipeline

An enterprise-grade, end-to-end serverless Change Data Capture (CDC) and automated intelligence pipeline designed to ingest, transform, and analyze AirBnB booking and customer data in near-real-time, while leveraging Agentic AI to automate hyper-personalized executive and customer reporting.

## 🚀 Architecture Overview

This project implements a modern data architecture utilizing Microsoft Azure for cloud data orchestration, storage, and analytics, integrated with an AI-driven automation layer via n8n and OpenAI.

1. **Hourly Dimensional Processing:** Azure Data Factory (ADF) ingests raw customer data from Azure Data Lake Storage (ADLS) Gen2, processing it into an SCD Type-1 dimension table in Azure Synapse Analytics.
2. **Real-Time CDC Ingestion:** High-velocity booking events are captured continuously from Azure Cosmos DB's Change Feed into ADF.
3. **Streamlined ETL/Upsert:** Ingested events undergo robust transformations (schema alignment, data cleansing, enrichment) through ADF Data Flows and are upserted into Synapse operational fact tables.
4. **Agentic Orchestration & AI Layer:** An n8n workflow monitors analytics insights, feeds context to an OpenAI Large Language Model (LLM), and auto-generates data-driven narrative reports delivered via Microsoft Outlook.

---

## 🛠️ Tech Stack & Ecosystem

- **Data Orchestration & Integration:** Azure Data Factory (ADF)
- **Change Data Capture (CDC) Source:** Azure Cosmos DB (NoSQL Change Feed)
- **Data Lake Storage:** Azure Data Lake Storage Gen2 (ADLS)
- **Data Warehousing & Analytics:** Azure Synapse Analytics (Dedicated/Serverless SQL Pools)
- **Workflow Automation & Agentic Orchestration:** n8n
- **Generative AI Layer:** OpenAI LLM (GPT Models)
- **Programming Languages:** Python, SQL (T-SQL)
- **Notification & Reporting:** Microsoft 365 / Outlook Integration

---

## 💎 Core Architecture Components & Pipelines

### 1. Customer Data Integration (Hourly Batch)
* **Trigger:** Automated hourly wall-clock schedules.
* **Mechanism:** ADF copy and script activities pull structural updates from ADLS JSON/Parquet landing zones.
* **Data Warehouse Target:** Executes a **Slowly Changing Dimension (SCD) Type-1 Merge** directly into the `customer_dim` table in Azure Synapse Analytics, keeping profile details accurate without keeping historic copies.

### 2. Live CDC Event Processing (Streaming/Micro-batch)
* **Mechanism:** Leverages native **Azure Cosmos DB Change Feed** capabilities inside Azure Data Factory.
* **Latency Profile:** Near-real-time, low-latency ingestion capturing transactional modifications, new room bookings, cancellations, and state shifts as they happen.

### 3. Transform & Upsert (ADF Data Flows)
* **Compute:** Managed Spark cluster compute abstractly run by ADF Data Flows.
* **Processing Rules:** * Cleanses corrupted records, handles null fields, and enforces structural types.
    * Enriches raw events with contextual data.
    * Executes high-performance **Upsert (Insert/Update)** scripts against target booking fact tables (`booking_fact`) inside Azure Synapse Analytics.

### 4. AI-Driven Personalization Engine (n8n + OpenAI)
* **Context Extraction:** Automated nodes in `n8n` query the structured analytics warehouse inside Synapse to fetch operational metrics (e.g., highly volatile markets, major cancellation shifts, high-value customer milestones).
* **Agentic Orchestration:** The data payload is passed into an OpenAI Chat Model with structured system prompts.
* **Generative AI Execution:** Dynamically creates professional, context-aware executive summary emails and personalized automated customer updates.
* **Dispatch System:** Delivers generated text through native Microsoft Outlook API nodes inside n8n pipelines.

---

## 📊 Business Outcomes & Metrics
* **Near-Zero Latency Data Availability:** Real-time visibility into booking patterns instead of waiting for daily end-of-day batches.
* **Fully Serverless Infrastructure:** Maximized computational scalability and reduced cloud operational overhead by relying strictly on Azure's serverless pay-per-use products.
* **Agentic Business Reporting:** Replaced static dashboards with generative, actionable narrative emails dispatched directly to leadership on auto-pilot.

---

## 🛠️ Setup and Deployment Guide

### Prerequisites
- Active Microsoft Azure Subscription
- Azure CLI installed and configured
- An n8n instance (Self-hosted or Cloud)
- OpenAI API credentials

### Step 1: Clone the Repository
```bash
git clone [https://github.com/yourusername/airbnb-cdc-ai-pipeline.git](https://github.com/yourusername/airbnb-cdc-ai-pipeline.git)
cd airbnb-cdc-ai-pipeline
```
