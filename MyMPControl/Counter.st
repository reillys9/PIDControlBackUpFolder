
(* TODO: Add your comment here *)
FUNCTION_BLOCK Counter
	NumTimesIn := NumTimesIn + 1;
	IF NumTimesIn >= 1 THEN
		IF BoolExpIn = TRUE THEN
			BoolExpOut := FALSE;
		ELSE
			BoolExpOut := TRUE;
		END_IF
		NumTimesIn := 0;
	END_IF
	NumTimesOut := NumTimesIn;
END_FUNCTION_BLOCK
