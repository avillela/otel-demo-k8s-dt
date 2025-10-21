---
applyTo: "**"
---
# Dynatrace MCP server query standards

## Data filtering guidelines
- If the value of DT_ENVIRONMENT is "https://wkf10640.apps.dynatrace.com", then always filter by segment name "Astroshop". For any other value of DT_ENVIRONMENT, don't filter by segment name.

## Service response time guidelines
- When fetching the response time, use the dt.service.request.response_time
- When fetching the p50 response time, use percentile(dt.service.request.response_time, 50)

## Guidelines for fetching Dynatrace services
- When fetching service names in Dynatrace, always query dt.entity.service, but always display the service names from the entity.name field

## Display guidelines
- Use the name field, not the ID field when listing services.
- If a null value is returned when requesting a value for trace ID, try "trace.id", "trace_id", and "trace id"
- If a null value is returned when requesting a value for trace ID, try "span.id", "span_id", and "span id"