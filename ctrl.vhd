


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity ctrl is
      Port (
            start_adc: in std_logic;
            ready_out_adc: inout std_logic;
            adc_gelen: in std_logic;
            adc_clock: out std_logic:='0';
            chip_select: out std_logic:='1';--lab adc
            finished_fft: inout std_logic;
            
            
            
            an: out std_logic_vector(3 downto 0);
            seg:out  std_logic_vector(6 downto 0);
            
            finished_window: inout std_logic;
            finished_compare: inout std_logic;
            finished_dct: inout std_logic;
            
            
            recorder: in std_logic;
            number_recorded: in std_logic_vector(3 downto 0);
            ready_out_recording: inout std_logic_vector(9 downto 0);
            ready_out_sampling: inout std_logic;
            
            
            
            clk: in std_logic;--variables for all components
            reset: in std_logic
            
             );
end ctrl;

architecture Behavioral of ctrl is








component lab_adc is
port(adc_gelen: in std_logic;
      reset: in std_logic;
      adc_clock: out std_logic:='0';
      chip_select: out std_logic:='1';
      start_adc: in std_logic;
      clk: in std_logic;
      ready_out_adc:inout std_logic;
      adresb_adc : inout STD_LOGIC_VECTOR ( 13 downto 0 );
      doutb_adc : inout STD_LOGIC_VECTOR ( 31 downto 0 ));
  end component lab_adc;


component lab_window is
 Port ( clk: in std_logic;
         reset: in std_logic;
         start_window: inout std_logic;
         ready_out_window: inout std_logic;
         finished_window: inout std_logic;   
         adresb_window : inout STD_LOGIC_VECTOR ( 8 downto 0 );
         doutb_window : inout STD_LOGIC_VECTOR ( 19 downto 0 );
         adresb_adc : inout STD_LOGIC_VECTOR ( 13 downto 0 );
         doutb_adc : inout STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end component lab_window;


component lab_fft is

port (  clk: in std_logic;
        start_fft: inout std_logic;
        reset: in std_logic;
        ready_out_fft: inout  std_logic:='0';
        adresb_window : inout STD_LOGIC_VECTOR ( 8 downto 0 );
        doutb_window : inout STD_LOGIC_VECTOR ( 19 downto 0 );
        doutb_fft : inout STD_LOGIC_VECTOR ( 31 downto 0 );
        adresb_fft : inout  STD_LOGIC_VECTOR ( 6 downto 0 ):="0000000";
        finished_fft: inout std_logic
         );
end component lab_fft;



component lab_mel is

port (  start_mel: inout std_logic;
        clk: in std_logic;
        reset: in std_logic;
        ready_out_mel: inout std_logic;
        adresb_fft : inout STD_LOGIC_VECTOR ( 6 downto 0 );
        doutb_fft : inout STD_LOGIC_VECTOR ( 31 downto 0 );
        adresb_mel : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        doutb_mel : inout STD_LOGIC_VECTOR ( 63 downto 0 );
        finished_mel: inout std_logic
         );
end component lab_mel;



component lab_dct is
    Port (clk: in std_logic;
        start_dct: inout std_logic;
        reset: in std_logic;
        ready_out_dct: inout std_logic;
        adresb_mel : inout STD_LOGIC_VECTOR ( 3 downto 0 ); 
        doutb_mel : inout STD_LOGIC_VECTOR ( 63 downto 0 );
        doutb_dct : inout STD_LOGIC_VECTOR ( 55 downto 0 ); 
        adresb_dct : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        finished_dct: inout std_logic
             
         );
end component lab_dct;
        
component lab_compare is 
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
        seg: out std_logic_vector(6 downto 0);
        an: out std_logic_vector(3 downto 0)
         );
end component lab_compare;







signal adresb_dct: STD_LOGIC_VECTOR ( 3 downto 0 ):="0000";
signal doutb_dct :  STD_LOGIC_VECTOR ( 55 downto 0 );

signal adresb_mel :  STD_LOGIC_VECTOR ( 3 downto 0 ):="0000";
signal doutb_mel :  STD_LOGIC_VECTOR ( 63 downto 0 );

signal adresb_fft :  STD_LOGIC_VECTOR ( 6 downto 0 ):="0000000";
signal doutb_fft :  STD_LOGIC_VECTOR ( 31 downto 0 );

signal doutb_adc: std_logic_vector(31 downto 0);-- giden ram 
signal adresb_adc:  std_logic_vector(13 downto 0);-- giden ram

signal adresb_window :  STD_LOGIC_VECTOR ( 8 downto 0 );        
signal doutb_window :  STD_LOGIC_VECTOR ( 19 downto 0 );

signal start_window: std_logic;

signal start_fft: std_logic;
signal start_mel: std_logic;
signal start_dct: std_logic;
signal start_compare: std_logic;


signal ready_out_window:  std_logic; 
signal ready_out_fft: std_logic;
signal ready_out_mel: std_logic;
signal ready_out_dct: std_logic;
signal ready_out_compare: std_logic;

signal finished_mel: std_logic;

begin

        


            



adc_data_aktarimi: component lab_adc


port map( adc_gelen=> adc_gelen,
        adc_clock=> adc_clock,
        start_adc=> start_adc,
        reset=> reset,
        clk=> clk,
        chip_select=> chip_select,
        ready_out_adc=> ready_out_adc,
        adresb_adc(13 downto 0)=>adresb_adc(13 downto 0),
        doutb_adc( 31 downto 0 )=> doutb_adc( 31 downto 0 ));


windowing: component lab_window

port map( clk=> clk,
          reset=> reset,
          start_window=> start_window,
          ready_out_window=> ready_out_window,
          finished_window=> finished_window,
          adresb_adc(13 downto 0)=>adresb_adc (13 downto 0),
          doutb_adc( 31 downto 0 )=> doutb_adc( 31 downto 0),
          adresb_window(8 downto 0)=>  adresb_window(8 downto 0),
          doutb_window(19 downto 0)=> doutb_window(19 downto 0)
            
 );
            

fast_fourier: component lab_fft

port map( clk=> clk,
          reset=> reset,
          start_fft=> start_fft,
          ready_out_fft=> ready_out_fft,
          adresb_fft(6 downto 0)=>adresb_fft (6 downto 0),
          doutb_fft( 31 downto 0 )=> doutb_fft( 31 downto 0),
          adresb_window(8 downto 0)=>  adresb_window(8 downto 0),
          doutb_window(19 downto 0)=> doutb_window(19 downto 0),
          finished_fft=>finished_fft
            
 );   
   
  
  
mel_filters: component lab_mel
port map(clk=> clk,
          reset=> reset,
          start_mel=> start_mel,
          ready_out_mel=> ready_out_mel,
          adresb_fft(6 downto 0)=>adresb_fft (6 downto 0),
          doutb_fft( 31 downto 0 )=> doutb_fft( 31 downto 0),
          adresb_mel(3 downto 0)=>  adresb_mel(3 downto 0),
          doutb_mel(63 downto 0)=> doutb_mel(63 downto 0),
          finished_mel=>finished_mel
            
 );   
  
  
discrete_cosine: component lab_dct
port map(clk=> clk,
          reset=> reset,
          start_dct=> start_dct,
          ready_out_dct=> ready_out_dct,
          adresb_dct(3 downto 0)=>adresb_dct (3 downto 0),
          doutb_dct( 55 downto 0 )=> doutb_dct( 55 downto 0),
          adresb_mel(3 downto 0)=>  adresb_mel(3 downto 0),
          doutb_mel(63 downto 0)=> doutb_mel(63 downto 0),
          finished_dct=>finished_dct
            
 );   
 
 
 
 comparison: component lab_compare
port map(start_compare=>start_compare,
        ready_out_compare=> ready_out_compare,
        reset=> reset,
        clk=> clk,
        adresb_dct(3 downto 0)=>adresb_dct(3 downto 0),
        doutb_dct(55 downto 0)=> doutb_dct(55 downto 0),
        finished_compare=> finished_compare,
        recorder=> recorder,
        number_recorded( 3 downto 0)=> number_recorded( 3 downto 0),
        ready_out_recording(9 downto 0)=>ready_out_recording(9 downto 0), 
        ready_out_sampling=>ready_out_sampling,
        seg(6 downto 0)=> seg(6 downto 0),
        an(3 downto 0)=> an(3 downto 0)
 );   
 
 
  
  
  
  
     
process(clk)
begin
    
    if reset='1' then
       start_compare<='0';
               start_fft<='0';
               start_mel<='0';
               start_dct<='0';
               start_window<='0';
        
    elsif falling_edge(clk) then
        if ready_out_adc='1' then
            if finished_window= '0' and finished_fft='0' and finished_mel='0' and finished_dct='0' and finished_compare='0' then
            
                if ready_out_compare='0' and ready_out_window='0' and ready_out_fft='0' and ready_out_mel='0' and ready_out_dct='0' then
                
                    
                    start_window<='1';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='0';
                elsif ready_out_compare='0' and ready_out_window='1' and ready_out_fft='0' and ready_out_mel='0' and ready_out_dct='0' then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='1';
                    start_mel<='0';
                    start_dct<='0';
                elsif ready_out_compare='0' and ready_out_window='1' and ready_out_fft='1' and ready_out_mel='0' and ready_out_dct='0' then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='1';
                    start_dct<='0';
                elsif ready_out_compare='0' and ready_out_window='1' and ready_out_fft='1' and ready_out_mel='1' and ready_out_dct='0' then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='1';
                 elsif ready_out_compare='0' and ready_out_window='1' and ready_out_fft='1' and ready_out_mel='1' and ready_out_dct='1' then
                    start_window<='0';
                    start_compare<='1';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='0';
                 elsif ready_out_compare='1' and ready_out_window='1' and ready_out_fft='1'  and ready_out_mel='1' and ready_out_dct='1'then
                    start_window<='1';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='0';
                 elsif ready_out_compare='1' and ready_out_window='0' and ready_out_fft='1'  and ready_out_mel='1' and ready_out_dct='1' then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='1';
                    start_mel<='0';
                    start_dct<='0';
                    
                 elsif ready_out_compare='1' and ready_out_window='0' and ready_out_fft='0'  and ready_out_mel='1' and ready_out_dct='1'then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='1';
                    start_dct<='0';
                 elsif ready_out_compare='1' and ready_out_window='0' and ready_out_fft='0'  and ready_out_mel='0' and ready_out_dct='1'then
                    start_window<='0';
                    start_compare<='0';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='1';   
                 elsif ready_out_compare='1' and ready_out_window='0' and ready_out_fft='0'  and ready_out_mel='0' and ready_out_dct='0'then
                    start_window<='0';
                    start_compare<='1';
                    start_fft<='0';
                    start_mel<='0';
                    start_dct<='0'; 
                    
                  
               end if;
                
           elsif finished_window='1' and finished_fft='0' and finished_mel='0'  and finished_dct ='0' and finished_compare='0' then
               start_window<='0';
               start_compare<='0';
               start_fft<='1';
               start_mel<='0';
                start_dct<='0';
               
           elsif finished_window='1' and finished_fft='1' and finished_mel='0' and finished_dct ='0' and finished_compare='0' then
               start_window<='0';
               start_compare<='0';
               start_fft<='0';
               start_mel<='1';
               start_dct<='0';
           
           elsif finished_window='1' and finished_fft='1' and finished_mel='1' and finished_dct ='0' and finished_compare='0' then
               start_window<='0';
               start_compare<='0';
               start_fft<='0';
               start_mel<='0';
               start_dct<='1';
            elsif finished_window='1' and finished_fft='1' and finished_mel='1' and finished_dct ='1' and finished_compare='0' then
               start_window<='0';
               start_compare<='1';
               start_fft<='0';
               start_mel<='0';
               start_dct<='0';
               
           elsif finished_window='1' and finished_fft='1' and finished_mel='1' and finished_dct ='1' and finished_compare='1' then
               start_compare<='0';
               start_fft<='0';
               start_mel<='0';
               start_dct<='0';
               start_window<='0';
              
               
               
             
            end if;
       end if;      
                  
      end if;            
                    
            
end process;                    
                
                
            










end Behavioral;
