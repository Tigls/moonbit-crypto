test {
  let result = getrandom(32)
  assert_true(result.is_ok())
  
  match result {
    Ok(dest) => {
      // Print received bytes in hex
      let n = dest.length()
      let mut i = 0
      let mut out = ""
      while i < n {
        let v = dest[i].to_int()
        let hi = (v >> 4) & 0xF
        let lo = v & 0xF
        out = out + hex_digit(hi) + hex_digit(lo)
        i = i + 1
      }
      println(out)
    }
    Err(_) => assert_true(false) // Should not reach here
  }
}

fn hex_digit(n: Int) -> String {
  if n == 0 { return "0" }
  if n == 1 { return "1" }
  if n == 2 { return "2" }
  if n == 3 { return "3" }
  if n == 4 { return "4" }
  if n == 5 { return "5" }
  if n == 6 { return "6" }
  if n == 7 { return "7" }
  if n == 8 { return "8" }
  if n == 9 { return "9" }
  if n == 10 { return "a" }
  if n == 11 { return "b" }
  if n == 12 { return "c" }
  if n == 13 { return "d" }
  if n == 14 { return "e" }
  "f"
}