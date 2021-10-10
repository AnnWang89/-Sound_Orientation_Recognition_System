library ieee;
use IEEE.STD_LOGIC_1164.all;
entity final is 
port(	
    clk     :  in std_logic;
    rst     :  in std_logic;
	 Bottom  :  in std_logic;
	 X0,X1,X2,X3,X4,X10,X11,X12,X13,X14,X20,X21,X22,X23,X30,X31,X32,X33  : out std_logic;
	 Signal_Out : out std_logic_vector(2 downto 0);
	 find_direction : out std_logic_vector(2 downto 0);
	 Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7  : out std_logic;
    direction_in : in std_logic_vector(2 downto 0) 
);
end final;

architecture arc of final is
	 signal S0,S1,S2,S3,S4,S10,S11,S12,S13,S14,S20,S21,S22,S23,S30,S31,S32,S33 : std_logic;
	 signal Signal_Out_sin: std_logic_vector(2 downto 0) ;
	 signal find_direction_sin: std_logic_vector(2 downto 0) ;
	 signal A1,A2,A3: std_logic;
begin
	G0:PROCESS(CLK,RST)
	BEGIN
	IF RST='1' THEN
	S0<='1';S1<='0';S2<='0';S3<='0'; S4<='0';
	ELSIF CLK'EVENT AND CLK='1' THEN
		IF S0='1' AND Bottom='1'	THEN S0<='0'; S1<='1';
		ELSIF S1='1' AND A1='0' THEN S1<='0'; S2<='1';
		ELSIF S2='1' AND A2='0'THEN S2<='0'; S3<='1';
		ELSIF S3='1' AND A3='0'THEN S3<='0';S4<='1';
		ELSIF S4='1' AND Bottom='0' THEN S4<='0';S0<='1';
		END IF;
	END IF;
	END PROCESS G0;
	
	G1:PROCESS(CLK,RST)
	BEGIN
		IF RST='1' THEN
		S10<='1';S11<='0';S12<='0';S13<='0'; S14<='0';A1<='1';
		ELSIF CLK'EVENT AND CLK='1' THEN
			IF S1='1' THEN
				IF S10='1'	THEN S10<='0'; S11<='1';
				ELSIF S11='1' AND Bottom='1' THEN S11<='0'; S12<='1';
				ELSIF S12='1' THEN S12<='0'; S13<='1';
				ELSIF S13='1' THEN S13<='0';S14<='1';
				ELSIF S14='1' THEN S14<='0';A1<='0';
				END IF;
			END IF;
		END IF;
	END PROCESS G1;
	
	G2:PROCESS(CLK,RST)
	BEGIN
	
		IF RST='1'  THEN
		S20<='1';S21<='0';S22<='0';S23<='0'; A2<='1';
		ELSIF CLK'EVENT AND CLK='1'  THEN
			IF S2='1' THEN
				IF S20='1'	THEN S20<='0'; S21<='1';
				ELSIF S21='1'  THEN S21<='0'; S22<='1';
				ELSIF S22='1' THEN S22<='0'; S23<='1';
				ELSIF S23='1' THEN S23<='0';A2<='0';
				END IF;
			END IF;
		END IF;
	END PROCESS G2;
	
	G3:PROCESS(CLK,RST)
	BEGIN
		IF RST='1' THEN
		S30<='1';S31<='0';S32<='0';S33<='0'; A3<='1';
		ELSIF CLK'EVENT AND CLK='1' THEN
			IF S3='1' THEN
				IF S30='1'	THEN S30<='0'; S31<='1';
				ELSIF S31='1' THEN S31<='0'; S32<='1';
				ELSIF S32='1' THEN S32<='0'; S33<='1';
				ELSIF S33='1' THEN S33<='0';A3<='0';
				END IF;
			END IF;
		END IF;
	END PROCESS G3;
	
	 datapath:PROCESS(CLK,RST)
    BEGIN
		IF S0='1'  THEN Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
		ELSIF S1='1'	THEN 
			IF S11='1'  THEN Signal_Out_sin <= "000";
			ELSIF S13='1'  THEN Signal_Out_sin<=direction_in;
			ELSIF S14='1'  THEN Out0<='0';
			END IF ;
		ELSIF S2='1'	THEN 
			IF S20='1'  THEN  Out0<='0';
			ELSIF S21='1'  THEN find_direction_sin <= "000";
			ELSIF S22='1'  THEN find_direction_sin<=Signal_Out_sin;
			ELSIF S23='1'  THEN  Out0<='0';
			END IF ;
		ELSIF S3='1'	THEN 
			IF S30='1'  THEN Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
			ELSIF S31='1'  THEN Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
			ELSIF S32='1'  THEN 
				IF find_direction_sin ="000" THEN  Out0<='1';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="001" THEN  Out0<='0';Out1<='1';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="010" THEN  Out0<='0';Out1<='0';Out2<='1';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="011" THEN  Out0<='0';Out1<='0';Out2<='0';Out3<='1';Out4<='0';Out5<='0';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="100" THEN  Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='1';Out5<='0';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="101" THEN  Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='1';Out6<='0';Out7<='0';
				ELSIF find_direction_sin ="110" THEN  Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='1';Out7<='0';
				ELSIF find_direction_sin ="111" THEN  Out0<='0';Out1<='0';Out2<='0';Out3<='0';Out4<='0';Out5<='0';Out6<='0';Out7<='1';
				END IF;
			ELSIF S33='1'  THEN find_direction_sin <= "000";
			END IF ;
		END IF;
		find_direction<=find_direction_sin;Signal_Out<=Signal_Out_sin;

	END PROCESS datapath;
	X0<=S0;X1<=S1;X2<=S2;X3<=S3;X4<=S4;X10<=S10;X11<=S11;X12<=S12;X13<=S13;X14<=S14;X20<=S20;X21<=S21;X22<=S22;X23<=S23;X30<=S30;X31<=S31;X32<=S32;X33<=S33;
   
END arc;
