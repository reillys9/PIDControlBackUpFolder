
PROGRAM _CYCLIC
		(*Axis Parameters*)
	
	MpAxisBasic_0.MpLink     := ADR(gAxis_1);
	MpAxisBasic_0.Parameters := ADR(AxisParameters);
	MpAxisBasic_0();
	
	(*Reading in Position and Velocity*)
	MC_ReadActualPosition_0.Axis := ADR(gAxis_1);
	MC_ReadActualVelocity_0.Axis := ADR(gAxis_1);
	MC_ReadActualPosition_0();
	MC_ReadActualVelocity_0();
	
	(*Torque Control *)
	
	MC_BR_TorqueControl_0.Axis := ADR(gAxis_1);
	
	(*Need to test this*)
	
	IF MC_BR_TorqueControl_0.InitData = FALSE AND MC_BR_TorqueControl_0.Enable = TRUE AND MC_BR_TorqueControl_0.Start = TRUE THEN
		MC_BR_TorqueControl_0.InitData := TRUE;
		MC_BR_TorqueControl_0();
	ELSIF MC_BR_TorqueControl_0.Enable = TRUE AND MC_BR_TorqueControl_0.Start = TRUE THEN
		MC_BR_TorqueControl_0.InitData := FALSE;
		MC_BR_TorqueControl_0();
	END_IF
	
	
	(*
	IF MC_BR_TorqueControl_0.Enable = TRUE THEN
		MC_BR_TorqueControl_0();
	END_IF
	*)
	
		
	
	currentTorque := MC_BR_TorqueControl_0.Torque;
	
	TON_10ms_0(IN := MC_BR_TorqueControl_0.Enable);
	
	(*
	IF TON_10ms_0.Q = TRUE THEN
		MC_BR_TorqueControl_0.Start := TRUE;
	END_IF
	*)
	
	previousTorque := currentTorque;
	
	
	(*PIDControl*)
	IF MTBasicsPID_0.Enable = TRUE THEN
		MTBasicsPID_0.ActValue := LREAL_TO_REAL(MC_ReadActualVelocity_0.Velocity);
		
		IF MTBasicsPID_0.Update = TRUE THEN
			MTBasicsPID_0.Update := FALSE;
			MTBasicsPID_0();
		ELSE
			MTBasicsPID_0.Update := TRUE;
			MTBasicsPID_0();
		END_IF
		
		
		MC_BR_TorqueControl_0.Torque := MTBasicsPID_0.Out;
	END_IF
	
	 
END_PROGRAM
