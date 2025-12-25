onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib alpha_modulo_12_0_opt

do {wave.do}

view wave
view structure
view signals

do {alpha_modulo_12_0.udo}

run -all

quit -force
