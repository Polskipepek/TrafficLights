onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+design_tf -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_tf xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_tf.udo}

run -all

endsim

quit -force
