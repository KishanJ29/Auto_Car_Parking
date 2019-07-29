vcom -work work -2008 -explicit -check_synthesis -quiet -source  D:/ModelSimProject/MultiLevelCarPArking/Cntrlr.vhd
vcom -work work -2008 -explicit -check_synthesis -stats=none D:/ModelSimProject/MultiLevelCarPArking/counter.vhd
vcom -work work -2002 -explicit -check_synthesis -stats=none D:/ModelSimProject/MultiLevelCarPArking/CarParkTop.vhd
vsim -gui work.carparktop
add wave -position end sim:/carparktop/*
add wave -position end  sim:/carparktop/Controller/Ent_car_type
add wave -position end  sim:/carparktop/Controller/Ext_car_type
add wave -position end  sim:/carparktop/VacancyTracker/CountAdmin
add wave -position end  sim:/carparktop/VacancyTracker/CountDisAbel
add wave -position end  sim:/carparktop/VacancyTracker/CountStaff
add wave -position end  sim:/carparktop/VacancyTracker/CountVisitor
force -freeze sim:/carparktop/clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/carparktop/rst 1 0
run
force -freeze sim:/carparktop/Car_Ent 1 0
force -freeze sim:/carparktop/rst 0 0
run
force -freeze sim:/carparktop/Controller/Ent_car_type Staff 0
run