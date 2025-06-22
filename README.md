# Tokenized Environmental Sustainability Reporting

A comprehensive blockchain-based system for tracking, measuring, and reporting environmental sustainability metrics using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized platform for organizations to:
- Track environmental impact metrics
- Set and monitor sustainability goals
- Generate automated sustainability reports
- Coordinate improvement initiatives
- Verify sustainability managers and data integrity

## Smart Contracts

### 1. Sustainability Manager (`sustainability-manager.clar`)
Manages verification and authorization of sustainability managers who can input and verify data.

**Key Functions:**
- `verify-manager`: Verify a sustainability manager with credentials
- `is-verified-manager`: Check if a principal is a verified manager
- `get-manager-details`: Retrieve manager information
- `revoke-manager`: Remove manager verification

### 2. Impact Measurement (`impact-measurement.clar`)
Records and tracks environmental impact data across different metrics.

**Key Functions:**
- `record-impact`: Record environmental impact measurements
- `get-impact-record`: Retrieve impact data for specific periods
- `get-organization-totals`: Get cumulative impact totals
- `verify-impact-record`: Verify recorded impact data

**Tracked Metrics:**
- Carbon emissions
- Energy consumption
- Water usage
- Waste generated
- Renewable energy percentage

### 3. Goal Tracking (`goal-tracking.clar`)
Manages sustainability goals and tracks progress toward targets.

**Key Functions:**
- `create-goal`: Set new sustainability goals
- `update-goal-progress`: Update progress toward goals
- `get-goal`: Retrieve goal details
- `get-goal-progress`: Calculate goal completion percentage

### 4. Reporting Automation (`reporting-automation.clar`)
Automates the generation of sustainability reports based on recorded data.

**Key Functions:**
- `generate-report`: Create sustainability reports with scoring
- `get-report`: Retrieve generated reports
- `set-report-schedule`: Configure automated reporting
- `finalize-report`: Mark reports as final

**Scoring System:**
- Carbon Score: Based on emission levels
- Energy Score: Considers consumption and renewable percentage
- Water Score: Based on usage efficiency
- Waste Score: Based on waste generation
- Overall Score: Weighted average of all metrics

### 5. Improvement Coordination (`improvement-coordination.clar`)
Facilitates collaboration on sustainability improvement initiatives.

**Key Functions:**
- `create-initiative`: Launch improvement initiatives
- `join-initiative`: Participate in initiatives
- `update-initiative-progress`: Track progress on initiatives
- `complete-initiative`: Mark initiatives as completed

## Getting Started

### Prerequisites
- Stacks blockchain node or testnet access
- Clarity CLI for contract deployment
- Verified sustainability manager credentials

### Deployment

1. Deploy contracts in the following order:
   \`\`\`bash
   clarity deploy sustainability-manager.clar
   clarity deploy impact-measurement.clar
   clarity deploy goal-tracking.clar
   clarity deploy reporting-automation.clar
   clarity deploy improvement-coordination.clar
   \`\`\`

2. Verify the first sustainability manager:
   ```clarity
   (contract-call? .sustainability-manager verify-manager 
     'SP1MANAGER... 
     "John Doe" 
     "Green Corp" 
     "ISO 14001")
   \`\`\`

### Usage Examples

#### Recording Impact Data
```clarity
(contract-call? .impact-measurement record-impact
  'SP1ORG...           ;; organization
  u202401              ;; period (YYYYMM)
  u5000                ;; carbon emissions (kg CO2)
  u15000               ;; energy consumption (kWh)
  u2000                ;; water usage (liters)
  u100                 ;; waste generated (kg)
  u30)                 ;; renewable energy % (30%)
