	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.Numeric_std.all;
		use work.Parking_Package.all;
entity AutoCarPark is 
	port(	
		  clk :in std_logic;
		  rst : in std_logic;
		  car_in : in std_logic;
	      Car_out : in std_logic;
		  Ent_car_type : car_type;
	      Ext_car_type : car_type;
		  Status : out level
		);
end AutoCarPark;
	
	architecture behave of AutoCarPark is 
		signal count : counter;
begin 		  
	SLOT_CHECKING: process(rst, clk) --, car_in, Ent_car_type, count, Ext_car_type, car_out)
					begin 
						if(rst= '1')then
							count <= (others => 0);
							Status <= FULL;
						elsif(rising_edge(clk))then
			---- CAR ENTRY ----
							if(	car_in )then
								   case(Ent_car_type)is 									 
									  	when Admin => 
											if(count(Admin) < 5) then
												Status <= L1a;
												count(Admin) <= count(Admin) +1;
											else
											  Status <= FULL;
											--  count(Admin) <= 0;				  
											end if;
									  
										when Staff =>
											 if(count(Staff) < 5) then
												Status <= L2a;
												count(Staff) <= count(Staff) + 1;
											else
											  Status <= FULL;
											--  count(Staff) <= 0;	
											end if;
									  
										when DisAbel =>
											if(count(Disabel) < 15) then
												 if(count(Disabel) < 5 )then
												 	Status <= L1b;
													count(Disabel) <= count(Disabel) + 1;
												 elsif(count(Disabel) < 10)then
													Status <= L2b;
													count(Disabel) <= count(Disabel) + 1;
												 else
													Status <= L3b;
													count(Disabel) <= count(Disabel) + 1;
												 end if;
											else
											  Status <= FULL;		
											--  count(Disabel) <= 0;		
											end if;
									 
									   	when Visitor =>
											if(count(Visitor) < 20) then
												 if(count(Visitor) < 5 )then
												 	Status <= L3a;
													count(Visitor) <= count(Visitor) + 1;
												 else
													Status <= L4;
													count(Visitor) <= count(Visitor) + 1;
												end if;
											else
											  Status <= FULL;	
											--  count(Visitor) <= 0;
											end if;
									 end case;							
			 ------ CAR EXIT ------
							elsif(car_out)then
	    						case(Ext_car_type)is 									 
									  when Admin => 
											if(count(Admin) >0) then
												Status <= L1a;
												count(Admin) <= count(Admin) - 1;
											else
											  
											  count(Admin)<= 0;				  
											end if;
									  
										when Staff =>
											 if(count(Staff) >0) then
												Status <= L2a;
												count(Staff) <= count(Staff) - 1;
											else
											  
											  count(Staff) <= 0;	
											end if;
									  
										when DisAbel =>
											if(count(Disabel) >0) then
												   if(count(Disabel)<5)then
													   Status <= L1b;
												   elsif(count(Disabel)<10)then
													   Status <= L2b;
												   else
													   Status <= L3b;	
													end if;										
											  count(Disabel) <= count(Disabel) - 1;
											else
											   count(Disabel) <= 0;		
											end if;
									 
									   	when Visitor =>
											if(count(Visitor) >0) then
												if(count(Visitor) < 5)then
													 Status <= L3a;
												else
													Status <= L4;
												end if;
											  count(Visitor) <= count(Visitor) - 1;
											else	
											  count(Visitor) <= 0;
											end if;
									 end case;
							end if;
					 end if;									
					end process SLOT_CHECKING;
			end behave;	
										 	
				
			