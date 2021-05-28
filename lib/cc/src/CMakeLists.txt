aux_source_directory(. SRC_DIR)
add_library(cc SHARED ${SRC_DIR})
SET_TARGET_PROPERTIES(cc PROPERTIES VERSION 0.1)
