
FUNCTION_BLOCK DT_to_FIR
	
	VAR_INPUT
		SysOrder : INT;
		Num : ARRAY[0..4] OF REAL; (* Numerator coefficients b0..bM *)
		Den : ARRAY[0..5] OF REAL; (* Denominator coefficients a0..aN, with a0=1 *)
		TotalSamples : INT; (* Number of impulse response samples to generate, e.g. 400 *)
		StepHeight : REAL;
	END_VAR
	
	VAR_OUTPUT
		StepResponse : ARRAY[0..399] OF LREAL; (* Output FIR array (here fixed to 400 for MPC) *)
	END_VAR
	
	VAR
		k : INT;
		j : INT;
		TempNum : ARRAY[0..4] OF REAL;
		TempDen : ARRAY[0..5] OF REAL;
		den0 : REAL := 1;
		TempStep : LREAL;
	END_VAR
	
END_FUNCTION_BLOCK

FUNCTION_BLOCK SetTargetValue 
	
	VAR_INPUT
		TargetValue : REAL;
		CurrentVelocity : REAL;
		newSetValue : BOOL;
		
	END_VAR
	
	VAR_OUTPUT
		TargetValueArray : ARRAY[0..199] OF LREAL;
	END_VAR
	
	VAR
		i : INT;
		InitVelocity : REAL;
	END_VAR
	
END_FUNCTION_BLOCK


FUNCTION_BLOCK Counter
	
	VAR_INPUT
		BoolExpIn : BOOL;	
		NumTimesIn : REAL;
		newParam : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	
	VAR_OUTPUT
		BoolExpOut : BOOL;	
		NumTimesOut : REAL;
	END_VAR

END_FUNCTION_BLOCK

FUNCTION_BLOCK IDDone
	
	VAR_OUTPUT
		Done :  BOOL;
	END_VAR
	
	VAR_INPUT
		DoneIn : BOOL; (**)
	END_VAR
	
	VAR_IN_OUT
		DoneOnce : INT;
	END_VAR
	
END_FUNCTION_BLOCK