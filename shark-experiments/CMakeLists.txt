cmake_minimum_required(VERSION 3.18)

project(experiments)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Python3
set(Python_FIND_IMPLEMENTATIONS CPython PyPy)
find_package(Python3 COMPONENTS Interpreter Development NumPy REQUIRED)

# Find Shark
find_package(Shark REQUIRED HINTS ${SHARK_HINT_DIR})
include(${SHARK_USE_FILE})

# Find Boost
find_package(Boost REQUIRED COMPONENTS 
    regex system filesystem serialization)

## Project sources
set(EXP0_SRC
  src/experiment0.cpp
)
set(EXP1_SRC
  src/experiment1.cpp
)
set(EXP_MQO_SRC
  src/moq/experiments.cpp
  src/moq/benchmarks.cpp
)
set(FITNESS_SRC
  src/fitness.cpp
)

## Project executable
add_executable(experiment_0 ${EXP0_SRC})
target_link_libraries(experiment_0 PRIVATE ${SHARK_LIBRARIES})
target_link_libraries(experiment_0 PRIVATE ${Boost_LIBRARIES})
target_link_libraries(experiment_0 PRIVATE ${Python3_LIBRARIES})
target_include_directories(experiment_0 PRIVATE include)
target_include_directories(experiment_0 PRIVATE ${Python3_INCLUDE_DIRS})
target_include_directories(experiment_0 PRIVATE ${Python3_NumPy_INCLUDE_DIRS})

add_executable(experiment_1 ${EXP1_SRC})
target_link_libraries(experiment_1 PRIVATE ${SHARK_LIBRARIES})
target_link_libraries(experiment_1 PRIVATE ${Boost_LIBRARIES})
target_include_directories(experiment_1 PRIVATE include)

add_executable(experiment_moq ${EXP_MQO_SRC})
target_link_libraries(experiment_moq PRIVATE ${SHARK_LIBRARIES})
target_link_libraries(experiment_moq PRIVATE ${Boost_LIBRARIES})
target_include_directories(experiment_moq PRIVATE include)

add_executable(fitness ${FITNESS_SRC})
target_link_libraries(fitness PRIVATE ${SHARK_LIBRARIES})
target_link_libraries(fitness PRIVATE ${Boost_LIBRARIES})
target_include_directories(fitness PRIVATE include)
