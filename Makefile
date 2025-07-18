.PHONY: configure build build-release examples run definitions check clean

configure:
	@echo "Configuring the template project"
	./configure
build:
	@echo "Building the template project"
	./build.sh debug
build-release:
	@echo "Bulding the template project in release mode"
	./build.sh release
examples:
	@echo "Building examples" 
	./build.sh examples
run:
	./build.sh debug silent && cd build && ./cpp-template
definitions:
	./build.sh definitions
check:
	cppcheck --enable=all --inconclusive --suppress=missingIncludeSystem --suppress=missingInclude --inline-suppr -q src/
clean:
	@echo "Cleanup build and dependencies"
	@rm -rf build
	@find deps -mindepth 1 -maxdepth 1 \
	      ! -name cmake \
	      ! -name CMakeLists.txt \
	      -exec rm -rf {} +

