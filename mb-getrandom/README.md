# mb-getrandom

Secure random number generation for MoonBit, providing access to OS-level entropy sources.

## Features

- Cross-platform support (native and WASM)
- Direct access to OS entropy sources
- Safe and secure random byte generation

## Usage

```moonbit
use moonbitlang/mb-getrandom

fn main {
  match getrandom(32) {
    Ok(random_bytes) => println("Random bytes generated successfully")
    Err(e) => println("Error: \{e}")
  }
}
```

## Platform Support

- **Native**: Uses OS-provided randomness (/dev/urandom on Unix, BCryptGenRandom on Windows)
- **JavaScript**: Uses `crypto.getRandomValues()` in browsers and `crypto.randomBytes()` in Node.js
- **WASM**: Uses Web Crypto API via JavaScript host bindings

## WASM Deployment

When using the WASM backend, you need to provide JavaScript host bindings:

```javascript
import { createWasmImports } from './wasm_host.js';

const wasmBytes = /* your compiled WASM */;
const imports = createWasmImports();
const wasmModule = await WebAssembly.instantiate(wasmBytes, imports);
```

For testing WASM locally, use the JavaScript backend instead:
```bash
moon test --target js  # Use this for web environment testing
```

## License

Apache-2.0