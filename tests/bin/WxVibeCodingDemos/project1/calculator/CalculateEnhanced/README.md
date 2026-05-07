# CalculateEnhanced Test Suite

## Overview

Comprehensive test suite for the `CalculateEnhanced` service with 18 test cases covering all operations (add, subtract, multiply, divide) across various scenarios including success cases, edge cases, and error conditions.

**Service Under Test**: `WxVibeCodingDemos.project1.calculator:CalculateEnhanced`

## Test Suite Files

- **Test Suite**: `CalculateEnhanced_TestSuite.xml`
- **Test Cases**: 18 tests with corresponding input and result XML files
- **Location**: `pub/tests/WxVibeCodingDemos/project1/calculator/CalculateEnhanced/`

## Test Cases

### Addition Tests (Tests 1-4)

#### Test 1: Add two positive integers
- **Input**: `number1=10`, `number2=5`, `operation=add`
- **Expected**: `result=15.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Basic addition with integers

#### Test 2: Add two decimal numbers
- **Input**: `number1=10.5`, `number2=5.25`, `operation=add`
- **Expected**: `result=15.75`, `success=true`, `errorMessage=""`
- **Coverage**: Decimal number support

#### Test 3: Add with zero
- **Input**: `number1=100`, `number2=0`, `operation=add`
- **Expected**: `result=100.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Edge case - adding zero

#### Test 4: Add negative numbers
- **Input**: `number1=-10`, `number2=-5`, `operation=add`
- **Expected**: `result=-15.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Negative number handling

### Subtraction Tests (Tests 5-7)

#### Test 5: Subtract two positive integers
- **Input**: `number1=20`, `number2=8`, `operation=subtract`
- **Expected**: `result=12.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Basic subtraction

#### Test 6: Subtract with decimals
- **Input**: `number1=100.5`, `number2=25.25`, `operation=subtract`
- **Expected**: `result=75.25`, `success=true`, `errorMessage=""`
- **Coverage**: Decimal subtraction

#### Test 7: Subtract resulting in negative
- **Input**: `number1=5`, `number2=10`, `operation=subtract`
- **Expected**: `result=-5.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Negative result handling

### Multiplication Tests (Tests 8-11)

#### Test 8: Multiply two positive integers
- **Input**: `number1=7`, `number2=6`, `operation=multiply`
- **Expected**: `result=42.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Basic multiplication

#### Test 9: Multiply with decimals
- **Input**: `number1=3.14159`, `number2=2.71828`, `operation=multiply`
- **Expected**: `result=8.5397`, `success=true`, `errorMessage=""`
- **Coverage**: Decimal multiplication with rounding to 4 places

#### Test 10: Multiply by zero
- **Input**: `number1=100`, `number2=0`, `operation=multiply`
- **Expected**: `result=0.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Edge case - multiplication by zero

#### Test 11: Multiply by negative
- **Input**: `number1=-5`, `number2=4`, `operation=multiply`
- **Expected**: `result=-20.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Negative multiplication

### Division Tests (Tests 12-15)

#### Test 12: Divide two positive integers
- **Input**: `number1=100`, `number2=4`, `operation=divide`
- **Expected**: `result=25.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Basic division

#### Test 13: Divide with rounding (10/3)
- **Input**: `number1=10`, `number2=3`, `operation=divide`
- **Expected**: `result=3.3333`, `success=true`, `errorMessage=""`
- **Coverage**: Division with rounding to 4 decimal places

#### Test 14: Divide with decimals
- **Input**: `number1=22.5`, `number2=4.5`, `operation=divide`
- **Expected**: `result=5.0000`, `success=true`, `errorMessage=""`
- **Coverage**: Decimal division

#### Test 15: Divide by zero (returns Infinity)
- **Input**: `number1=10`, `number2=0`, `operation=divide`
- **Expected**: `result=Infinity`, `success=true`, `errorMessage=""`
- **Coverage**: Division by zero (IEEE 754 behavior)
- **Note**: Float division by zero returns "Infinity", not an error

### Error/Failure Tests (Tests 16-17)

#### Test 16: Unknown operation error
- **Input**: `number1=10`, `number2=5`, `operation=power`
- **Expected**: `result=NaN`, `success=false`
- **Coverage**: Invalid operation handling
- **Note**: errorMessage not tested (can vary)

#### Test 17: Invalid number format error
- **Input**: `number1=abc`, `number2=5`, `operation=add`
- **Expected**: `result=NaN`, `success=false`
- **Coverage**: Invalid input handling
- **Note**: errorMessage not tested (can vary)

### Large Number Tests (Test 18)

#### Test 18: Large numbers addition
- **Input**: `number1=999999.9999`, `number2=888888.8888`, `operation=add`
- **Expected**: `result=1888888.8887`, `success=true`, `errorMessage=""`
- **Coverage**: Large number handling with rounding

## Test Coverage Matrix

| Scenario | Operation | Test Cases | Coverage |
|----------|-----------|------------|----------|
| **Happy Path** | Add | 1, 2 | ✓ |
| | Subtract | 5, 6 | ✓ |
| | Multiply | 8, 9 | ✓ |
| | Divide | 12, 13, 14 | ✓ |
| **Edge Cases** | Zero | 3, 10 | ✓ |
| | Negative | 4, 7, 11 | ✓ |
| | Rounding | 9, 13 | ✓ |
| | Division by zero | 15 | ✓ |
| **Error Cases** | Unknown operation | 16 | ✓ |
| | Invalid input | 17 | ✓ |
| **Boundary** | Large numbers | 18 | ✓ |

## Coverage Summary

- **Total Tests**: 18
- **Success Cases**: 15 (Tests 1-15)
- **Failure Cases**: 2 (Tests 16-17)
- **Large Number Cases**: 1 (Test 18)
- **Operations Covered**: 4 (add, subtract, multiply, divide)
- **Scenarios per Operation**: 
  - Addition: 4 tests
  - Subtraction: 3 tests
  - Multiplication: 4 tests
  - Division: 4 tests
  - Error handling: 2 tests
  - Large numbers: 1 test

## Running the Tests

### Prerequisites
1. webMethods Integration Server 11.1.0 or higher
2. WmDSL package deployed on Integration Server
3. CalculateEnhanced service deployed to `WxVibeCodingDemos.project1.calculator` namespace

### Import Test Suite

1. **Copy test files** to Integration Server:
   ```bash
   # Copy entire test directory to IS packages directory
   cp -r pub/tests/WxVibeCodingDemos /path/to/IntegrationServer/packages/WxVibeCodingDemos/ns/
   ```

2. **Import in Designer**:
   - Open webMethods Designer
   - Navigate to Package Navigator
   - Right-click on `WxVibeCodingDemos` package
   - Select `Import` → `Test Suite`
   - Browse to `CalculateEnhanced_TestSuite.xml`
   - Click `Finish`

### Execute Tests

#### Option 1: Run All Tests
1. In Designer, navigate to the test suite
2. Right-click on `CalculateEnhanced_TestSuite.xml`
3. Select `Run As` → `Test Suite`
4. View results in Test Results view

#### Option 2: Run Individual Test
1. Expand the test suite in Package Navigator
2. Right-click on a specific test case
3. Select `Run As` → `Test Case`
4. View results in Test Results view

#### Option 3: Command Line (using WmTestSuite)
```bash
# Run entire test suite
curl -X POST "http://localhost:5555/invoke/wm.server.test:executeTestSuite" \
  -u "Administrator:manage" \
  -d "suiteName=calculateEnhancedTestSuite"
```

## Expected Results

### All Tests Should Pass
- **Success Tests (1-15)**: All should pass with `success=true`
- **Failure Tests (16-17)**: Should pass with `success=false` and `result=NaN`

### Common Issues

#### Test Failures
1. **Service not deployed**: Ensure CalculateEnhanced is deployed
2. **Wrong namespace**: Verify service is in `WxVibeCodingDemos.project1.calculator`
3. **Precision mismatch**: Check rounding is set to 4 decimal places

#### File Path Issues
- Ensure test files are in correct directory structure
- Verify file paths in TestSuite.xml match actual file locations

## Adding New Test Cases

To add a new test case:

1. **Create input XML file**:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <IDataXMLCoder version="1.0">
     <record javaclass="com.wm.data.ISMemDataImpl">
       <value name="number1">value1</value>
       <value name="number2">value2</value>
       <value name="operation">operation</value>
     </record>
   </IDataXMLCoder>
   ```

2. **Create result XML file**:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <IDataXMLCoder version="1.0">
     <record javaclass="com.wm.data.ISMemDataImpl">
       <value name="result">expected_result</value>
       <value name="success">true_or_false</value>
       <value name="errorMessage">error_if_applicable</value>
     </record>
   </IDataXMLCoder>
   ```

3. **Add test case to TestSuite.xml**:
   ```xml
   <webMethodsTestCase description="Test description" name="testN_description">
       <service folder="WxVibeCodingDemos.project1.calculator" name="CalculateEnhanced">
           <input>
               <file filename="WxVibeCodingDemos/project1/calculator/CalculateEnhanced/testN_description-input.xml"/>
           </input>
           <expected>
               <file filename="WxVibeCodingDemos/project1/calculator/CalculateEnhanced/testN_description-result.xml"/>
           </expected>
       </service>
   </webMethodsTestCase>
   ```

4. **Update this README** with the new test case details

## Troubleshooting

### Test Execution Fails

**Problem**: Test suite won't execute
- **Solution**: Verify WmTestSuite package is enabled
- **Solution**: Check Integration Server logs for errors

### Test Results Don't Match

**Problem**: Expected vs actual results differ
- **Solution**: Run service manually to verify actual output
- **Solution**: Check for rounding differences (should be 4 decimals)
- **Solution**: For error tests, only verify `success=false` and `result=NaN`

### File Not Found Errors

**Problem**: Test files cannot be found
- **Solution**: Verify file paths in TestSuite.xml are relative to `pub/tests/`
- **Solution**: Check file names match exactly (case-sensitive)

### Service Not Found

**Problem**: Service cannot be invoked
- **Solution**: Deploy CalculateEnhanced service first
- **Solution**: Verify namespace matches: `WxVibeCodingDemos.project1.calculator`

## Test Maintenance

### When to Update Tests

Update tests when:
- Service signature changes (input/output parameters)
- Business logic changes (calculation rules)
- Error handling changes
- New operations are added
- Rounding precision changes

### Test Review Checklist

- [ ] All test files follow naming convention
- [ ] Input XML matches service signature
- [ ] Expected results are accurate
- [ ] Error tests don't check errorMessage content
- [ ] File paths in TestSuite.xml are correct
- [ ] README is updated with new tests

## Notes

- **Error Message Testing**: Error tests (16-17) only verify `success=false` and `result=NaN`. The `errorMessage` field is not tested as it can vary based on the underlying error.
- **Division by Zero**: Test 15 expects `Infinity` as the result, which is standard IEEE 754 floating-point behavior.
- **Rounding**: All results are rounded to 4 decimal places using the `precision` parameter in float math services.
- **Decimal Support**: The service uses float-based math operations (`pub.math:addFloats`, etc.) to support both integers and decimals.

---

**Test Suite Version**: 1.0  
**Last Updated**: 2026-05-05  
**Service Version**: CalculateEnhanced 1.0