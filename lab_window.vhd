
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity lab_window is
  Port ( clk: in std_logic;
         reset: in std_logic;
         start_window: inout std_logic;
         ready_out_window: inout std_logic;
         finished_window: inout std_logic;
        
         adresb_window : inout STD_LOGIC_VECTOR ( 8 downto 0 );
         doutb_window : inout STD_LOGIC_VECTOR ( 19 downto 0 );
         adresb_adc : inout STD_LOGIC_VECTOR ( 13 downto 0 ):=(others=> '0');
         doutb_adc : inout STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end lab_window;

architecture Behavioral of lab_window is

component window_design_wrapper is
port(
    wea_window : in STD_LOGIC_VECTOR ( 0 to 0 );
    adc_input : in STD_LOGIC_VECTOR ( 11 downto 0 );
    adresa_window : in STD_LOGIC_VECTOR ( 8 downto 0 );
    adresb_coef : in STD_LOGIC_VECTOR ( 8 downto 0 );
    adresb_window : in STD_LOGIC_VECTOR ( 8 downto 0 );
    
    clk : in STD_LOGIC;
    coef_input : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dina_window : in STD_LOGIC_VECTOR ( 19 downto 0 );
    doutb_coef : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_window : out STD_LOGIC_VECTOR ( 19 downto 0 );
    multiplied_output : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
end component window_design_wrapper;



signal wea_window :  STD_LOGIC_VECTOR ( 0 to 0 );
signal adc_input :  STD_LOGIC_VECTOR ( 11 downto 0 );
signal adresa_window :  STD_LOGIC_VECTOR ( 8 downto 0 );
signal adresb_coef :  STD_LOGIC_VECTOR ( 8 downto 0 ):=(others=> '0');
signal multiplied_output :  STD_LOGIC_VECTOR ( 19 downto 0 );
signal coef_input :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal dina_window :  STD_LOGIC_VECTOR ( 19 downto 0 );
signal doutb_coef :  STD_LOGIC_VECTOR ( 7 downto 0 );



signal frame_count: integer range 0 to 62:=0;
signal adc_loc_counter: integer range 0 to 511:=0;

type states is(hazir,calculations,write);
signal state: states:= hazir;
signal count: integer range 0 to 3:=0;

begin

block_design_window: component window_design_wrapper
     port map (
      wea_window(0) => wea_window(0),
      adc_input(11 downto 0) => adc_input(11 downto 0),
      adresa_window(8 downto 0) => adresa_window(8 downto 0),
      adresb_coef(8 downto 0) => adresb_coef(8 downto 0),
      adresb_window(8 downto 0) => adresb_window(8 downto 0),
      clk => clk,
      coef_input(7 downto 0) => coef_input(7 downto 0),
      dina_window(19 downto 0) => dina_window(19 downto 0),
      doutb_coef(7 downto 0) => doutb_coef(7 downto 0),
      doutb_window(19 downto 0) => doutb_window(19 downto 0),
      multiplied_output(19 downto 0) => multiplied_output(19 downto 0)
    );




process(clk, reset)
begin

if reset='1' then
 adresb_adc<=(others=> '0');
 adresb_coef<=(others=> '0');
 frame_count<=0;
 adc_loc_counter<=0;
 count<=0;
 adresa_window<=(others=> '0');
 dina_window<=(others=> '0');
 ready_out_window<='0';
 finished_window<='0';
 wea_window<= (others=> '0');
state<=hazir;

elsif start_window='0' then
    
    count<=0;

    
    
elsif falling_edge(clk) and start_window='1'   and reset='0' then
        
        case state is
        when hazir=>
             wea_window<= (others=> '0');
                    if count< 2 then
                        count<=count+1;
                        state<=hazir;
                    else
                        count<=0;
                        state<= calculations;
                    end if;
                
        when calculations=>
                wea_window<=(others=> '1');
                adc_input<=doutb_adc(11 downto 0);
                coef_input<= doutb_coef;
                state<= write;
                
        when write=> 
                
                adresa_window<= adresb_coef;
                dina_window<=multiplied_output;
                
                if frame_count < 62 then
                
                
                    if adc_loc_counter < 511 then
                        adc_loc_counter<=adc_loc_counter+1;
                        adresb_adc<=adresb_adc+1;
                        adresb_coef<=adresb_coef+1;
                        state<=hazir;
                    else 
                        wea_window<="0";
                        adc_loc_counter<=0;
                        frame_count<=frame_count+1;
                        adresb_coef<= (others=> '0');
                        adresb_adc<=adresb_adc-255;
                        ready_out_window<=not(ready_out_window);
                        state<=hazir;
                    end if;    
                 else
                        
                        
                    if adc_loc_counter < 511 then
                        adc_loc_counter<=adc_loc_counter+1;
                        adresb_adc<=adresb_adc+1;
                        adresb_coef<=adresb_coef+1;
                        state<=hazir;
                    else
                        wea_window<="0";
                        adc_loc_counter<=0;
                        adresb_adc<= (others=> '0');
                        adresb_coef <= (others=> '0');
                        frame_count<=0;
                        finished_window<='1';
                        ready_out_window<=not(ready_out_window);
                        state<=hazir;
                        
                     end if;
                 end if;
           end case;
       
           
       end if;
       
 end process;
                






end Behavioral;
