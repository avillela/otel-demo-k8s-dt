---
mode: 'agent'
model: GPT-4o
tools: ['runCommands', 'npx-dynatrace-mcp-server']
description: 'Print average response time per service'
---
Your goal is to display the average response time for each service in Dynatrace.

Requirements:
* Fetch the names of each service in Dynatrace
* Calculate the average response time for each service
* Display the average response time alongside the name of each service. Service names should be displayed in alphabetical order.