#***************************************************************************
#                                  _   _ ____  _
#  Project                     ___| | | |  _ \| |
#                             / __| | | | |_) | |
#                            | (__| |_| |  _ <| |___
#                             \___|\___/|_| \_\_____|
#
# Copyright (C) 1998 - 2020, Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at https://curl.se/docs/copyright.html.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
###########################################################################

#[=======================================================================[.rst:
FindZstd
----------

Find the zstd library

Result Variables
^^^^^^^^^^^^^^^^

``Zstd_FOUND``
  System has zstd
``Zstd_INCLUDE_DIRS``
  The zstd include directories.
``Zstd_LIBRARIES``
  The libraries needed to use zstd
#]=======================================================================]


# modify by wyt, 2021.4.30
set (PC_Zstd_INCLUDE_DIRS "D:/sdk/cmake_build/vs2019/zstd-1.4.9/lib/")
if(CMAKE_CL_64)
    set (PC_Zstd_LIBRARY_DIRS "D:/sdk/cmake_build/vs2019/zstd-1.4.9/build/cmake/_build_/x64_Dynamic/lib/Release/")
else()
    set (PC_Zstd_LIBRARY_DIRS "D:/sdk/cmake_build/vs2019/zstd-1.4.9/build/cmake/_build_/Win32_Dynamic/lib/Release/")
ENDIF()
message("PC_Zstd_INCLUDE_DIRS: ${PC_Zstd_INCLUDE_DIRS}")
message("PC_Zstd_LIBRARY_DIRS: ${PC_Zstd_LIBRARY_DIRS}")


if(UNIX)
  find_package(PkgConfig QUIET)
  pkg_search_module(PC_Zstd libzstd)
endif()

find_path(Zstd_INCLUDE_DIR zstd.h
  HINTS
    ${PC_Zstd_INCLUDEDIR}
    ${PC_Zstd_INCLUDE_DIRS}
)

find_library(Zstd_LIBRARY NAMES zstd
  HINTS
    ${PC_Zstd_LIBDIR}
    ${PC_Zstd_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Zstd
  REQUIRED_VARS
    Zstd_LIBRARY
    Zstd_INCLUDE_DIR
)

if(Zstd_FOUND)
  set(Zstd_LIBRARIES    ${Zstd_LIBRARY})
  set(Zstd_INCLUDE_DIRS ${Zstd_INCLUDE_DIR})
endif()

mark_as_advanced(Zstd_INCLUDE_DIRS Zstd_LIBRARIES)
