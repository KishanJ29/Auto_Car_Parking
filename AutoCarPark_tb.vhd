	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.Numeric_std.all;
		use work.Parking_Package.all;
	entity AutoCarPark_tb is 
		
	end AutoCarPark_tb;

architecture test of AutoCarPark_tb is 
	
	component AutoCarPark is 
		port(	
			  clk :in std_logic;
			  rst : in std_logic;
			  car_in : in std_logic;
		      Car_out : in std_logic;
			  Ent_car_type : car_type;
		      Ext_car_type : car_type;
			  Status : out level
			);
	end component;

	signal clk_tb : std_logic;
	signal rst_tb : std_logic;
	signal car_in_tb : std_logic;
	signal car_out_tb : std_logic;
	signal Ent_car_type_tb: car_type;
	signal Ext_car_type_tb : car_type;
	signal Status_tb : level;

	begin 
	tb_1:entity work.AutoCarPark port map( clk => clk_tb, rst => rst_tb, car_in => car_in_tb, car_out => car_out_tb,
							 Ent_car_type => Ent_car_type_tb, Ext_car_type => Ext_car_type_tb, Status => Status_tb);
			clock: process
					 begin						 
						clk_tb <= '1';
     	                     wait for 5 ns;
						clk_tb <= '0';
						 wait for 5 ns;
					end process clock;	
			 
			Reset: process
						begin
	                  Rst_tb <= '1';
	                  wait for 10 ns ;
	                  Rst_tb <='0';
	                  wait ;
								  
			end process Reset; 
			
			Input: process
					begin
					  car_in_tb <= '1';
					  wait for 10 ns;
					  car_out_tb<='0';
					  wait for 10 ns ;
					  Ent_car_type_tb<= Visitor;
					  wait for 10 ns;
 	                  car_in_tb <= '1';
					  wait for 10 ns;
					  Ent_car_type_tb <= Visitor;
					  wait for 10 ns;
					  car_out_tb <= '1';
					  wait for 10 ns;
					  Ext_car_type_tb <= Visitor;
					  wait for 10 ns;
					  Ent_car_type_tb <= Admin;
					  wait for 10 ns;
 	                  car_in_tb <= '1';
					  wait for 10 ns;
					  Ent_car_type_tb <= Admin;
					  wait for 10 ns;
					  car_out_tb <= '1';
					  wait for 10 ns;
					  Ext_car_type_tb <= Admin;
					  wait for 10 ns;
					  
				end process;		
			
		end test;
