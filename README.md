# Auto_Car_Parking and AutoMated Car Parking Slot Allocation
Automated Multilevel Car Parking 

An automated car multi level car parking is made, There are two implementations\n
  1. The Car Parking only denotes the vacancy of the car parking.
   the following files are used 
     * Cntrl.vhd 
     * CarParkTop.vhd
     * counter.vhd
     * Parking Package.pkg
  2. The car parking consist of and signal for entry of the car and exit of the car
      and the based upon the identifcation the vacancy of the parking slot and Displays the 
      which level the car entry has to go.
      and upon car exit the counter is updated.
      the files used are 
        * AutoCarPark.vhd
        * AutoCarPark_tb.vhd
        * Parking Package.pkg
 
 
  An automated slot allocation is presented here, Here as soon as the car enter the car_type is to be entered accepted car types included are Admin, Staff, Disabled, Visitor. The types can be change at Parking_packages file. 
   
   Final Working file contains the working code.
