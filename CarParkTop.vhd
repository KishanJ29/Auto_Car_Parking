---------------------------------------------------------------------------------------------------------------------------------
--											CODE VERSION v2
---------------------------------------------------------------------------------------------------------------------------------	
	library ieee;
			use ieee.std_logic_1164.all;
			use ieee.Numeric_std.all;
			use work.Parking_Package.all;
	entity CarParkTOP is 
		port( clk   :in std_logic;
			  rst   : in std_logic;
			  Car_Ent: in std_logic; 	  -- Car Entry in the parking lot 
			  Car_Ext: in std_logic;	  -- Car Exit from the parking lot
			  Status_Top: out std_logic -- vacancy status '0'-> Wait, '1'-> allow
			);
	end CarParkTOP;
			
architecture TOP of CarParkTOP is 
	component CarParkCntlr is 
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
	 end  component;

   component counter is 
  	 port( clk        : in std_logic;
		  rst         : in std_logic;
		  Admin_In    : in std_logic;
		  Staff_In    : in std_logic;
		  Visitor_In  : in std_logic;
		  DisAbel_In  : in std_logic;
		  Admin_Out   : in std_logic;
		  Staff_Out   : in std_logic;
		  Visitor_Out : in std_logic;
		  DisAbel_Out : in std_logic;
		  GatePerm    :out std_logic
		);
 	 end component;

 		signal GatePerm_Count_Ctrl : std_logic;
		signal Admin_In_Count_Ctrl : std_logic;
		signal Staff_In_Count_Ctrl :  std_logic;
		signal Visitor_In_Count_Ctrl :  std_logic;
		signal DisAbel_In_Count_Ctrl :  std_logic;
		signal Admin_Out_Ctrl_Count :  std_logic;
		signal Staff_Out_Ctrl_Count :  std_logic;
		signal Visitor_Out_Ctrl_Count :  std_logic; 
		signal DisAbel_Out_Ctrl_Count :  std_logic;
		signal Top_Car_Ent			: Car_type;
		signal Top_Car_Ext			: Car_type;
	begin 
		Controller: entity work.CarParkCntlr port map(clk => clk, rst => rst, car_in => Car_Ent, Car_out =>Car_Ext, 
						GatePerm => GatePerm_Count_Ctrl, Admin_In => Admin_In_Count_Ctrl, 
						Staff_In => Staff_In_Count_Ctrl, Visitor_Out => Visitor_Out_Ctrl_Count,
						DisAbel_Out => DisAbel_Out_Ctrl_Count, Status => Status_Top, Ent_car_type => Top_Car_Ent, Ext_car_type => Top_Car_Ext);
		
		 VacancyTracker: entity work.counter port map(clk => clk, rst => rst, Admin_In => Admin_In_Count_Ctrl,
						Staff_In => Staff_In_Count_Ctrl, Visitor_In => Visitor_In_Count_Ctrl, DisAbel_In => DisAbel_In_Count_Ctrl,
						Admin_Out => Admin_Out_Ctrl_Count, Staff_Out => Staff_Out_Ctrl_Count, Visitor_Out =>Visitor_Out_Ctrl_Count,
						DisAbel_Out => DisAbel_Out_Ctrl_Count,GatePerm => GatePerm_Count_Ctrl);
	
	end TOP;     			 	
							
							
						
------------------------------------------------------------------------------------------------------------------------------------
--												CODE v1.0
------------------------------------------------------------------------------------------------------------------------------------
--	library ieee;
--			use ieee.std_logic_1164.all;
--			use ieee.Numeric_std.all;
--	entity CarParkTOP is 
--		port( clk   :in std_logic;
--			  rst   : in std_logic;
--			  Car_Ent: in std_logic; 	  -- Car Entry in the parking lot 
--			  Car_Ext: in std_logic;	  -- Car Exit from the parking lot
--			  Status_Top: out std_logic -- vacancy status '0'-> Wait, '1'-> allow
--			);
--	end CarParkTOP;
--			
--architecture TOP of CarParkTOP is 
--	component CarParkCntlr is 
--		port( car_in : in std_logic;
--		      Car_out : in std_logic;
--			  GatePerm:in std_logic;
--		      Admin_In : out std_logic;
--			  Staff_In : out std_logic;
--			  Visitor_In : out std_logic;
--			  DisAbel_In : out std_logic;
--			  Admin_Out : out std_logic;
--			  Staff_Out : out std_logic;
--			  Visitor_Out : out std_logic;
--			  DisAbel_Out : out std_logic;
--		      Status  : out std_logic := '0'		
--			);
--	 end  component;
--
--   component counter is 
--  	 port(  clk : in std_logic;
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
--		);
-- 	 end component;
--
-- 		signal GatePerm_Count_Ctrl : std_logic;
--		signal Admin_In_Count_Ctrl : std_logic;
--		signal Staff_In_Count_Ctrl :  std_logic;
--		signal Visitor_In_Count_Ctrl :  std_logic;
--		signal DisAbel_In_Count_Ctrl :  std_logic;
--		signal Admin_Out_Ctrl_Count :  std_logic;
--		signal Staff_Out_Ctrl_Count :  std_logic;
--		signal Visitor_Out_Ctrl_Count :  std_logic; 
--		signal DisAbel_Out_Ctrl_Count :  std_logic;
--	begin 
--		Controller: entity work.CarParkCntlr port map( car_in => Car_Ent, Car_out =>Car_Ext, 
--						GatePerm => GatePerm_Count_Ctrl, Admin_In => Admin_In_Count_Ctrl, 
--						Staff_In => Staff_In_Count_Ctrl, Visitor_Out => Visitor_Out_Ctrl_Count,
--						DisAbel_Out => DisAbel_Out_Ctrl_Count, Status => Status_Top);
--		
--		 VacancyTracker: entity work.counter port map(clk => clk, rst => rst, Admin_In => Admin_In_Count_Ctrl,
--						Staff_In => Staff_In_Count_Ctrl, Visitor_In => Visitor_In_Count_Ctrl, DisAbel_In => DisAbel_In_Count_Ctrl,
--						Admin_Out => Admin_Out_Ctrl_Count, Staff_Out => Staff_Out_Ctrl_Count, Visitor_Out =>Visitor_Out_Ctrl_Count,
--						DisAbel_Out => DisAbel_Out_Ctrl_Count,GatePerm => GatePerm_Count_Ctrl);
--	
--	end TOP;     			 	
--							
------------------------------------------------------------------------------------------------------------------------------------