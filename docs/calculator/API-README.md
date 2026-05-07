# Calculator Enhanced API Documentation

## Overview

This directory contains OpenAPI/Swagger descriptors for the **CalculateEnhanced** flow service, enabling REST API access to the calculator functionality.

## Files

- **`CalculateEnhanced-openapi.yaml`** - OpenAPI 3.0 specification in YAML format
- **`CalculateEnhanced-openapi.json`** - OpenAPI 3.0 specification in JSON format
- **`API-README.md`** - This documentation file

## API Endpoint

```
POST /invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced
```

## Supported Operations

| Operation | Description | Example |
|-----------|-------------|---------|
| `add` | Addition | 10 + 5 = 15 |
| `subtract` | Subtraction | 20 - 8 = 12 |
| `multiply` | Multiplication | 7 × 6 = 42 |
| `divide` | Division | 100 ÷ 4 = 25 |

## Request Format

### Headers
```
Content-Type: application/json
```

### Body Schema
```json
{
  "number1": "string",
  "number2": "string",
  "operation": "add|subtract|multiply|divide"
}
```

### Example Requests

#### Addition
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{
    "number1": "10.5",
    "number2": "5.25",
    "operation": "add"
  }'
```

#### Subtraction
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{
    "number1": "20",
    "number2": "8",
    "operation": "subtract"
  }'
```

#### Multiplication
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{
    "number1": "7",
    "number2": "6",
    "operation": "multiply"
  }'
```

#### Division
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{
    "number1": "100",
    "number2": "4",
    "operation": "divide"
  }'
```

## Response Format

### Success Response
```json
{
  "result": "15.75",
  "success": "true",
  "errorMessage": ""
}
```

### Error Response
```json
{
  "result": "NaN",
  "success": "false",
  "errorMessage": "Unknown operation: power"
}
```

### Special Cases

#### Division by Zero
```json
{
  "result": "Infinity",
  "success": "true",
  "errorMessage": ""
}
```

#### Invalid Number Format
```json
{
  "result": "NaN",
  "success": "false",
  "errorMessage": "For input string: \"abc\""
}
```

## Features

- ✅ **Decimal Support** - Handles both integers and decimal numbers
- ✅ **Automatic Rounding** - Results rounded to 4 decimal places
- ✅ **Error Handling** - Comprehensive error messages for invalid inputs
- ✅ **IEEE 754 Compliance** - Returns `Infinity` for division by zero
- ✅ **Validation** - Input validation with clear error messages

## Using the OpenAPI Descriptors

### 1. Swagger UI

Import the OpenAPI descriptor into Swagger UI to get an interactive API documentation:

```bash
# Using Docker
docker run -p 8080:8080 \
  -e SWAGGER_JSON=/openapi/CalculateEnhanced-openapi.yaml \
  -v $(pwd):/openapi \
  swaggerapi/swagger-ui
```

Then open: http://localhost:8080

### 2. Postman

1. Open Postman
2. Click **Import**
3. Select **File** tab
4. Choose `CalculateEnhanced-openapi.yaml` or `CalculateEnhanced-openapi.json`
5. Click **Import**

The API will be imported with all endpoints, examples, and schemas.

### 3. API Client Generation

Generate client libraries in various languages using OpenAPI Generator:

```bash
# Install OpenAPI Generator
npm install @openapitools/openapi-generator-cli -g

# Generate Python client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g python \
  -o ./clients/python

# Generate JavaScript client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g javascript \
  -o ./clients/javascript

# Generate Java client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g java \
  -o ./clients/java
```

### 4. API Testing

Use the OpenAPI descriptor for automated API testing:

```bash
# Using Dredd
npm install -g dredd
dredd CalculateEnhanced-openapi.yaml http://localhost:5555

# Using Schemathesis
pip install schemathesis
schemathesis run CalculateEnhanced-openapi.yaml \
  --base-url http://localhost:5555
```

## Authentication

The API supports two authentication methods:

### 1. Basic Authentication
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -u username:password \
  -H "Content-Type: application/json" \
  -d '{"number1": "10", "number2": "5", "operation": "add"}'
```

### 2. API Key
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "X-API-Key: your-api-key" \
  -H "Content-Type: application/json" \
  -d '{"number1": "10", "number2": "5", "operation": "add"}'
```

## Response Codes

| Code | Description |
|------|-------------|
| 200 | Success - Calculation completed |
| 400 | Bad Request - Missing or invalid parameters |
| 401 | Unauthorized - Authentication required |
| 500 | Internal Server Error - Service error |

## Examples with Different Languages

### Python
```python
import requests

url = "http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced"
payload = {
    "number1": "10.5",
    "number2": "5.25",
    "operation": "add"
}
headers = {"Content-Type": "application/json"}

response = requests.post(url, json=payload, headers=headers)
result = response.json()
print(f"Result: {result['result']}")
```

### JavaScript (Node.js)
```javascript
const axios = require('axios');

const url = 'http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced';
const payload = {
  number1: '10.5',
  number2: '5.25',
  operation: 'add'
};

axios.post(url, payload)
  .then(response => {
    console.log('Result:', response.data.result);
  })
  .catch(error => {
    console.error('Error:', error.message);
  });
```

### Java
```java
import java.net.http.*;
import java.net.URI;

public class CalculatorClient {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced";
        String json = "{\"number1\":\"10.5\",\"number2\":\"5.25\",\"operation\":\"add\"}";
        
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(url))
            .header("Content-Type", "application/json")
            .POST(HttpRequest.BodyPublishers.ofString(json))
            .build();
        
        HttpResponse<String> response = client.send(request, 
            HttpResponse.BodyHandlers.ofString());
        System.out.println(response.body());
    }
}
```

## Validation Rules

### Input Validation
- **number1** and **number2**: Must be valid numeric strings (integers or decimals)
  - Pattern: `^-?\d+(\.\d+)?$`
  - Examples: `"10"`, `"10.5"`, `"-5.25"`
- **operation**: Must be one of: `add`, `subtract`, `multiply`, `divide`

### Output Behavior
- **Normal results**: Rounded to 4 decimal places (e.g., `"15.75"`, `"3.3333"`)
- **Whole numbers**: Displayed with `.0` (e.g., `"15.0"`, `"42.0"`)
- **Division by zero**: Returns `"Infinity"`
- **Invalid operations**: Returns `"NaN"` with `success="false"`
- **Invalid inputs**: Returns `"NaN"` with error message

## Testing the API

### Quick Test Script
```bash
#!/bin/bash

BASE_URL="http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced"

echo "Testing Addition..."
curl -s -X POST $BASE_URL \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"add"}' | jq

echo -e "\nTesting Division by Zero..."
curl -s -X POST $BASE_URL \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"0","operation":"divide"}' | jq

echo -e "\nTesting Invalid Operation..."
curl -s -X POST $BASE_URL \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"power"}' | jq
```

## Support

For issues or questions:
- Check the service documentation: `CalculateEnhanced.md`
- Review test cases: `pub/tests/WxVibeCodingDemos/project1/calculator/CalculateEnhanced/`
- Contact: support@example.com

## Version History

- **v1.0.0** (2026-05-07) - Initial OpenAPI specification
  - Support for add, subtract, multiply, divide operations
  - Decimal number support with 4-decimal precision
  - Comprehensive error handling
  - Multiple authentication methods