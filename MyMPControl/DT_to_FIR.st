
FUNCTION_BLOCK DT_to_FIR
	
	FOR j := 0 TO SysOrder - 1 DO
		TempNum[j] := Num[j];
	END_FOR
	
	FOR j := 0 TO SysOrder DO
		TempDen[j] := Den[j];
	END_FOR
	
	
	FOR j:=0 TO SysOrder - 1 DO
		Num[j] := TempNum[SysOrder-j-1];
	END_FOR
	
	FOR j := 0 TO SysOrder DO
		Den[j] := TempDen [SysOrder-j];
	END_FOR

	FOR k := 0 TO TotalSamples - 1 DO
		
		IF k = 0 THEN
			StepResponse[k] := 0;
		
		ELSIF k = 1 THEN
			StepResponse[k] := Num[0] - (Den[1] * StepResponse[k - 1]);
		
		ELSIF k = 2 THEN
			StepResponse[k] := Num[0] + Num[1] - (Den[1] * StepResponse[k - 1] + Den[2] * StepResponse[k -2]);
			
		ELSIF k = 3 THEN
			StepResponse[k] := Num[0] + Num[1] + Num[2] - (Den[1] * StepResponse[k - 1] + Den[2] * StepResponse[k -2] + Den[3] * StepResponse[k - 3]);
		
		ELSIF k = 4 THEN
			StepResponse[k] := Num[0] + Num[1] + Num[2] + Num[3] - (Den[1] * StepResponse[k - 1] + Den[2] * StepResponse[k -2] + Den[3] * StepResponse[k - 3] + Den[4] * StepResponse[k - 4]);
		
		ELSE 
			StepResponse[k] := Num[0] + Num[1] + Num[2] + Num[3] + Num[4] - (Den[1] * StepResponse[k - 1] + Den[2] * StepResponse[k -2] + Den[3] * StepResponse[k - 3] + Den[4] * StepResponse[k - 4] + Den[5] * StepResponse[k-5]);
		END_IF
			
	END_FOR
		
END_FUNCTION_BLOCK
