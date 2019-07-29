---------------------------------------------------------------------------------------------------------------------------------
--											CODE VERSION v2
---------------------------------------------------------------------------------------------------------------------------------
  library ieee;
	use ieee.std_logic_1164.all;
	use ieee.Numeric_std.all;
	use work.Parking_Package.all;
entity CarParkCntlr is 
	port( clk :in std_logic;
		  rst : in std_logic;
		  car_in : in std_logic;
	      Car_out : in std_logic;
		  GatePerm:in std_logic;
	      Admin_In : out std_logic;
		  Staff_In : out std_logic;
		  Visitor_In : out std_logic;
		  DisAbel_In : out std_logic;
		  Admin_Out : out std_logic;
		  Staff_Out : out std_logic;
		  Visitor_Out : out std_logic;
		  DisAbel_Out : out std_logic;
	      Status  : out std_logic := '0';
		  Ent_car_type : car_type;
	      Ext_car_type : car_type	
		);
end  CarParkCntlr;

	
architecture behave of CarParkCntlr is 
	 
	  begin
	ENT_EXT :process(rst,car_in,Ent_car_type,car_out,Ext_car_type,GatePerm )
		      begin 
				if(rst ='1')then 
					  Admin_In <= '0';
					  Staff_In <= '0';
					  Visitor_In <= '0';
					  DisAbel_In <= '0';
					  Admin_Out <= '0';
					  Staff_Out <= '0';
					  Visitor_Out <= '0';
					  DisAbel_Out <= '0';
				
				  elsif(rising_edge(car_in) )then		      
					  -- if( car_in = '1') then
				 	    case(Ent_car_type) is 
							when admin => 
					    		Admin_In <= '1';
					 
							when staff => 
					    		Staff_In <= '1';
					 
							when Visitor =>
					    		Visitor_In <= '1';
					 
							when DisAbel => 
		 	  		   			 DisAbel_In <= '1';
							
							when others => 
							   report "Identification Failled" severity error;
							end case;
						-- end if;
				     elsif( rising_edge(car_out)) then
						  case(Ext_car_type) is
							 when admin =>  
							        Admin_out <= '1';
							 
							 when staff => 
							    Staff_out <= '1';
							 
							 when Visitor =>
							    Visitor_out <= '1';
							 
							  when DisAbel => 
				 	  		    DisAbel_out <= '1';
							
							 when others => 
							   report "Identification Failled" severity error;
						end case;
				else
					Status <= '0';
				
			 end if;
					if(GatePerm = '0')then 
				Status <= '0';
			   else 
				Status <= '1';
			 end if;
		   end process ENT_EXT;
	
--	GateLock : process(GatePerm)
--			begin 
--			   if(GatePerm = '0')then 
--				Status <= '0';
--			   else 
--				Status <= '1';
--			 end if;
--		  end process GateLock;
		
		end behave;


------------------------------------------------------------------------------------------------------------------------------------
--												CODE VERSION v1
------------------------------------------------------------------------------------------------------------------------------------
--  library ieee;
--	use ieee.std_logic_1164.all;
--	use ieee.Numeric_std.all;
--
--entity CarParkCntlr is 
--	port( clk :in std_logic;
--		  rst : in std_logic;
--		  car_in : in std_logic;
--	      Car_out : in std_logic;
--		  GatePerm:in std_logic;
--	      Admin_In : out std_logic;
--		  Staff_In : out std_logic;
--		  Visitor_In : out std_logic;
--		  DisAbel_In : out std_logic;
--		  Admin_Out : out std_logic;
--		  Staff_Out : out std_logic;
--		  Visitor_Out : out std_logic;
--		  DisAbel_Out : out std_logic;
--	      Status  : out std_logic := '0'		
--		);
--end  CarParkCntlr;
--
--	
--architecture behave of CarParkCntlr is 
--	
--	  type car_type is (Admin, Staff, DisAbel, Visitor);
--	  
--	  signal Ent_car_type : car_type;
--	  signal Ext_car_type : car_type;
--	  begin
--	ENT_EXT :process(rst,clk,car_in, car_out, Ent_car_type,Ext_car_type)
--		      begin 
--				if(rst ='1')		      
--				   if( car_in = '1') then
--			 	    case(Ent_car_type) is 
--						when admin => 
--				    		Admin_In <= '1';
--				 
--						when staff => 
--				    		Staff_In <= '1';
--				 
--						when Visitor =>
--				    		Visitor_In <= '1';
--				 
--						when DisAbel => 
--	 	  		   			 DisAbel_In <= '1';
--						when others => 
--						   report "Identification Failled" severity error;
--						end case;
--			
--				     elsif( car_out = '1') then
--						  case(Ext_car_type) is
--							 when admin =>  
--							        Admin_out <= '1';
--							 
--							 when staff => 
--							    Staff_out <= '1';
--							 
--							 when Visitor =>
--							    Visitor_out <= '1';
--							 
--							  when DisAbel => 
--				 	  		    DisAbel_out <= '1';
--							
--							 when others => 
--							   report "Identification Failled" severity error;
--						end case;
--				else
--					Status <= '0';
--				end if;
--		   end process ENT_EXT;
--	
--	GateLock : process(GatePerm)
--			begin 
--			   if(GatePerm = '0')then 
--				status <= '0';
--			   else 
--				status <= '1';
--			 end if;
--		  end process GateLock;
--		
--		end behave;
------------------------------------------------------------------------------------------------------------------------------------	 		
	 		