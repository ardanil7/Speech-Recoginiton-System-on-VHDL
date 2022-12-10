----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2022 06:22:14 PM
-- Design Name: 
-- Module Name: lab_mel - Behavioral
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



entity lab_mel is
      Port (start_mel: inout std_logic;
            clk: in std_logic;
            reset: in std_logic;
            ready_out_mel: inout std_logic:='0';
            adresb_fft : inout STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=> '0');
            doutb_fft : inout STD_LOGIC_VECTOR ( 31 downto 0 );
            adresb_mel : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            doutb_mel : inout STD_LOGIC_VECTOR ( 63 downto 0 );
            finished_mel: inout std_logic
             );
end lab_mel;


architecture Behavioral of lab_mel is


component mel_wrapper is
    port( A_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_11 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_12 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_10 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_11 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_12 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_6 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_7 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_8 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_9 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    P_0 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_1 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_10 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_11 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_12 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_2 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_3 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_4 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_5 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_6 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_7 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_8 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    P_9 : out STD_LOGIC_VECTOR ( 39 downto 0 );
    adresa_mel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    adresb_mel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    adresb_mel0 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel10 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel11 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel12 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel3 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel4 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel5 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel6 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel7 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel8 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    adresb_mel9 : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    clk : in STD_LOGIC;
    dina_mel : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb_mel : out STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb_mel0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel10 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel11 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel12 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel7 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel8 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb_mel9 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wea_mel : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component mel_wrapper;

 

signal A_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_10 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_11 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_12 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_2 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_3 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_4 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_5 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_6 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_7 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_8 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal A_9 :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal B_0 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_1 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_10 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_11 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_12 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_2 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_3 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_4 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_5 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_6 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_7 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_8 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal B_9 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal P_0 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_1 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_10 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_11 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_12 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_2 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_3 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_4 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_5 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_6 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_7 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_8 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal P_9 :  STD_LOGIC_VECTOR ( 39 downto 0 );
signal adresa_mel :  STD_LOGIC_VECTOR ( 3 downto 0 ):=(others=>'0');
signal adresb_mel0 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel1 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel10 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel11 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel12 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel2 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel3 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel4 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel5 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel6 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel7 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel8 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0');
signal adresb_mel9 :  STD_LOGIC_VECTOR ( 6 downto 0 ):=(others=>'0'); 
signal dina_mel :  STD_LOGIC_VECTOR ( 63 downto 0 );
signal doutb_mel0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel1 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel10 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel11 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel12 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel2 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel3 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel4 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel5 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel6 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel7 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel8 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal doutb_mel9 :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal wea_mel :  STD_LOGIC_VECTOR ( 0 to 0 ):="0";



signal count: integer range 0 to 3 :=0;
signal datanumber: integer range 0 to 127:=0; 


type states is(hazir,carp,topla,gonder);
signal state: states:= hazir;
signal count1: integer range 0 to 2 :=0;
signal count2: integer range 0 to 13 :=0;

signal P0 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P1 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P10 :  STD_LOGIC_VECTOR ( 63 downto 0 );     
signal P11 :  STD_LOGIC_VECTOR ( 63 downto 0 );     
signal P12 :  STD_LOGIC_VECTOR ( 63 downto 0 );     
signal P2 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P3 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P4 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P5 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P6 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P7 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P8 :  STD_LOGIC_VECTOR ( 63 downto 0 );      
signal P9 :  STD_LOGIC_VECTOR ( 63 downto 0 );      

signal bank1: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank2: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank3: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank4: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank5: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank6: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank7: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank8: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank9: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank10: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank11: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank12: std_logic_vector ( 63 downto 0 ):=(others=>'0');
signal bank13: std_logic_vector ( 63 downto 0 ):=(others=>'0');


signal mel_frame: integer range 0 to 62:=0;

begin

mel_wraperi: component mel_wrapper

port map (
      A_0(31 downto 0) => A_0(31 downto 0),
      A_1(31 downto 0) => A_1(31 downto 0),
      A_10(31 downto 0) => A_10(31 downto 0),
      A_11(31 downto 0) => A_11(31 downto 0),
      A_12(31 downto 0) => A_12(31 downto 0),
      A_2(31 downto 0) => A_2(31 downto 0),
      A_3(31 downto 0) => A_3(31 downto 0),
      A_4(31 downto 0) => A_4(31 downto 0),
      A_5(31 downto 0) => A_5(31 downto 0),
      A_6(31 downto 0) => A_6(31 downto 0),
      A_7(31 downto 0) => A_7(31 downto 0),
      A_8(31 downto 0) => A_8(31 downto 0),
      A_9(31 downto 0) => A_9(31 downto 0),
      B_0(7 downto 0) => B_0(7 downto 0),
      B_1(7 downto 0) => B_1(7 downto 0),
      B_10(7 downto 0) => B_10(7 downto 0),
      B_11(7 downto 0) => B_11(7 downto 0),
      B_12(7 downto 0) => B_12(7 downto 0),
      B_2(7 downto 0) => B_2(7 downto 0),
      B_3(7 downto 0) => B_3(7 downto 0),
      B_4(7 downto 0) => B_4(7 downto 0),
      B_5(7 downto 0) => B_5(7 downto 0),
      B_6(7 downto 0) => B_6(7 downto 0),
      B_7(7 downto 0) => B_7(7 downto 0),
      B_8(7 downto 0) => B_8(7 downto 0),
      B_9(7 downto 0) => B_9(7 downto 0),
      P_0(39 downto 0) => P_0(39 downto 0),
      P_1(39 downto 0) => P_1(39 downto 0),
      P_10(39 downto 0) => P_10(39 downto 0),
      P_11(39 downto 0) => P_11(39 downto 0),
      P_12(39 downto 0) => P_12(39 downto 0),
      P_2(39 downto 0) => P_2(39 downto 0),
      P_3(39 downto 0) => P_3(39 downto 0),
      P_4(39 downto 0) => P_4(39 downto 0),
      P_5(39 downto 0) => P_5(39 downto 0),
      P_6(39 downto 0) => P_6(39 downto 0),
      P_7(39 downto 0) => P_7(39 downto 0),
      P_8(39 downto 0) => P_8(39 downto 0),
      P_9(39 downto 0) => P_9(39 downto 0),
      adresa_mel(3 downto 0) => adresa_mel(3 downto 0),
      adresb_mel(3 downto 0) => adresb_mel(3 downto 0),
      adresb_mel0(6 downto 0) => adresb_mel0(6 downto 0),
      adresb_mel1(6 downto 0) => adresb_mel1(6 downto 0),
      adresb_mel10(6 downto 0) => adresb_mel10(6 downto 0),
      adresb_mel11(6 downto 0) => adresb_mel11(6 downto 0),
      adresb_mel12(6 downto 0) => adresb_mel12(6 downto 0),
      adresb_mel2(6 downto 0) => adresb_mel2(6 downto 0),
      adresb_mel3(6 downto 0) => adresb_mel3(6 downto 0),
      adresb_mel4(6 downto 0) => adresb_mel4(6 downto 0),
      adresb_mel5(6 downto 0) => adresb_mel5(6 downto 0),
      adresb_mel6(6 downto 0) => adresb_mel6(6 downto 0),
      adresb_mel7(6 downto 0) => adresb_mel7(6 downto 0),
      adresb_mel8(6 downto 0) => adresb_mel8(6 downto 0),
      adresb_mel9(6 downto 0) => adresb_mel9(6 downto 0),
      clk => clk,
      dina_mel(63 downto 0) => dina_mel(63 downto 0),
      doutb_mel(63 downto 0) => doutb_mel(63 downto 0),
      doutb_mel0(7 downto 0) => doutb_mel0(7 downto 0),
      doutb_mel1(7 downto 0) => doutb_mel1(7 downto 0),
      doutb_mel10(7 downto 0) => doutb_mel10(7 downto 0),
      doutb_mel11(7 downto 0) => doutb_mel11(7 downto 0),
      doutb_mel12(7 downto 0) => doutb_mel12(7 downto 0),
      doutb_mel2(7 downto 0) => doutb_mel2(7 downto 0),
      doutb_mel3(7 downto 0) => doutb_mel3(7 downto 0),
      doutb_mel4(7 downto 0) => doutb_mel4(7 downto 0),
      doutb_mel5(7 downto 0) => doutb_mel5(7 downto 0),
      doutb_mel6(7 downto 0) => doutb_mel6(7 downto 0),
      doutb_mel7(7 downto 0) => doutb_mel7(7 downto 0),
      doutb_mel8(7 downto 0) => doutb_mel8(7 downto 0),
      doutb_mel9(7 downto 0) => doutb_mel9(7 downto 0),
      wea_mel(0) => wea_mel(0)
    );




process(clk,start_mel,reset)
begin

if reset='1' then
    state<=hazir;
    count<=0;
    count1<=0;
    count2<=0;
    wea_mel<="0";
    bank1<=(others=>'0');
    bank2<=(others=>'0');
    bank3<=(others=>'0');
    bank4<=(others=>'0');
    bank5<=(others=>'0');
    bank6<=(others=>'0');
    bank7<=(others=>'0');
    bank8<=(others=>'0');
    bank9<=(others=>'0');
    bank10<=(others=>'0');
    bank11<=(others=>'0');
    bank12<=(others=>'0');
    bank13<=(others=>'0');
    datanumber<=0;
    adresa_mel<=(others=>'0');
    adresb_mel0<=(others=>'0');
    adresb_mel1<=(others=>'0');
    adresb_mel2<=(others=>'0');
    adresb_mel3<=(others=>'0');
    adresb_mel4<=(others=>'0');
    adresb_mel5<=(others=>'0');
    adresb_mel6<=(others=>'0');
    adresb_mel7<=(others=>'0');
    adresb_mel8<=(others=>'0');
    adresb_mel9<=(others=>'0');
    adresb_mel10<=(others=>'0');
    adresb_mel11<=(others=>'0');
    adresb_mel12<=(others=>'0');
    adresb_fft<=(others=>'0');
    dina_mel<=(others=>'0');
    finished_mel<='0';
    mel_frame<=0;
    ready_out_mel<='0';
    

    
elsif start_mel='0' then
    count<=0;
    
    
elsif falling_edge(clk) and start_mel='1' and reset='0' then 
     
    case state is
        when hazir=> 
            if count=3 then 
                state<=carp;
                 
                count<=0;
            else
                
                count<=count+1;
                state<=hazir;
            end if;
        when carp=>
            wea_mel<="1";
            A_0<=doutb_fft;
            A_1<=doutb_fft;
            A_2<=doutb_fft;
            A_3<=doutb_fft;
            A_4<=doutb_fft;
            A_5<=doutb_fft;
            A_6<=doutb_fft;
            A_7<=doutb_fft;
            A_8<=doutb_fft;
            A_9<=doutb_fft;
            A_10<=doutb_fft;
            A_11<=doutb_fft;
            A_12<=doutb_fft;
            B_0<=doutb_mel0;
            B_1<=doutb_mel1;
            B_2<=doutb_mel2;
            B_3<=doutb_mel3;
            B_4<=doutb_mel4;
            B_5<=doutb_mel5;
            B_6<=doutb_mel6;
            B_7<=doutb_mel7;
            B_8<=doutb_mel8;
            B_9<=doutb_mel9;
            B_10<=doutb_mel10;
            B_11<=doutb_mel11;
            B_12<=doutb_mel12;
            state<=topla;
        when topla=>    
            if count1=0 then
                P0<=("000000000000000000000000"&P_0);
                P1<=("000000000000000000000000"&P_1);
                P2<=("000000000000000000000000"&P_2);
                P3<=("000000000000000000000000"&P_3);
                P4<=("000000000000000000000000"&P_4);
                P5<=("000000000000000000000000"&P_5);
                P6<=("000000000000000000000000"&P_6);
                P7<=("000000000000000000000000"&P_7);
                P8<=("000000000000000000000000"&P_8);
                P9<=("000000000000000000000000"&P_9);
                P10<=("000000000000000000000000"&P_10);
                P11<=("000000000000000000000000"&P_11);
                P12<=("000000000000000000000000"&P_12);
                count1<=count1+1;
                state<=topla;
            elsif count1=1 then
                bank1<=bank1+P0;
                bank2<=bank2+P1;
                bank3<=bank3+P2;
                bank4<=bank4+P3;
                bank5<=bank5+P4;
                bank6<=bank6+P5;
                bank7<=bank7+P6;
                bank8<=bank8+P7;
                bank9<=bank9+P8;
                bank10<=bank10+P9;
                bank11<=bank11+P10;
                bank12<=bank12+P11;
                bank13<=bank13+P12;
                count1<=count1+1;
                state<=topla;
             else
                count1<=0;
                state<=gonder;
             end if;   
             when gonder=>
                if datanumber<127 then
                    
                    if count2=0 then
                        count2<=count2+1;
                        state<=gonder;
                        
                    else
                        adresb_fft<=adresb_fft+1;
                        adresb_mel0<=adresb_mel0+1;
                        adresb_mel1<=adresb_mel1+1;
                        adresb_mel2<=adresb_mel2+1;
                        adresb_mel3<=adresb_mel3+1;
                        adresb_mel4<=adresb_mel4+1;
                        adresb_mel5<=adresb_mel5+1;
                        adresb_mel6<=adresb_mel6+1;
                        adresb_mel7<=adresb_mel7+1;
                        adresb_mel8<=adresb_mel8+1;
                        adresb_mel9<=adresb_mel9+1;
                        adresb_mel10<=adresb_mel10+1;
                        adresb_mel11<=adresb_mel11+1;
                        adresb_mel12<=adresb_mel12+1;  
                        count2<=0;
                        datanumber<=datanumber+1;
                        state<=hazir; 
                     end if;
                     
                 else   
                        
                      if count2=0 then                                           
                          count2<=count2+1;                      
                          state<=gonder;  
                          adresa_mel<=(others=>'0');
                          dina_mel<=bank1;
                      elsif count2=1 then
                            dina_mel<=bank2;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;   
                      elsif count2=2 then
                            dina_mel<=bank3;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                            
                      elsif count2=3 then
                            dina_mel<=bank4;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;       
                            
                       elsif count2=4 then
                            dina_mel<=bank5;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;      
                        elsif count2=5 then
                            dina_mel<=bank6;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;     
                       elsif count2=6 then
                            dina_mel<=bank7;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;   
                       elsif count2=7 then
                            dina_mel<=bank8;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                       elsif count2=8 then
                            dina_mel<=bank9;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                       elsif count2=9 then
                            dina_mel<=bank10;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                        elsif count2=10 then
                            dina_mel<=bank11;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                       elsif count2=11 then
                            dina_mel<=bank12;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder; 
                       elsif count2=12 then
                            dina_mel<=bank13;
                            adresa_mel<=adresa_mel+1;
                            count2<=count2+1;
                            state<=gonder;         
                      else  
                          if mel_frame<62 then 
                            wea_mel<="0";                          
                            adresa_mel<=(others=>'0');     
                            adresb_fft<=(others=>'0');     
                            adresb_mel0<=(others=>'0');   
                            adresb_mel1<=(others=>'0');   
                            adresb_mel2<=(others=>'0');   
                            adresb_mel3<=(others=>'0');   
                            adresb_mel4<=(others=>'0');   
                            adresb_mel5<=(others=>'0');   
                            adresb_mel6<=(others=>'0');   
                            adresb_mel7<=(others=>'0');   
                            adresb_mel8<=(others=>'0');   
                            adresb_mel9<=(others=>'0');   
                            adresb_mel10<=(others=>'0'); 
                            adresb_mel11<=(others=>'0'); 
                            adresb_mel12<=(others=>'0'); 
                            bank1<=(others=>'0');
                            bank2<=(others=>'0');
                            bank3<=(others=>'0');
                            bank4<=(others=>'0');
                            bank5<=(others=>'0');
                            bank6<=(others=>'0');
                            bank7<=(others=>'0');
                            bank8<=(others=>'0');
                            bank9<=(others=>'0');
                            bank10<=(others=>'0');
                            bank11<=(others=>'0');
                            bank12<=(others=>'0');
                            bank13<=(others=>'0');
                            count2<=0;  
                            mel_frame<=mel_frame+1;
                            datanumber<=0;
                            ready_out_mel<=not(ready_out_mel);                
                            state<=hazir;  
                          else
                            wea_mel<="0";
                            adresa_mel<=(others=>'0');     
                            adresb_fft<=(others=>'0');     
                            adresb_mel0<=(others=>'0');   
                            adresb_mel1<=(others=>'0');   
                            adresb_mel2<=(others=>'0');   
                            adresb_mel3<=(others=>'0');   
                            adresb_mel4<=(others=>'0');   
                            adresb_mel5<=(others=>'0');   
                            adresb_mel6<=(others=>'0');   
                            adresb_mel7<=(others=>'0');   
                            adresb_mel8<=(others=>'0');   
                            adresb_mel9<=(others=>'0');   
                            adresb_mel10<=(others=>'0'); 
                            adresb_mel11<=(others=>'0'); 
                            adresb_mel12<=(others=>'0'); 
                            bank1<=(others=>'0');
                            bank2<=(others=>'0');
                            bank3<=(others=>'0');
                            bank4<=(others=>'0');
                            bank5<=(others=>'0');
                            bank6<=(others=>'0');
                            bank7<=(others=>'0');
                            bank8<=(others=>'0');
                            bank9<=(others=>'0');
                            bank10<=(others=>'0');
                            bank11<=(others=>'0');
                            bank12<=(others=>'0');
                            bank13<=(others=>'0');
                            count2<=0;  
                            mel_frame<=0;
                            finished_mel<='1';
                            datanumber<=0;
                            ready_out_mel<=not(ready_out_mel);                
                            state<=hazir;  
                          end if;
                                           
                       end if;  
                  end if;
               end case;
           end if;
     end process;








































end Behavioral;
