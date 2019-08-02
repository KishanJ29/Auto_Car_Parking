 library ieee;
		use ieee.std_logic_1164.all;
		use ieee.Numeric_std.all;
		use work.Parking_Package.all;
	entity test is
	port( rst_tb, clk_tb, car_in, car_out: in std_logic;
			Ent_car_type, Ext_car_type : car_type;
			count       : out  counter;
			status     : out level
		) ;
	end entity;	


architecture behave of test is
	signal current_count        : counter;
    signal next_count           : counter;
    signal current_status       : level;
    signal next_status          : level;

begin

    SEQ : process(rst_tb, clk_tb)
    begin

        if (rst_tb = '1') then

            current_count   <= (others => 0);
            current_status  <= FULL;

        elsif (rising_edge(clk_tb)) then

            current_count   <= next_count;
            current_status  <= next_status;

        end if;

     end process;

     SLOT_CHECKING : process(current_count, current_status, car_in, car_out, Ent_car_type, Ext_car_type)
     begin

        next_count  <= current_count;
        next_status <= current_status;

        if (car_in = '1') then       

            case (Ent_car_type) is

                when Admin =>                                            
                    if (current_count(Admin) < 5) then                                                
                        next_status         <= L1a;                                                
                        next_count(Admin)   <= current_count(Admin) + 1;
                    else
                        next_status         <= FULL;                                 
                    end if;

                when Staff =>
                    if (current_count(Staff) < 5) then
                        next_status         <= L2a;
                        next_count(Staff)   <= current_count(Staff) + 1;
                    else
                        next_status         <= FULL; 
						                                                                      
                    end if;
				
				when Visitor =>
					if(current_count(Visitor) < 5) then
						next_status         <= L3a;
                        next_count(Visitor)   <= current_count(Visitor) + 1;
					elsif(current_count(Visitor) < 15) then
						next_status  		<=  L4;
						next_count(Visitor) <= current_count(Visitor) + 1;
					else
						next_status			<= FULL;
					end if;
				
				when DisAbel =>
					if(current_count(DisAbel) < 5) then
						next_status         <= L1b;
                        next_count(DisAbel)   <= current_count(DisAbel) + 1;
					elsif(current_count(DisAbel) < 10) then
						next_status  		<=  L2b;
						next_count(DisAbel) <= current_count(DisAbel) + 1;
					elsif(current_count(DisAbel) < 15) then
						next_status  		<=  L3b;
						next_count(DisAbel) <= current_count(DisAbel) + 1;
					else
						next_status			<= FULL;
					end if;
			 

				when others => next_status <= FULL;
            end case;

        elsif (car_out = '1') then    

            case (Ext_car_type) is  

                when Admin =>                                            
                    if (current_count(Admin) > 0) then
                        next_status         <= L1a;
                        next_count(Admin)   <= current_count(Admin) - 1;
                    else
                        next_count(Admin)   <= 0;                  
                    end if;

                when Staff =>
                    if (current_count(Staff) > 0) then
                        next_status         <= L2a;
                        next_count(Staff)   <= current_count(Staff) - 1;
                    else
                        next_count(Staff)   <= 0;  
                    end if;
				when Visitor =>
					if(current_count(Visitor) < 5) then
						next_status         <= L3a;
                        next_count(Visitor)   <= current_count(Visitor) - 1;
					elsif(current_count(Visitor) < 15) then
						next_status  		<=  L4;
						next_count(Visitor) <= current_count(Visitor) - 1;
					else
						next_status			<= FULL;
					end if;
				
				when DisAbel =>
					if(current_count(DisAbel) < 5) then
						next_status         <= L1b;
                        next_count(DisAbel)   <= current_count(DisAbel) - 1;
					elsif(current_count(DisAbel) < 10) then
						next_status  		<=  L2b;
						next_count(DisAbel) <= current_count(DisAbel) - 1;
					elsif(current_count(DisAbel) < 15) then
						next_status  		<=  L3b;
						next_count(DisAbel) <= current_count(DisAbel) - 1;
					else
						next_status			<= FULL;
					end if;
				when others => next_status <= FULL;
            end case;

         end if;

    end process;

    count   <= next_count   ;
    Status  <= next_status  ;
end behave;
