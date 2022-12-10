----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 06:11:06 PM
-- Design Name: 
-- Module Name: lab_compare - Behavioral
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


entity lab_compare is
  Port (start_compare: inout std_logic;
        ready_out_compare: inout std_logic;
        reset: in std_logic;
        clk: in std_logic;
        adresb_dct: inout std_logic_vector(3 downto 0):=(others=>'0');
        doutb_dct: inout std_logic_vector( 55 downto 0); 
        finished_compare: inout std_logic;
        recorder: in std_logic;
        number_recorded: in std_logic_vector( 3 downto 0);
        ready_out_recording: inout std_logic_vector(9 downto 0); 
        ready_out_sampling: inout std_logic;
        
        seg: out std_logic_vector(6 downto 0):=(others=>'1');
        an: out std_logic_vector(3 downto 0)
         );
end lab_compare;

architecture Behavioral of lab_compare is


component compare_wrapper is
    port (
    adresa_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_1 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_2 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_3 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_4 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_7 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_8 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_9 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_compare : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresa_comperator: in std_logic_vector(9 downto 0);
    adresb_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_1 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_2 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_3 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_4 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_7 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_8 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_9 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_compare : in STD_LOGIC_VECTOR ( 9 downto 0 );
    adresb_comperator: in std_logic_vector(9 downto 0);
    
    clk : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_1 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_2 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_3 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_4 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_5 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_6 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_7 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_8 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_9 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_compare : in STD_LOGIC_VECTOR ( 55 downto 0 );
    dina_comperator : in STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_1 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_2 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_3 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_4 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_5 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_6 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_7 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_8 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_9 : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_compare : out STD_LOGIC_VECTOR ( 55 downto 0 );
    doutb_comperator : out STD_LOGIC_VECTOR ( 55 downto 0 );
    
    wea_compare : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    wea_compare2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end  component compare_wrapper;

 
signal adresa_0 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_1 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_2 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_3 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_4 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_5 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_6 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_7 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_8 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_9 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_compare :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresa_comperator :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_0 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_1 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_2 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_3 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_4 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_5 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_6 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_7 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_8 :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal adresb_9 :  STD_LOGIC_VECTOR ( 9 downto 0 );



signal dina_0 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_1 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_2 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_3 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_4 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_5 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_6 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_7 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_8 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_9 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_compare :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal dina_comperator :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_0 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_1 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_2 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_3 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_4 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_5 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_6 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_7 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_8 :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal doutb_9 :  STD_LOGIC_VECTOR ( 55 downto 0 );


signal wea_compare :  STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_0 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_1 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_2 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_3 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_4 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_5 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_6 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_7 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_8 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_9 : STD_LOGIC_VECTOR ( 0 to 0 );
signal wea_compare2 :  STD_LOGIC_VECTOR ( 0 to 0 );

signal adresb_compare :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal doutb_compare :  STD_LOGIC_VECTOR ( 55 downto 0 );
signal adresb_comperator :  STD_LOGIC_VECTOR ( 9 downto 0 );
signal doutb_comperator :  STD_LOGIC_VECTOR ( 55 downto 0 );



signal compare_frame: integer range 0 to 62:=0;
signal each_frame:integer range 0 to 12:=0;
signal count: integer range 0 to 3:=0;
signal count1: integer range 0 to 1:=0;


type states is(hazir,gonder);
signal state: states:= hazir;

type states1 is(hazir1,gonder1);
signal state1: states1:= hazir1;

signal count2: integer range 0 to 3:=0;
signal count3: integer range 0 to 1:=0;
signal convey_numbers: integer range 0 to 818:=0;
signal son_stage: std_logic;

signal count4: integer range 0 to 3:=0;
signal count5: integer range 0 to 2:=0;
signal cikis: std_logic:='0';
signal total0: signed(55 downto 0):=(others=>'0');
signal total1: signed(55 downto 0):=(others=>'0');
signal total2: signed(55 downto 0):=(others=>'0');
signal total3: signed(55 downto 0):=(others=>'0');
signal total4: signed(55 downto 0):=(others=>'0');
signal total5: signed(55 downto 0):=(others=>'0');
signal total6: signed(55 downto 0):=(others=>'0');
signal total7: signed(55 downto 0):=(others=>'0');
signal total8: signed(55 downto 0):=(others=>'0');
signal total9: signed(55 downto 0):=(others=>'0');
signal total: signed(55 downto 0):=(others=>'0');
signal convey_numbers2: integer range 0 to 818:=0;
type states2 is(hazir2,gonder2);
signal state2: states2:= hazir2;




begin

compare_bringer: component compare_wrapper
     port map (
      adresa_0(9 downto 0) => adresa_0(9 downto 0),
      adresa_1(9 downto 0) => adresa_1(9 downto 0),
      adresa_2(9 downto 0) => adresa_2(9 downto 0),
      adresa_3(9 downto 0) => adresa_3(9 downto 0),
      adresa_4(9 downto 0) => adresa_4(9 downto 0),
      adresa_5(9 downto 0) => adresa_5(9 downto 0),
      adresa_6(9 downto 0) => adresa_6(9 downto 0),
      adresa_7(9 downto 0) => adresa_7(9 downto 0),
      adresa_8(9 downto 0) => adresa_8(9 downto 0),
      adresa_9(9 downto 0) => adresa_9(9 downto 0),
      adresa_compare(9 downto 0) => adresa_compare(9 downto 0),
      adresa_comperator(9 downto 0) => adresa_comperator(9 downto 0),
      adresb_0(9 downto 0) => adresb_0(9 downto 0),
      adresb_1(9 downto 0) => adresb_1(9 downto 0),
      adresb_2(9 downto 0) => adresb_2(9 downto 0),
      adresb_3(9 downto 0) => adresb_3(9 downto 0),
      adresb_4(9 downto 0) => adresb_4(9 downto 0),
      adresb_5(9 downto 0) => adresb_5(9 downto 0),
      adresb_6(9 downto 0) => adresb_6(9 downto 0),
      adresb_7(9 downto 0) => adresb_7(9 downto 0),
      adresb_8(9 downto 0) => adresb_8(9 downto 0),
      adresb_9(9 downto 0) => adresb_9(9 downto 0),
      adresb_compare(9 downto 0) => adresb_compare(9 downto 0),
      adresb_comperator(9 downto 0) => adresb_comperator(9 downto 0),
      
      clk => clk,
      dina_0(55 downto 0) => dina_0(55 downto 0),
      dina_1(55 downto 0) => dina_1(55 downto 0),
      dina_2(55 downto 0) => dina_2(55 downto 0),
      dina_3(55 downto 0) => dina_3(55 downto 0),
      dina_4(55 downto 0) => dina_4(55 downto 0),
      dina_5(55 downto 0) => dina_5(55 downto 0),
      dina_6(55 downto 0) => dina_6(55 downto 0),
      dina_7(55 downto 0) => dina_7(55 downto 0),
      dina_8(55 downto 0) => dina_8(55 downto 0),
      dina_9(55 downto 0) => dina_9(55 downto 0),
      dina_compare(55 downto 0) => dina_compare(55 downto 0),
      dina_comperator(55 downto 0) => dina_comperator(55 downto 0),
      doutb_0(55 downto 0) => doutb_0(55 downto 0),
      doutb_1(55 downto 0) => doutb_1(55 downto 0),
      doutb_2(55 downto 0) => doutb_2(55 downto 0),
      doutb_3(55 downto 0) => doutb_3(55 downto 0),
      doutb_4(55 downto 0) => doutb_4(55 downto 0),
      doutb_5(55 downto 0) => doutb_5(55 downto 0),
      doutb_6(55 downto 0) => doutb_6(55 downto 0),
      doutb_7(55 downto 0) => doutb_7(55 downto 0),
      doutb_8(55 downto 0) => doutb_8(55 downto 0),
      doutb_9(55 downto 0) => doutb_9(55 downto 0),
      doutb_compare(55 downto 0) => doutb_compare(55 downto 0),
      doutb_comperator(55 downto 0) => doutb_comperator(55 downto 0),
      wea_0(0) => wea_0(0),
      wea_1(0) => wea_1(0),
      wea_2(0) => wea_2(0),
      wea_3(0) => wea_3(0),
      wea_4(0) => wea_4(0),
      wea_5(0) => wea_5(0),
      wea_6(0) => wea_6(0),
      wea_7(0) => wea_7(0),
      wea_8(0) => wea_8(0),
      wea_9(0) => wea_9(0),
      wea_compare2(0) => wea_compare2(0),
      wea_compare(0) => wea_compare(0)
    );


process(clk)
begin
    
  if reset='1' then
     count<=0;
     count1<=0;
     state<=hazir;
     ready_out_compare<='0';
     wea_compare<="0"; 
     adresa_compare<=(others=>'0');
     dina_compare<=(others=>'0');
     adresb_dct<=(others=>'0');
     finished_compare<='0';
     compare_frame<=0;
     each_frame<=0;
     
    elsif start_compare='0' then
        count<=0;
    
    elsif falling_edge(clk) and start_compare='1' and reset='0' then
        case state is
            when hazir=>
                if count<3 then
                    count<=count+1;
                    state<=hazir;
                else  
                    wea_compare<="1"; 
                    
                    count<=0;
                    state<=gonder; 
                end if;    
            when gonder=>   
                if compare_frame<62 then
                    if each_frame<12 then
                        if count1=0 then
                            dina_compare<=doutb_dct;
                            count1<=count1+1;
                            state<=gonder;
                        elsif count1=1 then
                            adresa_compare<=adresa_compare+1;
                            adresb_dct<=adresb_dct+1;
                            count1<=0;
                            each_frame<=each_frame+1;
                            state<=hazir;
                        end if;
                     
                     else
                            if count1=0 then
                            dina_compare<=doutb_dct;
                            count1<=count1+1;
                            state<=gonder;
                        elsif count1=1 then
                            adresa_compare<=adresa_compare+1;
                            adresb_dct<=(others=>'0');
                            count1<=0;
                            wea_compare<="0";
                            each_frame<=0;
                            ready_out_compare<=not(ready_out_compare);
                            compare_frame<=compare_frame+1;
                            state<=hazir;
                        end if;
                            
                     end if;
                            
                else
                        if each_frame<12 then
                        if count1=0 then
                            dina_compare<=doutb_dct;
                            count1<=count1+1;
                            state<=gonder;
                        elsif count1=1 then
                            adresa_compare<=adresa_compare+1;
                            adresb_dct<=adresb_dct+1;
                            count1<=0;
                            each_frame<=each_frame+1;
                            state<=hazir;
                        end if;
                     
                     else
                            if count1=0 then
                            dina_compare<=doutb_dct;
                            count1<=count1+1;
                            state<=gonder;
                        elsif count1=1 then
                            adresa_compare<=(others=>'0');
                            adresb_dct<=(others=>'0');
                            count1<=0;
                            wea_compare<="0";
                            each_frame<=0;
                            ready_out_compare<=not(ready_out_compare);
                            compare_frame<=0;
                            finished_compare<='1';
                            state<=hazir;
                        end if;
                            
                     end if;
                        
                   end if;     
                 end case;
              end if;
              
            end process;
                        
            
            
        
        
recording: process(clk)
begin
if reset='1' then
    count2<=0;
    count3<=0;
    wea_0<="0";
    wea_1<="0";
    wea_2<="0";
    wea_3<="0";
    wea_4<="0";
    wea_5<="0";
    wea_6<="0";
    wea_7<="0";
    wea_8<="0";
    wea_9<="0";
    son_stage<='0';
    wea_compare2<="0";
    convey_numbers<=0;    
    
elsif falling_edge(clk) and finished_compare='1'   and son_stage<='0'  then
    case state1 is
        when hazir1=>
            if count2<3 then
                    count2<=count2+1;
                    state1<=hazir1;
                else  
                    
                    count2<=0;
                    state1<=gonder1; 
                end if;  
                
         when gonder1=> 
     if recorder='1' then
       if convey_numbers<818 then
         if count3= 0 then
            if number_recorded="0000" then
                wea_0<="1";
                dina_0<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0001" then
                wea_1<="1";
                dina_1<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0010" then
                wea_2<="1";
                dina_2<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0011" then
                wea_3<="1";
                dina_3<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0100" then
                wea_4<="1";
                dina_4<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0101" then
                wea_5<="1";
                dina_5<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0110" then
                wea_6<="1";
                dina_6<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0111" then
                wea_7<="1";
                dina_7<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="1000" then
                wea_8<="1";
                dina_8<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="1001" then
                wea_9<="1";
                dina_9<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1; 
            end if;
            
            
            
         elsif count3=1 then
            if number_recorded="0000" then
                adresa_0<=adresa_0+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0001" then
                adresa_1<=adresa_1+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0010" then
               adresa_2<=adresa_2+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0011" then
                adresa_3<=adresa_3+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0100" then
                adresa_4<=adresa_4+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0101" then
                adresa_5<=adresa_5+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0110" then
                adresa_6<=adresa_6+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0111" then
                adresa_7<=adresa_7+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="1000" then
                adresa_8<=adresa_8+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="1001" then
                adresa_9<=adresa_9+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1; 
            end if;
          end if;
        else
            if count3= 0 then
            if number_recorded="0000" then
                dina_0<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0001" then
                dina_1<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0010" then
                dina_2<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0011" then
                dina_3<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0100" then
                dina_4<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0101" then
                dina_5<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0110" then
                dina_6<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="0111" then
                dina_7<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="1000" then
                dina_8<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            elsif number_recorded="1001" then
                dina_9<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1; 
            end if;
            
            
            
         elsif count3=1 then
            son_stage<='1';
            if number_recorded="0000" then
                adresa_0<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(0)<='1';
                wea_0<="0";
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0001" then
                adresa_1<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(1)<='1';
                wea_1<="0";
                
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0010" then
                adresa_2<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(2)<='1';
                wea_2<="0";
               
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0011" then
                adresa_3<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(3)<='1';
                wea_3<="0";
                convey_numbers<=0;
                
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0100" then
                adresa_4<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(4)<='1';
                wea_4<="0";
                convey_numbers<=0;
                
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0101" then
                adresa_5<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(5)<='1';
                wea_5<="0";
                convey_numbers<=0;
                
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0110" then
                adresa_6<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(6)<='1';
                wea_6<="0";
                convey_numbers<=0;
                
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="0111" then
                adresa_7<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(7)<='1';
                wea_7<="0";
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="1000" then
                adresa_8<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(8)<='1';
                wea_8<="0";
                
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1;
            elsif number_recorded="1001" then
                adresa_9<=(others=>'0');
                adresb_compare<=(others=>'0');
                ready_out_recording(9)<='1';
                wea_9<="0";
                
                convey_numbers<=0;
                count3<=0;
                state1<=hazir1; 
            end if;
          end if;
        end if;
       else
          if convey_numbers<818 then
            if count3=0 then
                wea_compare2<="1";
                dina_comperator<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            else
                adresa_comperator<=adresa_comperator+1;
                adresb_compare<=adresb_compare+1;
                convey_numbers<=convey_numbers+1;
                count3<=0;
                state1<=hazir1;
             end if;
          else 
            if count3=0 then
                dina_comperator<=doutb_compare;
                count3<=count3+1;
                state1<=gonder1;
            else
                son_stage<='1';
                adresa_comperator<=(others=>'0');
                adresb_compare<=(others=>'0');
                wea_compare2<="0";
                convey_numbers<=0;
                ready_out_sampling<='1';
                count3<=0;
                state1<=hazir1;
             end if;
            
           end if;
         end if;
                
            
             
       
       end case;
     end if;
    end process;  
       
                
          
an<="1110";   
       

 process(clk)
begin

if reset='1' then
    state2<=hazir2;
    total0<=(others=>'0');
    total1<=(others=>'0');
    total2<=(others=>'0');
    total3<=(others=>'0');
    total4<=(others=>'0');
    total5<=(others=>'0');
    total6<=(others=>'0');
    total7<=(others=>'0');
    total8<=(others=>'0');
    total9<=(others=>'0');
    convey_numbers2<=0;
    adresb_0<=(others=>'0');
    adresb_1<=(others=>'0');
    adresb_2<=(others=>'0');
    adresb_3<=(others=>'0');
    adresb_4<=(others=>'0');
    adresb_5<=(others=>'0');
    adresb_6<=(others=>'0');
    adresb_7<=(others=>'0');
    adresb_8<=(others=>'0');
    adresb_9<=(others=>'0');
    adresb_comperator<=(others=>'0');
    cikis<='0';
    count4<=0;
    count5<=0;
    
    
    
    
elsif falling_edge(clk)  and cikis='0' and ready_out_recording="1111111111" and ready_out_sampling='1' then  
    case state2 is
    when hazir2=>
        if count4<3 then
            count4<=count4+1;
            state2<=hazir2;
        else
            count4<=0;
            state2<=gonder2;
        end if;    
     when gonder2=>
        if convey_numbers2<818 then
            if count5=0 then
                total0<=total0+ abs(signed(doutb_comperator) - signed(doutb_0));
                total1<=total1+ abs(signed(doutb_comperator) - signed(doutb_1));
                total2<=total2+ abs(signed(doutb_comperator) - signed(doutb_2));
                total3<=total3+ abs(signed(doutb_comperator) - signed(doutb_3));
                total4<=total4+ abs(signed(doutb_comperator) - signed(doutb_4));
                total5<=total5+ abs(signed(doutb_comperator) - signed(doutb_5));
                total6<=total6+ abs(signed(doutb_comperator) - signed(doutb_6));
                total7<=total7+ abs(signed(doutb_comperator) - signed(doutb_7));
                total8<=total8+ abs(signed(doutb_comperator) - signed(doutb_8));
                total9<=total9+ abs(signed(doutb_comperator) - signed(doutb_9));
                count5<=count5+1;
                state2<=gonder2;
            else
                convey_numbers2<=convey_numbers2+1;
                adresb_0<=adresb_0+1;
                adresb_1<=adresb_1+1;
                adresb_2<=adresb_2+1;
                adresb_3<=adresb_3+1;
                adresb_4<=adresb_4+1;
                adresb_5<=adresb_5+1;
                adresb_6<=adresb_6+1;
                adresb_7<=adresb_7+1;
                adresb_8<=adresb_8+1;
                adresb_9<=adresb_9+1;
                adresb_comperator<=adresb_comperator+1;
                count5<=0;
                state2<=hazir2;
             end if;  
          else
             if count5=0 then
                total0<=total0+ abs(signed(doutb_comperator) - signed(doutb_0));
                total1<=total1+ abs(signed(doutb_comperator) - signed(doutb_1));
                total2<=total2+ abs(signed(doutb_comperator) - signed(doutb_2));
                total3<=total3+ abs(signed(doutb_comperator) - signed(doutb_3));
                total4<=total4+ abs(signed(doutb_comperator) - signed(doutb_4));
                total5<=total5+ abs(signed(doutb_comperator) - signed(doutb_5));
                total6<=total6+ abs(signed(doutb_comperator) - signed(doutb_6));
                total7<=total7+ abs(signed(doutb_comperator) - signed(doutb_7));
                total8<=total8+ abs(signed(doutb_comperator) - signed(doutb_8));
                total9<=total9+ abs(signed(doutb_comperator) - signed(doutb_9));
                count5<=count5+1;
                state2<=gonder2;
            else 
                convey_numbers2<=0;
                adresb_0<=(others=>'0');
                adresb_1<=(others=>'0');
                adresb_2<=(others=>'0');
                adresb_3<=(others=>'0');
                adresb_4<=(others=>'0');
                adresb_5<=(others=>'0');
                adresb_6<=(others=>'0');
                adresb_7<=(others=>'0');
                adresb_8<=(others=>'0');
                adresb_9<=(others=>'0');
                adresb_comperator<=(others=>'0');
                count5<=0;
                
               
               
                if total0<total1 and total0<total2 and total0<total3 and total0<total4 and total0<total5 and total0<total6 and total0<total7 and total0<total8 and total0<total9 then
                    seg<="1000000";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total1<total0 and total1<total2 and total1<total3 and total1<total4 and total1<total5 and total1<total6 and total1<total7 and total1<total8 and total1<total9 then
                    seg<="1111001";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total2<total1 and total2<total0 and total2<total3 and total2<total4 and total2<total5 and total2<total6 and total2<total7 and total2<total8 and total2<total9 then
                    seg<="0100100";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total3<total1 and total3<total2 and total3<total0 and total3<total4 and total3<total5 and total3<total6 and total3<total7 and total3<total8 and total3<total9 then
                    seg<="0110000";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total4<total1 and total4<total2 and total4<total3 and total4<total0 and total4<total5 and total4<total6 and total4<total7 and total4<total8 and total4<total9 then
                    seg<="0011001";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total5<total1 and total5<total2 and total5<total3 and total5<total4 and total5<total0 and total5<total6 and total5<total7 and total5<total8 and total5<total9 then
                    seg<="0010010";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total6<total1 and total6<total2 and total6<total3 and total6<total4 and total6<total5 and total6<total0 and total6<total7 and total6<total8 and total6<total9 then
                    seg<="0000010";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total7<total1 and total7<total2 and total7<total3 and total7<total4 and total7<total5 and total7<total0 and total7<total6 and total7<total8 and total7<total9 then
                    seg<="1111000";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total8<total1 and total8<total2 and total8<total3 and total8<total4 and total8<total5 and total8<total0 and total8<total7 and total8<total6 and total8<total9 then
                    seg<="0000000";
                    cikis<='1';    
                    state2<=hazir2;
                elsif total9<total1 and total9<total2 and total9<total3 and total9<total4 and total9<total5 and total9<total0 and total9<total7 and total9<total8 and total9<total6 then
                    seg<="0010000";
                    cikis<='1';    
                    state2<=hazir2;
                else
                    seg<="0001110";
                    cikis<='1';    
                    state2<=hazir2;
              end if;
             end if;
           end if;
         end case;
         end if;
        end process;           
        
    
    
    
    






































end Behavioral;
