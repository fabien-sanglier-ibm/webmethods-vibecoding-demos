# Calculator Service Test Suite

## Overview

Comprehensive non-regression test suite for the `Calculate` service with full coverage of all operations and error scenarios.

## Directory Structure

```
pub/
  tests/
    WxVibeCodingDemos/
      project1/
        calculator/
          Calculate_TestSuite.xml
          success_add_positive_integers-input.xml
          success_add_positive_integers-result.xml
          success_add_decimals-input.xml
          success_add_decimals-result.xml
          ... (all test input/result pairs)
          README.md (this file)
```

## Test Suite Structure

- **Test Suite XML**: `Calculate_TestSuite.xml` - Defines all 27 test cases
- **Input Files**: `[testName]-input.xml` - Input parameters for each test
- **Result Files**: `[testName]-result.xml` - Expected outputs for each test

## Test Coverage Summary

### Total Tests: 27
- **Success Tests**: 12 (3 per operation)
- **Error Tests**: 15 (3 per operation + 3 invalid operation tests)

## Test Cases by Operation

### ADD Operation (6 tests)

#### Success Tests (3)
1. **success_add_positive_integers** - Add positive integers (10 + 5 = 15)
2. **success_add_decimals** - Add decimals with precision (10.5 + 5.25 = 15.75)
3. **success_add_negative** - Add negative numbers (-10 + -5 = -15)

#### Error Tests (3)
4. **error_add_missing_num1** - Missing num1 parameter
5. **error_add_invalid_num1** - Invalid alphabetic input for num1
6. **error_add_empty_num2** - Empty string for num2

### SUBTRACT Operation (6 tests)

#### Success Tests (3)
7. **success_subtract_positive** - Subtract positive integers (20 - 8 = 12)
8. **success_subtract_decimals** - Subtract decimals (15.75 - 3.25 = 12.5)
9. **success_subtract_negative_result** - Subtract resulting in negative (5 - 10 = -5)

#### Error Tests (3)
10. **error_subtract_null_num1** - Null/missing num1
11. **error_subtract_invalid_num2** - Invalid special characters for num2
12. **error_subtract_missing_both** - Both parameters missing

### MULTIPLY Operation (6 tests)

#### Success Tests (3)
13. **success_multiply_positive** - Multiply positive integers (6 * 7 = 42)
14. **success_multiply_decimals** - Multiply decimals (2.5 * 4.2 = 10.5)
15. **success_multiply_by_zero** - Multiply by zero (10 * 0 = 0)

#### Error Tests (3)
16. **error_multiply_missing_num2** - Missing num2 parameter
17. **error_multiply_invalid_num1** - Invalid text input for num1
18. **error_multiply_empty_strings** - Both parameters empty strings

### DIVIDE Operation (6 tests)

#### Success Tests (3)
19. **success_divide_positive** - Divide positive integers (20 / 4 = 5)
20. **success_divide_decimals** - Divide decimals (10.5 / 2.5 = 4.2)
21. **success_divide_precision** - Divide with high precision (22 / 7 = 3.1429)

#### Error Tests (3)
22. **error_divide_by_zero** - Division by zero
23. **error_divide_invalid_num1** - Invalid input for num1
24. **error_divide_missing_num2** - Missing num2 parameter

### INVALID OPERATION Tests (3 tests)

#### Error Tests (3)
25. **error_invalid_operation_modulo** - Unsupported operation (modulo)
26. **error_missing_operation** - Missing operation parameter
27. **error_empty_operation** - Empty operation parameter

## Expected Results Format

### Success Tests
All success tests expect:
```xml
<value name="result">[calculated value]</value>
<value name="success">true</value>
```

### Error Tests
All error tests expect:
```xml
<value name="result">NaN</value>
<value name="success">false</value>
```

**Note**: Error tests only validate the `success` flag, not the error message content, as error messages may vary based on the underlying issue.

## Running the Tests

### Using webMethods Designer
1. Open webMethods Designer
2. Navigate to the test suite: `pub/tests/WxVibeCodingDemos/project1/calculator/Calculate_TestSuite.xml`
3. Right-click and select "Run Test Suite"
4. View results in the Test Results panel

### Using Integration Server Administrator
1. Navigate to: `http://localhost:5555/WmTestSuite/`
2. Browse to: `pub/tests/WxVibeCodingDemos/project1/calculator/`
3. Select `Calculate_TestSuite.xml`
4. Click "Run Tests"
5. Review test execution results

### Using Command Line (if WmTestSuite package is installed)
```bash
curl -X POST "http://localhost:5555/invoke/wm.testsuite:runTestSuite" \
  -u "Administrator:manage" \
  -d "testSuitePath=pub/tests/WxVibeCodingDemos/project1/calculator/Calculate_TestSuite.xml"
```

## Test Data Characteristics

### Precision Testing
- Default precision: 4 decimals
- Custom precision tests: 1, 2, 4 decimals
- Tests verify proper rounding behavior

### Boundary Conditions
- Zero values (multiply by zero, divide by zero)
- Negative numbers (negative inputs, negative results)
- Empty strings and missing parameters
- Invalid data types (alphabetic, special characters)

### Error Handling
- Missing required parameters
- Invalid data types
- Unsupported operations
- Division by zero validation

## File Path Convention

All test file paths in `Calculate_TestSuite.xml` are relative to the `pub/tests/` directory:

```xml
<file filename="WxVibeCodingDemos/project1/calculator/[testName]-input.xml"/>
<file filename="WxVibeCodingDemos/project1/calculator/[testName]-result.xml"/>
```

This follows the webMethods test framework convention where:
- Test files are organized under `pub/tests/`
- Folder structure mirrors the service namespace: `WxVibeCodingDemos.project1.calculator`
- Service folder attribute: `folder="WxVibeCodingDemos/project1/calculator"`

## Maintenance

When updating the Calculate service:
1. Review test cases for relevance
2. Add new tests for new functionality
3. Update expected results if behavior changes
4. Maintain 3 success + 3 error tests per operation minimum

## Test Execution Best Practices

1. **Run full suite** before deploying changes
2. **Verify all tests pass** - 27/27 expected
3. **Review failures** carefully - check service logic vs test expectations
4. **Update tests** when service contract changes
5. **Add regression tests** for any bugs found in production

## Coverage Metrics

- **Operations Covered**: 4/4 (100%)
  - add ✅
  - subtract ✅
  - multiply ✅
  - divide ✅

- **Success Scenarios**: 12 tests
  - Integer operations ✅
  - Decimal operations ✅
  - Precision handling ✅
  - Negative numbers ✅
  - Zero handling ✅

- **Error Scenarios**: 15 tests
  - Missing parameters ✅
  - Invalid data types ✅
  - Empty strings ✅
  - Division by zero ✅
  - Invalid operations ✅

## Related Files

- **Service Implementation**: [`pub/code/WxVibeCodingDemos/project1/calculator/Calculate.flow`](../../../code/WxVibeCodingDemos/project1/calculator/Calculate.flow:1)
- **Service Documentation**: [`pub/code/WxVibeCodingDemos/project1/calculator/Calculate.md`](../../../code/WxVibeCodingDemos/project1/calculator/Calculate.md:1)
- **Deployment Script**: [`pub/code/WxVibeCodingDemos/project1/calculator/deploy_Calculate.sh`](../../../code/WxVibeCodingDemos/project1/calculator/deploy_Calculate.sh:1)

## Version History

- **v1.0** (2026-05-18) - Initial comprehensive test suite
  - 27 test cases covering all operations
  - 3 success + 3 error tests per operation
  - Additional invalid operation tests
  - Organized in `pub/tests/` directory structure

---

**Generated with Bob** - webMethods Developer Skill