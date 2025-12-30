onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib correlation_cordic_0_opt

do {wave.do}

view wave
view structure
view signals

do {correlation_cordic_0.udo}

run -all

quit -force
