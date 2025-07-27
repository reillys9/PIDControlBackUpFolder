PROGRAM _INIT
	
	MPControlParameters.MemMode := TRUE;
	MPControlParameters.CycleFactor := 1;
	MPControlParameters.NrDist := 0;
	MPControlParameters.PredictionHorizon := 50;
	MPControlParameters.ControlHorizon := 20;
	MPControlParameters.OutSamplesMerge := 1;
	MPControlParameters.OutOperatingPoint := 0.1;
	MPControlParameters.ActOperatingPoint := 0.0;
	MPControlParameters.WeightErrorExp := 0.0;
	MPControlParameters.WeightError := 1.0;
	MPControlParameters.OutMoveSuppression := 0.1;
	MPControlParameters.ActDeltaWeight := 0.2;
	MPControlParameters.FIRModel := FALSE;
	MPControlParameters.SoftConstraint := FALSE;
	MPControlParameters.OutDeltaMax := 1.0;
	MPControlParameters.OutDeltaMin := 0.0;
	MPControlParameters.OutMin := -0.5;
	MPControlParameters.OutMax := 0.5;
	MPControlParameters.PostCtrlDisable := FALSE;

	AxisParameters.Position := 10000000;
	AxisParameters.Velocity := 1000;
	AxisParameters.Acceleration := 1000;
	AxisParameters.Deceleration := 1000;
	AxisParameters.Jerk := 10000;

END_PROGRAM

