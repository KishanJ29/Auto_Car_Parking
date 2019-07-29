	library ieee;
			use ieee.std_logic_1164.all;
			use ieee.Numeric_std.all;
	package Parking_Package is
		
		 type car_type is (Admin, Staff, DisAbel, Visitor);
	
		 type level is (L1a, L1b, L2a, L2b, L3a, L3b, L4, FULL);
		
		 type counter is array (Visitor downto Admin) of integer range 0 to 22;

	end Parking_Package;

	package body Parking_Package is

	end Parking_Package;