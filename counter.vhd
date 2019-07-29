-----------------------------------------------------------------------------------------------------------------------------------
----											CODE VERSION v1
-----------------------------------------------------------------------------------------------------------------------------------
--  library ieee;
--	use ieee.std_logic_1164.all;
--	use ieee.Numeric_std.all;
--
-- entity counter is 
--   port(  clk : in std_logic;
--		  rst : in std_logic;
--		  Admin_In : in std_logic;
--		  Staff_In : in std_logic;
--		  Visitor_In : in std_logic;
--		  DisAbel_In : in std_logic;
--		  Admin_Out : in std_logic;
--		  Staff_Out : in std_logic;
--		  Visitor_Out : in std_logic;
--		  DisAbel_Out : in std_logic;
--		  GatePerm:out std_logic
--	);
-- end counter;
--
--	architecture RTL of counter is
--		
--		signal count : integer range 0 to 20;
--		signal CountAdmin   : integer range 0 to 4;
--		signal CountDisAbel : integer  range 0 to 14;
--		signal CountStaff   : integer  range 0 to 4;
--		signal CountVisitor : integer  range 0 to 19;
--		 begin
--	      process(clk,rst)
--			begin
--			  if( rst = '1') then 
--				CountAdmin <= 0;
--				CountStaff <= 0;
--			  	CountVisitor <= 0;
--				CountDisAbel <= 0;D:/ModelSimProject/MultiLevelCarPArking/counter.vhd
--			  elsif(rising_edge(clk))then
--				if(Admin_In = '1') then
--					CountAdmin <= CountAdmin + 1;
--					  
--					
--				 elsif(DisAbel_In = '1') then
--					CountDisAbel <= CountDisAbel + 1;
--					   
--				
--				 elsif(Staff_In = '1') then
--					 CountStaff <= CountStaff + 1;
--					   
--				 
--				  elsif(Visitor_In = '1') then
--					 CountVisitor <= CountVisitor + 1;
--					   
--					
--				  elsif(Admin_Out = '1') then
--					CountAdmin <= CountAdmin - 1;
--
--				  elsif(DisAbel_Out = '1') then
--					CountDisAbel <= CountDisAbel - 1;
--				 
-- 				  elsif(Staff_Out = '1') then
--					 CountStaff <= CountStaff - 1;
--				  
--				  elsif(Visitor_Out = '1') then
--					 CountVisitor <= CountVisitor - 1;
--				  end if;	  
--	    		
--				end if;
---------------------------------------------------------
---- 				If block reseting the counter
---------------------------------------------------------			 
--				 if(CountAdmin >= 4) then
--					CountAdmin <= 0;
--				 elsif(CountDisAbel >= 14) then
--					CountDisAbel<= 0;
--				 elsif(CountStaff >= 14)then
--					CountStaff <=0;
--				 elsif(CountVisitor >= 14)then
--					CountVisitor <= 0;
--				
--				end if;
--				
--				GatePerm <= '0' when(CountAdmin >= 4)else '1';
--						
--				GatePerm <= '0'  when(CountDisAbel >= 14)else '1';
--							
--				GatePerm <= '0' when(CountStaff >= 14)else  '1';
--						
--				GatePerm <= '0' when(CountVisitor >= 14)else '1';
--			end process;
--		
---- 		GATE: 	GatePerm <= '0' when(CountAdmin >= 4)else '1';
----						
----				GatePerm <= '0'  when(CountDisAbel >= 14)else '1';
----							
----				GatePerm <= '0' when(CountStaff >= 14)else  '1';
----						
----				GatePerm <= '0' when(CountVisitor >= 14)else '1';
----						
--					
--		end RTl;	
			
------------------------------------------------------------------------------------------------------------------------------------
--												CODE v2.0
------------------------------------------------------------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.Numeric_std.all;

 entity counter is 
   port(  clk : in std_logic;
		  rst : in std_logic;
		  Admin_In : in std_logic;
		  Staff_In : in std_logic;
		  Visitor_In : in std_logic;
		  DisAbel_In : in std_logic;
		  Admin_Out : in std_logic;
		  Staff_Out : in std_logic;
		  Visitor_Out : in std_logic;
		  DisAbel_Out : in std_logic;
		  GatePerm:out std_logic
	);
 end counter;

	architecture RTL of counter is
		
		signal CountAdmin   : integer range 0 to 4;
		signal CountDisAbel : integer  range 0 to 14;
		signal CountStaff   : integer  range 0 to 4;
		signal CountVisitor : integer  range 0 to 19;
		 begin
	      process(clk,rst,CountAdmin, CountStaff, CountVisitor, CountDisAbel,Admin_In,DisAbel_In,Staff_In,Visitor_In,Admin_Out,
					DisAbel_Out,Staff_Out,Visitor_Out)
				begin
				  if( rst = '1') then 
					CountAdmin <= 0;
					CountStaff <= 0;
				  	CountVisitor <= 0;
					CountDisAbel <= 0;
				  elsif(rising_edge(clk))then
					if(Admin_In = '1') then
						CountAdmin <= CountAdmin + 1;
						  
						
					 elsif(DisAbel_In = '1') then
						CountDisAbel <= CountDisAbel + 1;
						   
					
					 elsif(Staff_In = '1') then
						 CountStaff <= CountStaff + 1;
						   
					 
					  elsif(Visitor_In = '1') then
						 CountVisitor <= CountVisitor + 1;
						   
						
					  elsif(Admin_Out = '1') then
						CountAdmin <= CountAdmin - 1;
	
					  elsif(DisAbel_Out = '1') then
						CountDisAbel <= CountDisAbel - 1;
					 
	 				  elsif(Staff_Out = '1') then
						 CountStaff <= CountStaff - 1;
					  
					  elsif(Visitor_Out = '1') then
						 CountVisitor <= CountVisitor - 1;
					     
		    		
					end if;
			
		
 		GATE: 	GatePerm <= '0'  when (CountAdmin < 5)else  '1';
						
				GatePerm <= '0'  when(CountDisAbel <= 14)else '1';
							
				GatePerm <= '0' when(CountStaff <= 14)else  '1';
						
				GatePerm <= '0' when(CountVisitor <= 14)else '1';
						
				GatePerm <= '0' when(CountAdmin <= 4)else '1';
				
			  end if;	

			end process;

			end RTl;	
			
------------------------------------------------------------------------------------------------------------------------------------