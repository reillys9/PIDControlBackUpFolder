

PROGRAM _INIT
	MpAxisBasic_0.Enable := FALSE;
	AxisParameters.Position := 100.0;
	AxisParameters.Velocity := 100.0;
	AxisParameters.Acceleration := 100.0;
	AxisParameters.Deceleration := 100.0;
	
	MC_ReadActualVelocity_0.Enable := FALSE;
	MC_ReadActualPosition_0.Enable := FALSE;
	
	MC_BR_TorqueControl_0.Jerk := 0;
	MC_BR_TorqueControl_0.Acceleration := 100;
	MC_BR_TorqueControl_0.MaximumVelocity := 100;
	MC_BR_TorqueControl_0.MinimumVelocity := -100;
	MC_BR_TorqueControl_0.TorqueRamp := 1;
	
	previousTorque := 0;
	
	MTBasicsPID_0.MinOut := -0.2;
	MTBasicsPID_0.MaxOut := 0.2;
	MTBasicsPID_0.PIDParameters.Gain := 0.01;
	MTBasicsPID_0.PIDParameters.IntegrationTime := 100;
	 
END_PROGRAM