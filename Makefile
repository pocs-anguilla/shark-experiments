experiments: shark-experiments/CMakeLists.txt
	mkdir -p _experiments_build
	cd _cxx_experiments_build ;\
	set -x; cmake \
	    -DCMAKE_CXX_STANDARD=17 \
		-DCMAKE_TOOLCHAIN_FILE=../cmake/polly/clang-libstdcxx.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		../shark-experiments
	make -C _experiments_build -j $(nproc)

shark_build: shark-mod/CMakeLists.txt
	mkdir -p _shark_build
	mkdir -p artifacts
	cd _shark_build ;\
	set -x; cmake \
	    -DCMAKE_CXX_STANDARD=14 \
		-DCMAKE_TOOLCHAIN_FILE=../cmake/polly/clang-libstdcxx.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_EXAMPLES=OFF \
    	-DBUILD_DOCUMENTATION=OFF \
    	-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX=../artifacts \
		../shark-mod
	#make CCACHE_DIR=/workspaces/shark-experiments/_ccache \
	#	 CCACHE_COMPILERCHECK="content" \
	#	 -C _shark_build -j $(nproc)
	make -C _shark_build -j $(nproc)

shark_test: _shark_build
	make -C _shark_build -j $(nproc) test

shark_install: _shark_build
	make -C _shark_build install

clean:
	git clean -f -d -X
