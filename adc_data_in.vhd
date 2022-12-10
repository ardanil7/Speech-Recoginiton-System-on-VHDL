library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;




entity lab_adc is
  Port (
      adc_gelen: in std_logic;
      reset: in std_logic;
      adc_clock: out std_logic:='0';
      chip_select: out std_logic:='1';
      start_adc: in std_logic;
      clk: in std_logic;
      ready_out_adc:inout std_logic:='0';
      adresb_adc : inout STD_LOGIC_VECTOR ( 13 downto 0 );
      doutb_adc : inout STD_LOGIC_VECTOR ( 31 downto 0 )
     
      
      );
      
end lab_adc;

architecture Behavioral of lab_adc is

component ram_adc_wrapper_wrapper is
  port (
    adresa : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adresb : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk: in std_logic;
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component ram_adc_wrapper_wrapper;


    -- data yazmayı enable etmek
signal onikibucuk: std_logic_vector(2 downto 0):="001";     
signal gelendata: std_logic_vector(11 downto 0);
signal beklet: std_logic_vector(31 downto 0);
signal beklet_unsigned: unsigned(31 downto 0);
signal beklet1: std_logic_vector(31 downto 0);
type states is(hazir,dogrubyte);
signal state: states:= hazir;
signal count: integer range 0 to 7:=0;
signal count3: integer range 0 to 6400:=0;
signal count4: std_logic_vector(4 downto 0):=(others=> '0');
signal ikinci: integer range 0 to 15:=15;   -- 15 bit olayı
signal count2: integer range 0 to 71:=0;
signal bitis: integer range 0 to 16384:=0;

signal adresa:  std_logic_vector( 13 downto 0 );
signal dina :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal  wea :  STD_LOGIC_VECTOR ( 0 to 0 ):="0";



begin




blockdesign:component ram_adc_wrapper_wrapper
port map 
  (   adresa(13 downto 0)=>adresa(13 downto 0),
      adresb(13 downto 0) => adresb_adc(13 downto 0),
      clk=>clk,
      dina(31 downto 0) => dina(31 downto 0),
      doutb(31 downto 0) => doutb_adc(31 downto 0),
      wea(0) => wea(0)
    );
    

  
process(clk,reset,onikibucuk,ready_out_adc,start_adc)
begin
    
    if reset= '1'    then 
        onikibucuk<="000";
        adc_clock<=onikibucuk(2);   
    elsif (falling_edge(clk)) and start_adc='1' and reset='0' and ready_out_adc='0' then
        onikibucuk<=onikibucuk+1;
         adc_clock<=onikibucuk(2);
    end if;    
       
        
end process;


datacek: process(clk, reset,start_adc,ready_out_adc)
begin   
    
    if reset='1' then
    chip_select<='1';
    count<=0;
    gelendata<=(others=> '0');
    beklet<=(others=> '0');
    ikinci<=0;
    count2<=0;
    state<=hazir;
    elsif falling_edge(clk)and start_adc='1' and reset='0' and ready_out_adc='0' then
    
      case state is
      when hazir=>  
      
        if ikinci=15 then 

            if count=4 then
                count<=count+1;
                chip_select<='0';
                state<=hazir;
                
            elsif count<7 then
                 count<=count+1;
                 state<=hazir;
                
            else
                count<=0;
                ikinci<=ikinci-1;
                state<=hazir;
             end if;
             
       
        elsif ikinci=14 or ikinci =13 or ikinci= 12 then
            
             if count=7 then
                
                ikinci<=ikinci-1; 
                count<=0;
                state<= hazir;
                
             else 
                count<=count+1;
                state<=hazir;
             end if;
             
        elsif 0<ikinci and ikinci<12 then
        
            if count=7 then
                gelendata(ikinci)<=adc_gelen;
                ikinci<=ikinci-1; 
                count<=0;
                state<= hazir;
                
             else 
                count<=count+1;
                state<=hazir;
                
             end if;
         
         else
              
              if count=7 then
                gelendata(ikinci)<=adc_gelen;
                count<=0;
                ikinci<=15;
                state<=dogrubyte;
                
               
              else   

                count<=count+1;
                 state<=hazir; 

                
              end if;     
        
            
                
         end if;
      
     
            when dogrubyte => 
            
            beklet1<=("00000000000000000000"& gelendata(11 downto 0));
            
            if count2=1 then
                if count4="00000" then
                    beklet_unsigned<=(others=> '0');
                    count2<=count2+1;
                    state<=dogrubyte;
                else
                     beklet_unsigned<=beklet_unsigned;
                     count2<=count2+1;
                    state<=dogrubyte;
                end if;
            
            
            elsif count2=2 then
                beklet_unsigned<=beklet_unsigned+unsigned(beklet1);
                count2<=count2+1;
                state<=dogrubyte;
            
            
            elsif count2=3 then 
                if count4="11111" then
                    beklet_unsigned<=shift_right(beklet_unsigned,5);
                    count2<=count2+1;
                    state<=dogrubyte;
                else
                    count2<=count2+1;
                    state<=dogrubyte;
                end if;
             
             
             elsif count2=10 then
                    if count4="11111" then
                    beklet<=std_logic_vector(beklet_unsigned);
                    count2<=count2+1;
                    state<=dogrubyte;
                else
                    count2<=count2+1;
                    state<=dogrubyte;
                end if;
                
            elsif count2= 11 then
            if count4="11111" then
                    beklet<=beklet-2048;
                    count2<=count2+1;
                    state<=dogrubyte;
                else
                    count2<=count2+1;
                    state<=dogrubyte;
                end if;
            
                
            elsif count2=31 then
                chip_select<='1';
                count2<=count2+1;
                state<=dogrubyte;
                
           elsif   count2< 71 then
                count2<=count2+1;
                state<=dogrubyte;
            
            else
                count4<=count4+1;
                count2<=0;
                state<= hazir;  
            
            
            
            
            
            
            
             end if; 
            
       when others=>
       state<= hazir;
       end case;
       end if;
  end process;
  
  
  
  process(clk, beklet,reset,start_adc,ready_out_adc)
  begin
  
  if reset='1' then
 
    count3<=0;
    adresa<=(others=> '0');
    dina<= (others=> '0');
    wea<=(others=> '0');
    ready_out_adc<='0';
    bitis<=0;
    
  elsif falling_edge(clk)and reset='0' and ready_out_adc='0' and start_adc='1' then
  
  
     
       if count3 <6399 then
       count3<=count3+1;
       wea<= (others=> '0');
        
    
        
    
        else 
         wea<= (others=> '1');
            if bitis=0 then
    
    
                 dina<=beklet;
                 adresa<=(others=> '0');
            else
                 dina<=beklet;
                 adresa<=adresa+1;
            end if;
    
            count3<=0;
            if bitis<16383 then
                bitis<=bitis+1;
            else
                ready_out_adc<='1';
                bitis<=0;
            end if;
   
   
    
   
    
    
    
    
    
    end if;
   
    end if;
    end process;
    end Behavioral;