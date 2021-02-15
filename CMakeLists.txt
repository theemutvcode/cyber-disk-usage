cmake_minimum_required(VERSION 3.19)

project(cyber-disk-usage)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(QT Core Gui Widgets Quick QuickControls2 LinguistTools)
find_package(Qt5 REQUIRED ${QT})

set(SRCS
    main.cpp
    backend.cpp
)

set(RESOURCES
    qml.qrc
)

add_executable(cyber-disk-usage ${SRCS} ${RESOURCES})
target_link_libraries(cyber-disk-usage
    Qt5::Core
    Qt5::Widgets
    Qt5::Quick
    Qt5::QuickControls2
)

file(GLOB TS_FILES translations/*.ts)
qt5_create_translation(QM_FILES ${TS_FILES})
add_custom_target(translations DEPENDS ${QM_FILES} SOURCES ${TS_FILES})
add_dependencies(${PROJECT_NAME} translations)

install(TARGETS cyber-disk-usage RUNTIME DESTINATION /usr/bin)

install(FILES
    cyber-disk-usage.desktop
    DESTINATION /usr/share/applications/
    COMPONENT Runtime
)

install(FILES ${QM_FILES} DESTINATION /usr/share/${PROJECT_NAME}/translations)
