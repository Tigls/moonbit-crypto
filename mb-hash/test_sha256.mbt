fn main() -> Unit {
  // Test empty string
  let input: Array[UInt] = []
  let sha256 = @sha2.sha256_new()
  sha256.update(input)
  let result = sha256.finalize()
  
  println("Empty string hash:")
  for i in 0..<result.length() {
    print(result[i].to_string() + " ")
  }
  println("")
  
  // Expected for empty string:
  // e3 b0 c4 42 98 fc 1c 14 9a fb f4 c8 99 6f b9 24 
  // 27 ae 41 e4 64 9b 93 4c a4 95 99 1b 78 52 b8 55
}