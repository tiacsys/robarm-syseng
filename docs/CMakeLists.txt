# Docs build of robarm-syseng: all documents of documents.yaml (own + upstream), through zdocs.
# Run from the workspace root: `curatrix docs robarm-syseng` (strict, output in build/robarm-syseng/docs/).
cmake_minimum_required(VERSION 3.20.0)
project(robarm-syseng-docs LANGUAGES)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE} COMPONENTS doc)
execute_process(COMMAND west topdir OUTPUT_VARIABLE WEST_TOPDIR
                OUTPUT_STRIP_TRAILING_WHITESPACE COMMAND_ERROR_IS_FATAL ANY)
include(${WEST_TOPDIR}/xdmod/cmake/xdmod-docs.cmake)
xdmod_docs(REGISTRY ${CMAKE_CURRENT_LIST_DIR}/documents.yaml PROJECT_BASE ${CMAKE_CURRENT_LIST_DIR}/..)
