# g-oss-bi · BI & dashboards (Apache Superset)

**Audience:** O&G CIOs/CTOs and analytics leaders  
**Goal:** Offer a no-license BI option for new dashboards while gradually reducing Tableau/Power BI spend where acceptable.

---

## Executive summary
- **What it is:** **Apache Superset** connected to **Trino** (Iceberg).  
- **What it replaces:** Initial net new BI projects; later, selected migrations from Tableau/Power BI where feasible.  
- **Outcomes:** Faster BI provisioning, embedded dashboards, and no per‑viewer licensing.

## Where it fits
```
[Iceberg tables in g-oss-core] <-- Trino --> Superset (dashboards)
```
Superset consumes curated Gold models from `g-oss-batch`/dbt.

## Security & compliance
- SSO via OIDC (Keycloak); row‑level security with Trino catalogs/schemas and Superset RLS if needed.  
- Audit via Superset logs + platform observability.

## Cost model
- Light app; cost is mostly user adoption and dashboard authoring effort.

## KPIs for leadership
- # dashboards created, adoption (MAU), % of BI served via OSS, support tickets vs. legacy tools.

## Quick start
```bash
cp .env.example .env
docker compose up -d
# Superset: http://localhost:8088  (admin/admin default)
```
