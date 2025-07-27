
FUNCTION_BLOCK SetTargetValue

	InitVelocity := CurrentVelocity;
	
	IF newSetValue = TRUE THEN
		
		FOR i := 0 TO 199 DO
			TargetValueArray[i] := ((TargetValue - InitVelocity) * i)/200.0 + InitVelocity;
		END_FOR
		
		newSetValue := FALSE;
	END_IF
	
	
END_FUNCTION_BLOCK
