# Calculator Enhanced API - Complete Documentation

## 📋 Overview

This directory contains comprehensive REST API documentation and tooling for the **CalculateEnhanced** flow service.

## 📁 API Files

### OpenAPI/Swagger Specifications
| File | Format | Purpose |
|------|--------|---------|
| `CalculateEnhanced-openapi.yaml` | YAML | OpenAPI 3.0 specification (human-readable) |
| `CalculateEnhanced-openapi.json` | JSON | OpenAPI 3.0 specification (machine-readable) |

### Testing & Integration
| File | Purpose |
|------|---------|
| `CalculateEnhanced-postman-collection.json` | Postman collection with 18 pre-configured test requests |
| `API-README.md` | Complete API documentation with examples |
| `API-SUMMARY.md` | This file - quick reference guide |

### Service Files
| File | Purpose |
|------|---------|
| `CalculateEnhanced.flow` | Flow service implementation |
| `CalculateEnhanced.md` | Service documentation |
| `deploy_CalculateEnhanced.sh` | Deployment script |

## 🚀 Quick Start

### 1. View API Documentation

**Option A: Swagger UI (Recommended)**
```bash
# Using Docker
docker run -p 8080:8080 \
  -e SWAGGER_JSON=/openapi/CalculateEnhanced-openapi.yaml \
  -v $(pwd):/openapi \
  swaggerapi/swagger-ui

# Open: http://localhost:8080
```

**Option B: Swagger Editor**
```bash
# Using Docker
docker run -p 8081:8080 swaggerapi/swagger-editor

# Open: http://localhost:8081
# Then: File > Import File > Select CalculateEnhanced-openapi.yaml
```

### 2. Import to Postman

1. Open Postman
2. Click **Import** button
3. Select `CalculateEnhanced-postman-collection.json`
4. Collection appears with 18 ready-to-use requests organized by operation type

### 3. Test the API

**Using curl:**
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"add"}'
```

**Expected Response:**
```json
{
  "result": "15.0",
  "success": "true",
  "errorMessage": ""
}
```

## 📊 API Endpoint

```
POST /invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced
```

### Request Schema
```json
{
  "number1": "string",
  "number2": "string", 
  "operation": "add|subtract|multiply|divide"
}
```

### Response Schema
```json
{
  "result": "string",
  "success": "true|false",
  "errorMessage": "string"
}
```

## 🎯 Supported Operations

| Operation | Description | Example Input | Example Output |
|-----------|-------------|---------------|----------------|
| `add` | Addition | `10 + 5` | `15.0` |
| `subtract` | Subtraction | `20 - 8` | `12.0` |
| `multiply` | Multiplication | `7 × 6` | `42.0` |
| `divide` | Division | `100 ÷ 4` | `25.0` |

## 📦 Postman Collection Structure

The Postman collection includes 18 pre-configured requests:

### Addition (3 requests)
- Add Positive Integers
- Add Decimals
- Add Negative Numbers

### Subtraction (3 requests)
- Subtract Positive Numbers
- Subtract Decimals
- Subtract Resulting in Negative

### Multiplication (4 requests)
- Multiply Positive Numbers
- Multiply Decimals
- Multiply by Zero
- Multiply by Negative

### Division (4 requests)
- Divide Positive Numbers
- Divide with Rounding
- Divide Decimals
- Divide by Zero (Returns Infinity)

### Error Cases (3 requests)
- Unknown Operation
- Invalid Number Format
- Large Numbers

## 🔧 Generate Client Libraries

Use OpenAPI Generator to create client libraries:

```bash
# Install OpenAPI Generator
npm install @openapitools/openapi-generator-cli -g

# Python Client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g python \
  -o ./clients/python

# JavaScript/TypeScript Client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g typescript-axios \
  -o ./clients/typescript

# Java Client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g java \
  -o ./clients/java

# C# Client
openapi-generator-cli generate \
  -i CalculateEnhanced-openapi.yaml \
  -g csharp \
  -o ./clients/csharp
```

## 🧪 API Testing Tools

### 1. Dredd (API Contract Testing)
```bash
npm install -g dredd
dredd CalculateEnhanced-openapi.yaml http://localhost:5555
```

### 2. Schemathesis (Property-Based Testing)
```bash
pip install schemathesis
schemathesis run CalculateEnhanced-openapi.yaml \
  --base-url http://localhost:5555 \
  --checks all
```

### 3. Postman Newman (CLI Testing)
```bash
npm install -g newman
newman run CalculateEnhanced-postman-collection.json \
  --environment postman-environment.json
```

## 📝 Example Requests

### Addition
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{"number1":"10.5","number2":"5.25","operation":"add"}'

# Response: {"result":"15.75","success":"true","errorMessage":""}
```

### Division by Zero
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"0","operation":"divide"}'

# Response: {"result":"Infinity","success":"true","errorMessage":""}
```

### Invalid Operation
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"power"}'

# Response: {"result":"NaN","success":"false","errorMessage":"Unknown operation: power"}
```

## 🔐 Authentication

The API supports two authentication methods:

### Basic Authentication
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -u username:password \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"add"}'
```

### API Key
```bash
curl -X POST http://localhost:5555/invoke/WxVibeCodingDemos.project1.calculator/CalculateEnhanced \
  -H "X-API-Key: your-api-key" \
  -H "Content-Type: application/json" \
  -d '{"number1":"10","number2":"5","operation":"add"}'
```

## 📚 Additional Resources

- **Full API Documentation**: See `API-README.md`
- **Service Documentation**: See `CalculateEnhanced.md`
- **Test Suite**: See `pub/tests/WxVibeCodingDemos/project1/calculator/CalculateEnhanced/`
- **Deployment Guide**: See `deploy_CalculateEnhanced.sh`

## 🎨 API Design Features

✅ **OpenAPI 3.0 Compliant** - Industry-standard API specification  
✅ **Comprehensive Examples** - Request/response examples for all scenarios  
✅ **Error Handling** - Clear error messages and status codes  
✅ **Type Safety** - Strict schema validation  
✅ **Authentication** - Multiple auth methods supported  
✅ **Testing Ready** - Postman collection with 18 test cases  
✅ **Client Generation** - Generate clients in 50+ languages  
✅ **Documentation** - Auto-generated interactive docs  

## 🔄 Version History

- **v1.0.0** (2026-05-07)
  - Initial OpenAPI specification
  - Postman collection with 18 test cases
  - Support for 4 arithmetic operations
  - Comprehensive error handling
  - Multiple authentication methods

## 📞 Support

For questions or issues:
- Review the full documentation in `API-README.md`
- Check the service documentation in `CalculateEnhanced.md`
- Examine test cases in `pub/tests/WxVibeCodingDemos/project1/calculator/CalculateEnhanced/`

## 🎯 Next Steps

1. ✅ Import Postman collection for quick testing
2. ✅ View API in Swagger UI for interactive documentation
3. ✅ Generate client library for your preferred language
4. ✅ Set up automated API testing with Dredd or Schemathesis
5. ✅ Deploy the service using `deploy_CalculateEnhanced.sh`

---

**Generated**: 2026-05-07  
**API Version**: 1.0.0  
**Service**: CalculateEnhanced  
**Namespace**: WxVibeCodingDemos.project1.calculator