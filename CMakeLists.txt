cmake_minimum_required(VERSION 3.21)
project(SCHwash)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(SCHwash
        NewUnit_0.c
        NewUnit_0.cp
        schWash_main.c
        schWash_main.cp
        schWash_Main.h
        U_Hardware.h
        U_hardware_init.c
        U_hardware_init.cp
        U_hardware_init.h
        U_platform.c
        U_platform.cp
        U_platform.h
        UAPI_button.c
        UAPI_button.cp
        UAPI_button.h
        UAPI_motor.c
        UAPI_motor.cp
        UAPI_motor.h
        UHAL_74HC595.c
        UHAL_74HC595.cp
        UHAL_74HC595.h
        UHAL_pwm.c
        UHAL_pwm.cp
        UHAL_pwm.h
        UHAL_timer2.c
        UHAL_timer2.cp
        UHAL_timer2.h)
