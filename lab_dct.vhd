----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2022 11:07:29 AM
-- Design Name: 
-- Module Name: lab_dct - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity lab_dct is
  Port (clk: in std_logic;
        start_dct: inout std_logic;
        reset: in std_logic;
        ready_out_dct: inout std_logic:='0';
        adresb_mel : inout STD_LOGIC_VECTOR ( 3 downto 0 ):=(others=>'0'); 
        doutb_mel : inout STD_LOGIC_VECTOR ( 63 downto 0 );
        doutb_dct : inout STD_LOGIC_VECTOR ( 55 downto 0 ); 
        adresb_dct : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        finished_dct: inout std_logic
             
         );
end lab_dct;

architecture Behavioral of lab_dct is

component dct_wrapper is 
     port (
    A_0 : in STD_LOGIC_VECTOR ( 47 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    P_0 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    adresa_dct : in STD_LOGIC_VECTOR ( 3 downto 0 );
    adresb_dct : in STD_LOGIC_VECTOR ( 3 downto 0 );
    adresb_dct_coef : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    dina_dct : in STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_dct : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_dct_coef : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wea_dct : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component dct_wrapper;

signal A_0 : STD_LOGIC_VECTOR ( 47 downto 0 );           
signal B_0 : STD_LOGIC_VECTOR ( 7 downto 0 );            
signal P_0 :  STD_LOGIC_VECTOR ( 55 downto 0 );          
signal adresa_dct :  STD_LOGIC_VECTOR ( 3 downto 0 ):=(others=>'0');     
signal adresb_dct_coef :  STD_LOGIC_VECTOR ( 7 downto 0 ):=(others=>'0');                                                           
signal dina_dct :  STD_LOGIC_VECTOR ( 55 downto 0 );         
signal doutb_dct_coef :  STD_LOGIC_VECTOR ( 7 downto 0 );  
signal wea_dct :  STD_LOGIC_VECTOR ( 0 to 0 ):=(others=>'0');                
type states is(hazir,carp_topla,gonder);
signal state: states:= hazir;

  
signal count: integer range 0 to 3:=0;  
signal count1: integer range 0 to 3:=0;
signal count2: integer range 0 to 3:=0;
signal total: signed (55 downto 0):= (others=>'0'); 
signal samplesize: integer range 0 to 13:=0;
signal output_number: integer range 0 to 12:=0;  
signal dct_frame: integer range 0 to 62:=0;
signal birinci: std_logic_vector(55 downto 0);



begin   
    
    
 dct_bringer: component dct_wrapper 
    
     port map (
      A_0(47 downto 0) => A_0(47 downto 0),
      B_0(7 downto 0) => B_0(7 downto 0),
      P_0(55 downto 0) => P_0(55 downto 0),
      adresa_dct(3 downto 0) => adresa_dct(3 downto 0),
      adresb_dct(3 downto 0) => adresb_dct(3 downto 0),
      adresb_dct_coef(7 downto 0) => adresb_dct_coef(7 downto 0),
      
      clk => clk,
      dina_dct(55 downto 0) => dina_dct(55 downto 0),
      doutb_dct(55 downto 0) => doutb_dct(55 downto 0),
      doutb_dct_coef(7 downto 0) => doutb_dct_coef(7 downto 0),
      
      wea_dct(0) => wea_dct(0)
    );


process(clk, start_dct)
begin
if reset='1' then
    state<=hazir;
    count<=0;
    count1<=0;
    count2<=0;
    adresb_dct_coef<=(others=>'0');
    adresb_mel<=(others=>'0');
    adresa_dct<=(others=>'0');
    wea_dct<="0";
    total<=(others=>'0');
    output_number<=0;
    samplesize<=0;
    dina_dct<=(others=>'0');
    ready_out_dct<='0';
    dct_frame<=0;
    finished_dct<='0';
    
    
elsif start_dct='0' then
    count<=0;

elsif (falling_edge(clk) and start_dct='1' and reset='0') then
   
    case state is
        when hazir=>
            if count=3 then 
                count<=0;
                state<=carp_topla;
            else 
                count<=count+1;
                state<=hazir;
            end if;
        when carp_topla=>
         wea_dct<="1";
         if count1=0 then
            A_0<=doutb_mel(47 downto 0);
            B_0 <=doutb_dct_coef;
            count1<=count1+1;
            state<=carp_topla;
         elsif count1=1 then
            total<=total+ signed(P_0);
            count1<=0;
            state<=gonder;
        end if;
        when gonder=> 
         if output_number<12 then  
          if samplesize<12 then
            adresb_dct_coef<=adresb_dct_coef+1;
            adresb_mel<=adresb_mel+1;
            samplesize<=samplesize+1;
            state<=hazir;
          else
            if count2=0 then
                total<=shift_right(total,7);
                count2<=count2+1;
                state<=gonder;
            elsif count2=1 then
               
             dina_dct<= std_logic_vector(total);
             count2<=count2+1;
             state<=gonder;
          
                    
            else 
            
                adresb_mel<=(others=>'0');
                adresb_dct_coef<=adresb_dct_coef+1;
                total<=(others=>'0');
                adresa_dct<=adresa_dct+1;
                samplesize<=0;
                output_number<=output_number+1;
                count2<=0;
                state<=hazir;
            end if;
         end if;
         
         
         
        else
            if samplesize<12 then
            adresb_dct_coef<=adresb_dct_coef+1;
            adresb_mel<=adresb_mel+1;
            samplesize<=samplesize+1;
            state<=hazir;
          else
            if count2=0 then
                total<=shift_right(total,7);
                count2<=count2+1;
                state<=gonder;
            elsif count2=1 then
                dina_dct<= std_logic_vector(total);
                count2<=count2+1;
                state<=gonder;
            else 
              if dct_frame<62 then
                wea_dct<="0";
                adresb_mel<=(others=>'0');
                adresb_dct_coef<=(others=>'0');
                adresa_dct<=(others=>'0');
                total<=(others=>'0');
                samplesize<=0;
                output_number<=0;
                count2<=0;
                ready_out_dct<=not(ready_out_dct); 
                dct_frame<=dct_frame+1;
                state<=hazir;
             else 
                wea_dct<="0";
                adresb_mel<=(others=>'0');
                adresb_dct_coef<=(others=>'0');
                adresa_dct<=(others=>'0');
                total<=(others=>'0');
                samplesize<=0;
                output_number<=0;
                count2<=0;
                ready_out_dct<=not(ready_out_dct); 
                dct_frame<=0;
                finished_dct<='1';
                state<=hazir;
             end if;
             
                
            end if;
         end if;
            
      end if;
   end case;
 end if;
end process;  
        
        
  
         
         
            
                
                
                
            
           
            
            
            
            
            
         
            
       
            
            








end Behavioral;
