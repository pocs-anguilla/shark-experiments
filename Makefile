experiments: shark-experiments/CMakeLists.txt
	mkdir -p _experiments_build
	cd _cxx_experiments_build ;\
	set -x; cmake \
		-DCMAKE_TOOLCHAIN_FILE=../cmake/toolchains/clang-cxx17-libstdcxx.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		../shark-experiments
	make -C _experiments_build -j $(nproc)

shark_build: shark-mod/CMakeLists.txt
	mkdir -p _shark_build
	cd _shark_build ;\
	set -x; cmake \
		-DCMAKE_TOOLCHAIN_FILE=../cmake/toolchains/clang-cxx14-libstdcxx.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_EXAMPLES=OFF \
    	-DBUILD_DOCUMENTATION=OFF \
    	-DBUILD_SHARED_LIBS=ON \
		../shark-mod
	make -C _shark_build -j $(nproc)

shark_test: _shark_build
	make -C _shark_build -j $(nproc) test

shark_install: _shark_build
	make -C _shark_build install

clean:
	git clean -f -d -X