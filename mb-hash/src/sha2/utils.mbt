pub fn rotate_right_u32(value: UInt, n: Int) -> UInt {
  let n = n % 32;
  return (value >> n) | (value << (32 - n));
}

test "test_rotate_right_u32" {
  assert_eq(rotate_right_u32(0x12345678U, 4), 0x81234567U);
  assert_eq(rotate_right_u32(0x12345678U, 8), 0x78123456U);
  assert_eq(rotate_right_u32(0x12345678U, 16), 0x56781234U);
  assert_eq(rotate_right_u32(0x12345678U, 32), 0x12345678U);
  assert_eq(rotate_right_u32(0x12345678U, 36), 0x81234567U);
}