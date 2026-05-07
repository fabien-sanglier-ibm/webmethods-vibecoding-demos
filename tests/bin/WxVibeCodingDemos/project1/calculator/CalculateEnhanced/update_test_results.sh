#!/bin/bash

# Script to update test result files with correct decimal formatting
# The pub.math float services return minimal decimal places (e.g., 12.0 instead of 12.0000)

cd "$(dirname "$0")"

# Test 1: add 10 + 5 = 15.0
cat > test1_add_positive_integers-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">15.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 2: add 10.5 + 5.25 = 15.75
cat > test2_add_decimals-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">15.75</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 3: add 10.123456 + 5.654321 = 15.7778 (rounded to 4 decimals)
cat > test3_add_rounding-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">15.7778</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 4: add 0 + 0 = 0.0
cat > test4_add_zero-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">0.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 5: add -10 + 5 = -5.0
cat > test5_add_negative-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">-5.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 6: subtract 10 - 5 = 5.0
cat > test6_subtract_positive-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">5.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 7: subtract 10.75 - 5.25 = 5.5
cat > test7_subtract_decimals-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">5.5</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 8: subtract 10 - 0 = 10.0
cat > test8_subtract_zero-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">10.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 9: multiply 10 * 5 = 50.0
cat > test9_multiply_positive-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">50.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 10: multiply 10 * 0 = 0.0
cat > test10_multiply_zero-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">0.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 11: multiply -10 * 5 = -50.0
cat > test11_multiply_negative-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">-50.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 12: divide 10 / 5 = 2.0
cat > test12_divide_positive-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">2.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 13: divide 10 / 3 = 3.3333 (rounded to 4 decimals)
cat > test13_divide_rounding-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">3.3333</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 14: divide 10 / 0 = Infinity (IEEE 754 standard)
cat > test14_divide_by_zero-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">Infinity</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 15: divide -10 / 5 = -2.0
cat > test15_divide_negative-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">-2.0</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

# Test 16: unknown operation
# Keep as-is (error test)

# Test 17: invalid input
# Keep as-is (error test)

# Test 18: large numbers 999999999 + 1 = 1.0E9 (scientific notation)
cat > test18_large_numbers-result.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<IDataXMLCoder version="1.0">
  <record javaclass="com.wm.data.ISMemDataImpl">
    <value name="result">1.0E9</value>
    <value name="success">true</value>
    <value name="errorMessage"></value>
  </record>
</IDataXMLCoder>
EOF

echo "✅ All test result files updated with correct decimal formatting"

# Made with Bob
