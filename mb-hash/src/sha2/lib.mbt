// Re-export SHA256 functionality for public API

pub fn sha256_digest(input: Array[UInt]) -> FixedArray[UInt] {
  let sha256 = Sha256::new()
  sha256.update(input)
  sha256.finalize()
}

pub fn sha256_new() -> Sha256 {
  Sha256::new()
}

// Helper function to format hash as hex string
pub fn hash_to_hex(hash: FixedArray[UInt]) -> String {
  let hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
  let mut result = ""
  for byte in hash {
    let high = (byte >> 4) & 0xFU
    let low = byte & 0xFU
    result = result + hex_chars[high.reinterpret_as_int()].to_string() + hex_chars[low.reinterpret_as_int()].to_string()
  }
  result
}

// Convenience functions for different input types
pub fn hash_bytes(input: Bytes) -> FixedArray[UInt] {
  Sha256::digest_bytes(input)
}

pub fn hash_string(input: String) -> FixedArray[UInt] {
  Sha256::digest_string(input)
}

pub fn hash_array(input: Array[UInt]) -> FixedArray[UInt] {
  Sha256::digest(input)
}

// Hex versions
pub fn hash_bytes_hex(input: Bytes) -> String {
  let hash = hash_bytes(input)
  hash_to_hex(hash)
}

pub fn hash_string_hex(input: String) -> String {
  let hash = hash_string(input)
  hash_to_hex(hash)
}

pub fn hash_array_hex(input: Array[UInt]) -> String {
  let hash = hash_array(input)
  hash_to_hex(hash)
}
