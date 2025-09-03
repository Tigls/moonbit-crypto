// getrandom.mbt - Common interface for secure random number generation
// Backend-specific implementations are in:
// - getrandom.native.mbt for native targets
// - getrandom.js.mbt for JavaScript targets  
// - getrandom.wasm.mbt for WebAssembly targets

// The actual implementation is provided by backend-specific files
// This file can contain shared types and utilities if needed