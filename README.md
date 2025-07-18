# C++ Template Repository

A modern C++ template repository with CMake build system, integrated dependencies, and comprehensive tooling support.

## Features

- **Modern C++ Standards**: Built with C++23 support
- **CMake Build System**: Clean, modular build configuration
- **Integrated Dependencies**: Pre-configured popular C++ libraries
- **Development Tools**: Built-in code analysis with cppcheck
- **Flexible Build Options**: Debug, release, and examples modes
- **Submodule Management**: Automated dependency setup

## Dependencies

This template includes the following pre-configured libraries:

- **Prometheus C++**: Metrics and monitoring library
- **spdlog**: Fast C++ logging library  
- **glaze**: High-performance JSON library

## Prerequisites

- CMake 3.23.3 or higher
- C++23 compatible compiler (GCC/Clang)
- Git (for submodule management)
- cppcheck (for static analysis)

## Quick Start

### 1. Clone and Initialize

```bash
git clone https://github.com/ShinyMacadamia/cpp-template.git
cd cpp-template
make configure
```

The configure step will:
- Initialize and update all git submodules
- Build and install Prometheus C++ library
- Build spdlog library
- Build and install glaze library

### 2. Build the Project

```bash
# Debug build (default)
make build

# Release build
make build-release

# Build and run immediately
make run

# (Optionally) Make compile definitions for clangd
make definitions
```

### 3. Add Your Code

- Add source files to the `src/` directory
- Update the `target_sources()` section in `CMakeLists.txt` to include your files
- Add example programs in the `examples/` directory

## Build Targets

| Command | Description |
|---------|-------------|
| `make configure` | Set up dependencies and submodules |
| `make build` | Build in debug mode |
| `make build-release` | Build in release mode |
| `make run` | Build and run the executable |
| `make definitions` | Generate compile definitions |
| `make check` | Run static analysis with cppcheck |
| `make clean` | Remove build artifacts and dependencies |

## Project Structure

```
cpp-template/
├── src/                    # Source files
│   └── main.cpp           # Main entry point
├── examples/              # Example programs
├── vendor/                # Dependencies
│   ├── prometheus-cpp/    # Metrics library
│   ├── spdlog/           # Logging library
│   ├── glaze/            # JSON library
│   └── include/          # Installed headers
├── build/                # Build output (generated)
├── CMakeLists.txt        # Main CMake configuration
├── Makefile             # Build automation
├── build.sh             # Build script
└── configure            # Dependency setup script
```

## Adding New Dependencies

1. Add the dependency as a git submodule in the `vendor/` directory
2. Update the `configure` script to build and install the dependency
3. Modify `vendor/CMakeLists.txt` to link the new library
4. Update the `INCLUDE_LIBS` variable if needed

## Build Options

### Examples Mode
Build example programs instead of the main executable:
```bash
./build.sh examples
```

### Sanitizers
Enable AddressSanitizer by uncommenting the relevant lines in `CMakeLists.txt`:
```cmake
target_compile_options(cpp-template PRIVATE -fsanitize=address)
target_link_options(cpp-template PRIVATE -fsanitize=address)
```

## Development Workflow

1. **Initial Setup**: Run `make configure` once to set up all dependencies
2. **Development**: Use `make build` for quick debug builds
3. **Testing**: Use `make run` to build and test immediately
4. **Quality Assurance**: Use `make check` for static analysis
5. **Release**: Use `make build-release` for optimized builds

## Static Analysis

The template includes cppcheck configuration for comprehensive static analysis:

```bash
make check
```

This runs cppcheck with the following options:
- All checks enabled
- Inconclusive results included
- Missing system includes suppressed
- Inline suppressions allowed

