project(
        'mavlink-router',
        'cpp', 'c',
        version: '1',
        license: 'Apache 2.0',
        default_options: [
                'cpp_std=gnu++11',
        ],
)

add_project_arguments('-D_GNU_SOURCE', language: 'cpp')
add_project_arguments('-D_GNU_SOURCE', language: 'c')
add_project_arguments('-DPACKAGE_VERSION=' + meson.project_version(), language: 'cpp')
add_project_arguments('-DPACKAGE_VERSION=' + meson.project_version(), language: 'c')
cxx = meson.get_compiler('cpp')
cc = meson.get_compiler('c')
dep_math = cxx.find_library('m')

mavgen =  find_program('modules/mavlink/pymavlink/tools/mavgen.py')
gen_mavlink_headers = custom_target('gen_mavlink_headers',
                                    input : ['modules/mavlink/message_definitions/v1.0/ardupilotmega.xml'],
                                    output : ['mavlink'],
                                    command : [mavgen, '--lang', 'C', '--wire-protocol', '2.0', '-o', '@OUTPUT@', '@INPUT@'])

exe_mavlink_router = executable(
        'mavlink-routerd',
        ['autolog.cpp',
         'binlog.cpp',
         'conf_file.cpp',
         'endpoint.cpp',
         'log.cpp',
         'logendpoint.cpp',
         'main.cpp',
         'mainloop.cpp',
         'pollable.cpp',
         'timeout.cpp',
         'ulog.cpp',
         'util.c',
         'xtermios.cpp'],
        gen_mavlink_headers,
        include_directories: include_directories('mavlink', 'mavlink/ardupilotmega'),
        install: true,
)
