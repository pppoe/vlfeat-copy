cmake_minimum_required (VERSION 2.8)

project (select-vlfeat)

add_definitions (-fPIC)
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DVL_DISABLE_AVX")

find_package(OpenCV)
IF(OpenCV_FOUND)
    message("...using OpenCV ${OpenCV_LIBS}")
    include_directories(${OpenCV_INCLUDE_DIR})
    set (LD_FLAGS ${OpenCV_LIBS})
ELSE()
    message("OpenCV is not found. You must install OpenCV")
    return()
ENDIF()

include_directories (./vlfeat/)
set (VlfeatSRCs
    vlfeat/vl//dsift.c
    vlfeat/vl//lbp.c
    vlfeat/vl//generic.c
    vlfeat/vl//host.c
    vlfeat/vl//random.c
    vlfeat/vl//mathop.c
    vlfeat/vl//imopv.c
    vlfeat/vl//imopv_sse2.c
    vlfeat/vl//mathop_sse2.c
    vlfeat/vl//sift.c
    vlfeat/vl//gmm.c
    vlfeat/vl//kmeans.c
    vlfeat/vl//kdtree.c
    vlfeat/vl//fisher.c
    vlfeat/vl//vlad.c
    vlfeat/vl//liop.c
    )
add_library(vl SHARED ${VlfeatSRCs})
set (LD_FLAGS ${LD_FLAGS} vl)

add_executable (test test.cpp)
target_link_libraries (test ${LD_FLAGS} ${OpenCV_LIBS})
