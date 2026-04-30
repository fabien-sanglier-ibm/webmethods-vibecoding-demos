# CalculatorResilient Test Suite

## Overview
Comprehensive test suite for the CalculatorResilient flow service with full coverage of all operations and error scenarios.

## Test Suite Details
- **Service**: `WxVibeCodingDemos.project1.calculator:CalculatorResilient`
- **Total Test Cases**: 25
- **Test Files**: 51 (1 suite + 25 input + 25 result)
- **Coverage**: All operations (add, subtract, multiply, divide) + invalid operation

## Test Structure

### Test Coverage by Operation

| Operation | Success Tests | Error Tests | Total |
|-----------|--------------|-------------|-------|
| Add | 3 | 3 | 6 |
| Subtract | 3 | 3 | 6 |
| Multiply | 3 | 3 | 6 |
| Divide | 3 | 3 | 6 |
| Invalid Op | 0 | 1 | 1 |
| **Total** | **12** | **13** | **25** |

## Test Cases

### Addition Tests (test1-test6)

#### Success Tests
1. **test1_add_success_integers**: 10 + 5 = 15.0
   - Tests basic integer addition
   - Expected: result=15.0, success=true

2. **test2_add_success_decimals**: 10.5 + 5.75 = 16.25
   - Tests decimal number addition
   - Expected: result=16.25, success=true

3. **test3_add_success_negative**: -10 + 5 = -5.0
   - Tests addition with negative numbers
   - Expected: result=-5.0, success=true

#### Error Tests
4. **test4_add_error_invalid_num1**: "abc" + 5
   - Tests invalid alphabetic input for num1
   - Expected: result=NaN, success=false

5. **test5_add_error_invalid_num2**: 10 + "xyz"
   - Tests invalid alphabetic input for num2
   - Expected: result=NaN, success=false

6. **test6_add_error_empty_string**: "" + 5
   - Tests empty string input
   - Expected: result=NaN, success=false

### Subtraction Tests (test7-test12)

#### Success Tests
7. **test7_subtract_success_integers**: 20 - 8 = 12.0
   - Tests basic integer subtraction
   - Expected: result=12.0, success=true

8. **test8_subtract_success_decimals**: 100.9999 - 50.5555 = 50.4444
   - Tests decimal number subtraction with precision
   - Expected: result=50.4444, success=true

9. **test9_subtract_success_negative_result**: 5 - 10 = -5.0
   - Tests subtraction resulting in negative number
   - Expected: result=-5.0, success=true

#### Error Tests
10. **test10_subtract_error_invalid_num1**: "invalid" - 5
    - Tests invalid input for num1
    - Expected: result=NaN, success=false

11. **test11_subtract_error_invalid_num2**: 10 - "bad"
    - Tests invalid input for num2
    - Expected: result=NaN, success=false

12. **test12_subtract_error_multiple_decimals**: 10.5.5 - 5
    - Tests malformed decimal number
    - Expected: result=NaN, success=false

### Multiplication Tests (test13-test18)

#### Success Tests
13. **test13_multiply_success_integers**: 7 × 6 = 42.0
    - Tests basic integer multiplication
    - Expected: result=42.0, success=true

14. **test14_multiply_success_decimals**: 3.14159 × 2.5 = 7.854
    - Tests decimal multiplication with rounding
    - Expected: result=7.854, success=true

15. **test15_multiply_success_by_zero**: 100 × 0 = 0.0
    - Tests multiplication by zero
    - Expected: result=0.0, success=true

#### Error Tests
16. **test16_multiply_error_invalid_num1**: "notanumber" × 5
    - Tests invalid input for num1
    - Expected: result=NaN, success=false

17. **test17_multiply_error_invalid_num2**: 10 × "alsonotanumber"
    - Tests invalid input for num2
    - Expected: result=NaN, success=false

18. **test18_multiply_error_whitespace**: "  " × 5
    - Tests whitespace-only input
    - Expected: result=NaN, success=false

### Division Tests (test19-test24)

#### Success Tests
19. **test19_divide_success_integers**: 100 ÷ 4 = 25.0
    - Tests basic integer division
    - Expected: result=25.0, success=true

20. **test20_divide_success_with_rounding**: 10 ÷ 3 = 3.3333
    - Tests division with 4-decimal rounding
    - Expected: result=3.3333, success=true

21. **test21_divide_success_decimals**: 15.5 ÷ 2.5 = 6.2
    - Tests decimal division
    - Expected: result=6.2, success=true

#### Error Tests
22. **test22_divide_error_by_zero**: 10 ÷ 0 = Infinity
    - Tests division by zero (returns Infinity, not error)
    - Expected: result=Infinity, success=true
    - Note: Float division by zero returns Infinity, not NaN

23. **test23_divide_error_invalid_num1**: "notvalid" ÷ 5
    - Tests invalid input for num1
    - Expected: result=NaN, success=false

24. **test24_divide_error_invalid_num2**: 10 ÷ "notvalid"
    - Tests invalid input for num2
    - Expected: result=NaN, success=false

### Invalid Operation Test (test25)

25. **test25_invalid_operation**: 10 "modulo" 5
    - Tests invalid operation parameter
    - Expected: result=NaN, success=false

## Running the Tests

### Prerequisites
- webMethods Integration Server running
- CalculatorResilient service deployed to `WxVibeCodingDemos.project1.calculator`
- Test framework configured

### Execution
1. Import the test suite into webMethods Designer
2. Navigate to the test suite: `CalculatorResilient_TestSuite.xml`
3. Run all tests or individual test cases
4. Review test results

### Expected Results
- **Success Tests (12)**: All should pass with success=true
- **Error Tests (13)**: All should pass with success=false and result=NaN (except test22 which returns Infinity)

## Test File Structure

Each test case consists of two XML files:

### Input File Format
```xml
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="num1">10</value>
    <value name="num2">5</value>
    <value name="operation">add</value>
  </record>
</IDataXMLCoder>
```

### Success Result File Format
```xml
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">15.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
```

### Error Result File Format
```xml
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">NaN</value>
    <value name="success">false</value>
  </record>
</IDataXMLCoder>
```

**Note**: Error result files do NOT include `errorMessage` validation, as error messages can vary based on the underlying issue. Only `result` and `success` fields are validated.

## Test Coverage Analysis

### Operation Coverage
- ✅ **Addition**: Integers, decimals, negative numbers, invalid inputs, empty strings
- ✅ **Subtraction**: Integers, decimals, negative results, invalid inputs, malformed numbers
- ✅ **Multiplication**: Integers, decimals, zero multiplication, invalid inputs, whitespace
- ✅ **Division**: Integers, rounding, decimals, division by zero, invalid inputs
- ✅ **Invalid Operation**: Unsupported operation parameter

### Error Scenario Coverage
- ✅ Invalid alphabetic characters
- ✅ Empty strings
- ✅ Whitespace-only input
- ✅ Malformed decimal numbers
- ✅ Division by zero (returns Infinity)
- ✅ Invalid operation parameter

### Edge Cases Covered
- Negative numbers
- Decimal precision (4 decimal places)
- Zero as operand
- Large decimal numbers
- Rounding behavior

## Regenerating Test Files

If you need to regenerate all test files:

```bash
cd tests/WxVibeCodingDemos/project1/calculator/CalculatorResilient
./generate_test_files.sh
```

This will recreate all 50 test input and result XML files.

## Test Maintenance

### Adding New Tests
1. Add test case to `CalculatorResilient_TestSuite.xml`
2. Create corresponding input XML file
3. Create corresponding result XML file
4. Update this README with test details

### Modifying Tests
1. Update input/result XML files as needed
2. Ensure result format matches service output structure
3. Update test descriptions in README

## Notes

- All success tests validate the exact result value with 4 decimal precision
- Error tests only validate `result=NaN` and `success=false` (errorMessage not checked)
- Division by zero returns `Infinity` with `success=true` (not an error in float division)
- Test file naming convention: `test{number}_{operation}_{type}_{scenario}-{input|result}.xml`

## Related Documentation
- [CalculatorResilient Service Documentation](../../../pub/code/WxVibeCodingDemos/project1/calculator/CalculatorResilient.md)
- [CalculatorResilient Flow Service](../../../pub/code/WxVibeCodingDemos/project1/calculator/CalculatorResilient.flow)