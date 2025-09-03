# MoonBit Crypto

A comprehensive cryptographic library collection for the MoonBit programming language, providing secure and performant implementations of essential cryptographic primitives.

## Overview

MoonBit Crypto aims to provide a robust, modular, and easy-to-use cryptographic ecosystem for MoonBit developers. Inspired by RustCrypto's design philosophy, this project offers individual packages for different cryptographic operations, allowing developers to include only what they need.

## Packages

### Core Components

| Package | Description | Status |
|---------|-------------|--------|
| **mb-getrandom** | Secure random number generation (OS entropy; native+WASM) | ✅ DONE |
| **mb-chacha** | ChaCha20 stream cipher implementation | 🚧 In Development |
| **mb-rand-chacha** | ChaCha20-based DRBG with reseed & fork-safety | 🚧 In Development |

### Hash Functions & MACs

| Package | Description | Status |
|---------|-------------|--------|
| **mb-hash** | Cryptographic hash functions (SHA-256, SHA-512) | 🚧 In Development |
| **mb-mac** | Message Authentication Codes (HMAC, Poly1305) | 🚧 In Development |
| **mb-kdf** | Key Derivation Functions (HKDF, PBKDF2, Argon2) | 🚧 In Development |

### Encryption & Key Exchange

| Package | Description | Status |
|---------|-------------|--------|
| **mb-aead** | Authenticated Encryption (ChaCha20-Poly1305, XChaCha20-Poly1305, AES-GCM) | 🚧 In Development |
| **mb-aes** | AES block cipher implementation | 🚧 In Development |
| **mb-ecdh** | Elliptic Curve Diffie-Hellman (X25519, P-256) | 🚧 In Development |

## Installation

Each package can be installed independently using MoonBit's package manager:

```bash
moon add moonbitlang/mb-hash
moon add moonbitlang/mb-aead
# etc.
```

## Usage Examples

### Generate Random Bytes

```moonbit
use moonbitlang/mb-getrandom

fn main {
  let mut buffer = Bytes::new(32)
  match getrandom(buffer) {
    Ok(_) => println("Random bytes generated")
    Err(e) => println("Error: \{e}")
  }
}
```

### Hash Data with SHA-256

```moonbit
use moonbitlang/mb-hash

fn main {
  let data = "Hello, MoonBit!".to_bytes()
  let hash = sha256(data)
  println("SHA-256: \{hash.to_hex()}")
}
```

### Authenticated Encryption with ChaCha20-Poly1305

```moonbit
use moonbitlang/mb-aead

fn main {
  let key = random_key(32)
  let nonce = random_nonce(12)
  let plaintext = "Secret message".to_bytes()
  
  let cipher = ChaCha20Poly1305::new(key)?
  let ciphertext = cipher.encrypt(nonce, plaintext, None)?
  let decrypted = cipher.decrypt(nonce, ciphertext, None)?
}
```

## Security Considerations

⚠️ **Important**: These libraries are currently in development and have not been audited. Do not use in production systems yet.

- All implementations aim to be constant-time where applicable
- Test vectors from relevant RFCs and standards are included
- Fork-safety and proper entropy management are prioritized
- WebAssembly support includes secure random generation via Web Crypto API

## Development Roadmap

### Phase 1: Foundation (Current)
- ✅ Project structure and build setup
- ✅ mb-getrandom: OS entropy access
- 🚧 mb-chacha: Core ChaCha20 implementation with test vectors

### Phase 2: Core Crypto
- 🔄 mb-rand-chacha: CSPRNG with reseeding
- 🔄 mb-hash: SHA-256/512 implementations
- 🔄 mb-mac: HMAC and Poly1305

### Phase 3: Advanced Features
- 📋 mb-kdf: HKDF, PBKDF2, Argon2
- 📋 mb-aead: ChaCha20-Poly1305, AES-GCM
- 📋 mb-aes: AES block cipher
- 📋 mb-ecdh: X25519, P-256 key exchange

### Phase 4: Production Ready
- 📋 Security audit
- 📋 Performance optimization
- 📋 Comprehensive documentation
- 📋 Additional algorithms based on community needs

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

### Development Setup

```bash
git clone https://github.com/moonbitlang/mb-crypto
cd mb-crypto
moon test        # Run all tests
moon build       # Build all packages
```

### Testing

Each package includes comprehensive test suites with official test vectors:

```bash
cd packages/mb-chacha
moon test
```

## License

All packages are licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Acknowledgments

- Inspired by the [RustCrypto](https://github.com/RustCrypto) project
- Test vectors from IETF RFCs and NIST standards
- MoonBit community for feedback and contributions

## Security Reporting

If you discover a security vulnerability, please email security@moonbitlang.org with details. Do not open a public issue.

## Links

- [MoonBit Language](https://www.moonbitlang.org/)
- [Documentation](https://docs.moonbitlang.org/)
- [Community Discord](https://discord.gg/moonbit)

---

**Status Legend:**
- ✅ Complete
- 🚧 In Development
- 🔄 Planned (Next Phase)
- 📋 Future