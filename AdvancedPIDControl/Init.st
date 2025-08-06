

PROGRAM _INIT

		MpAxisBasic_0.Enable := FALSE;
		AxisParameters.Position := 10000.0;
		AxisParameters.Velocity := 10000.0;
		AxisParameters.Acceleration := 50000.0;
		AxisParameters.Deceleration := 50000.0;
	
		MC_ReadActualVelocity_0.Enable := FALSE;
		MC_ReadActualPosition_0.Enable := FALSE;
	
		MC_BR_TorqueControl_0.Jerk := 0;
		MC_BR_TorqueControl_0.Acceleration := 1000;
		MC_BR_TorqueControl_0.MaximumVelocity := 1000;
		MC_BR_TorqueControl_0.MinimumVelocity := -1000;
		MC_BR_TorqueControl_0.TorqueRamp := 1;
	
		previousTorque := 0;
	
		MTBasicsPID_0.MinOut := -0.3;
		MTBasicsPID_0.MaxOut := 0.3;
		MTBasicsPID_0.PIDParameters.Gain := 0.1;
		MTBasicsPID_0.PIDParameters.IntegrationTime := 0.1;
	
		MTIdentLSQ_0.SystemOrder := 2;
		MTIdentLSQ_0.StepHeight := 0.2;
		MTIdentLSQ_0.WeightingFactor := 0.99;
	
		MTAdvancedLoopShaping_0.ControllerType := 1;
		MTAdvancedLoopShaping_0.RiseTime := 10;
		MTAdvancedLoopShaping_0.OverShoot := 10;
	MTAdvancedLoopShaping_0.MinFrequency := 0;
	


	 
END_PROGRAM