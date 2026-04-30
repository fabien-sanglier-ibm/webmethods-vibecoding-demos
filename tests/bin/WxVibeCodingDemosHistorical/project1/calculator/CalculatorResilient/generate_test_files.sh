#!/bin/bash

# Script to generate all test input and result XML files for CalculatorResilient

TEST_DIR="."

# Function to create input XML
create_input() {
    local filename=$1
    local num1=$2
    local num2=$3
    local operation=$4
    
    cat > "${TEST_DIR}/${filename}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="num1">${num1}</value>
    <value name="num2">${num2}</value>
    <value name="operation">${operation}</value>
  </record>
</IDataXMLCoder>
EOF
}

# Function to create success result XML
create_success_result() {
    local filename=$1
    local result=$2
    
    cat > "${TEST_DIR}/${filename}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">${result}</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF
}

# Function to create error result XML (no errorMessage check)
create_error_result() {
    local filename=$1
    local result=$2
    
    cat > "${TEST_DIR}/${filename}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">${result}</value>
    <value name="success">false</value>
  </record>
</IDataXMLCoder>
EOF
}

echo "Generating test files for CalculatorResilient..."

# ADD TESTS
create_input "test1_add_success_integers-input.xml" "10" "5" "add"
create_success_result "test1_add_success_integers-result.xml" "15.0"

create_input "test2_add_success_decimals-input.xml" "10.5" "5.75" "add"
create_success_result "test2_add_success_decimals-result.xml" "16.25"

create_input "test3_add_success_negative-input.xml" "-10" "5" "add"
create_success_result "test3_add_success_negative-result.xml" "-5.0"

create_input "test4_add_error_invalid_num1-input.xml" "abc" "5" "add"
create_error_result "test4_add_error_invalid_num1-result.xml" "NaN"

create_input "test5_add_error_invalid_num2-input.xml" "10" "xyz" "add"
create_error_result "test5_add_error_invalid_num2-result.xml" "NaN"

create_input "test6_add_error_empty_string-input.xml" "" "5" "add"
create_error_result "test6_add_error_empty_string-result.xml" "NaN"

# SUBTRACT TESTS
create_input "test7_subtract_success_integers-input.xml" "20" "8" "subtract"
create_success_result "test7_subtract_success_integers-result.xml" "12.0"

create_input "test8_subtract_success_decimals-input.xml" "100.9999" "50.5555" "subtract"
create_success_result "test8_subtract_success_decimals-result.xml" "50.4444"

create_input "test9_subtract_success_negative_result-input.xml" "5" "10" "subtract"
create_success_result "test9_subtract_success_negative_result-result.xml" "-5.0"

create_input "test10_subtract_error_invalid_num1-input.xml" "invalid" "5" "subtract"
create_error_result "test10_subtract_error_invalid_num1-result.xml" "NaN"

create_input "test11_subtract_error_invalid_num2-input.xml" "10" "bad" "subtract"
create_error_result "test11_subtract_error_invalid_num2-result.xml" "NaN"

create_input "test12_subtract_error_multiple_decimals-input.xml" "10.5.5" "5" "subtract"
create_error_result "test12_subtract_error_multiple_decimals-result.xml" "NaN"

# MULTIPLY TESTS
create_input "test13_multiply_success_integers-input.xml" "7" "6" "multiply"
create_success_result "test13_multiply_success_integers-result.xml" "42.0"

create_input "test14_multiply_success_decimals-input.xml" "3.14159" "2.5" "multiply"
create_success_result "test14_multiply_success_decimals-result.xml" "7.854"

create_input "test15_multiply_success_by_zero-input.xml" "100" "0" "multiply"
create_success_result "test15_multiply_success_by_zero-result.xml" "0.0"

create_input "test16_multiply_error_invalid_num1-input.xml" "notanumber" "5" "multiply"
create_error_result "test16_multiply_error_invalid_num1-result.xml" "NaN"

create_input "test17_multiply_error_invalid_num2-input.xml" "10" "alsonotanumber" "multiply"
create_error_result "test17_multiply_error_invalid_num2-result.xml" "NaN"

create_input "test18_multiply_error_whitespace-input.xml" "  " "5" "multiply"
create_error_result "test18_multiply_error_whitespace-result.xml" "NaN"

# DIVIDE TESTS
create_input "test19_divide_success_integers-input.xml" "100" "4" "divide"
create_success_result "test19_divide_success_integers-result.xml" "25.0"

create_input "test20_divide_success_with_rounding-input.xml" "10" "3" "divide"
create_success_result "test20_divide_success_with_rounding-result.xml" "3.3333"

create_input "test21_divide_success_decimals-input.xml" "15.5" "2.5" "divide"
create_success_result "test21_divide_success_decimals-result.xml" "6.2"

create_input "test22_divide_error_by_zero-input.xml" "10" "0" "divide"
create_success_result "test22_divide_error_by_zero-result.xml" "Infinity"

create_input "test23_divide_error_invalid_num1-input.xml" "notvalid" "5" "divide"
create_error_result "test23_divide_error_invalid_num1-result.xml" "NaN"

create_input "test24_divide_error_invalid_num2-input.xml" "10" "notvalid" "divide"
create_error_result "test24_divide_error_invalid_num2-result.xml" "NaN"

# INVALID OPERATION TEST
create_input "test25_invalid_operation-input.xml" "10" "5" "modulo"
create_error_result "test25_invalid_operation-result.xml" "NaN"

echo "✅ All test files generated successfully!"
echo "Total: 25 test cases (50 files: 25 input + 25 result)"

# Made with Bob
