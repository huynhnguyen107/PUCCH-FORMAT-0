onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib modulo_12_1_nomalize_opt

do {wave.do}

view wave
view structure
view signals

do {modulo_12_1_nomalize.udo}

run -all

quit -force
