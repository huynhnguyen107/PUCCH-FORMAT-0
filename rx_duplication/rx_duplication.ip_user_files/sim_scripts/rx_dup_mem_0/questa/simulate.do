onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rx_dup_mem_0_opt

do {wave.do}

view wave
view structure
view signals

do {rx_dup_mem_0.udo}

run -all

quit -force
