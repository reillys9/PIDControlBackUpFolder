FUNCTION_BLOCK IDDone
	IF DoneIn = TRUE OR DoneOnce > 0 THEN
		Done := TRUE;
		DoneOnce := 1;
	ELSE
		Done := FALSE;
	END_IF
END_FUNCTION_BLOCK

