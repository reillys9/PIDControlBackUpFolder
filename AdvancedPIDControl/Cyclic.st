
PROGRAM _CYCLIC
		(*Axis Parameters*)
	
		MpAxisBasic_0.MpLink     := ADR(gAxis_1);
		MpAxisBasic_0.Parameters := ADR(AxisParameters);
		MpAxisBasic_0();
	
		MC_BR_TorqueControl_0.Axis := ADR(gAxis_1);
	
		(*Reading in Position and Velocity*)
		MC_ReadActualPosition_0.Axis := ADR(gAxis_1);
		MC_ReadActualVelocity_0.Axis := ADR(gAxis_1);
		MC_ReadActualPosition_0();
		MC_ReadActualVelocity_0();
	
		(*MTIdentLSQ*)	
		
		IF MTIdentLSQ_0.Enable = TRUE AND MTIdentLSQ_0.StartIdentification = TRUE THEN
		
			MTIdentLSQ_0.PlantOutput := LREAL_TO_REAL(MC_ReadActualVelocity_0.Velocity);
			MTIdentLSQ_0();
			MC_BR_TorqueControl_0.Torque := MTIdentLSQ_0.PlantInput;

		END_IF
	
		IF MTAdvancedLoopShaping_0.CalculationDone <> TRUE THEN
		
			MTAdvancedLoopShaping_0.SystemReference[0] := MTIdentLSQ_0.SystemReference;
			MTAdvancedLoopShaping_0.SampleTimeController := MTIdentLSQ_0.SampleTime;
			MTAdvancedLoopShaping_0.CalculateController := TRUE;
			MTAdvancedLoopShaping_0();
		
		END_IF
	
		IF MTIdentLSQ_0.IdentificationDone = TRUE THEN
			MTAdvancedLoopShaping_0.Enable := TRUE;
			MTIdentLSQ_0.StartIdentification := FALSE;
		MTIdentLSQ_0();
		MC_BR_TorqueControl_0.Torque := 0;
		
		END_IF

		(*PIDControl*)
		IF MTBasicsPID_0.Enable = TRUE THEN
			MTBasicsPID_0.ActValue := LREAL_TO_REAL(MC_ReadActualVelocity_0.Velocity);
		
			IF ABS(MTBasicsPID_0.SetValue - MTBasicsPID_0.ActValue) > 1 THEN
				IF MTBasicsPID_0.Update = TRUE THEN
					MTBasicsPID_0.Update := FALSE;
				ELSE
					MTBasicsPID_0.Update := TRUE;
				END_IF
			END_IF
		
			MTBasicsPID_0();
			MC_BR_TorqueControl_0.Torque := MTBasicsPID_0.Out;
		END_IF
	
		(*Torque Control *)
	
		IF MC_BR_TorqueControl_0.InitData = FALSE AND MC_BR_TorqueControl_0.Enable = TRUE AND MC_BR_TorqueControl_0.Start = TRUE THEN
			MC_BR_TorqueControl_0.InitData := TRUE;
		ELSIF MC_BR_TorqueControl_0.Enable = TRUE AND MC_BR_TorqueControl_0.Start = TRUE THEN
			MC_BR_TorqueControl_0.InitData := FALSE;
		END_IF
		
		MC_BR_TorqueControl_0();
	
		TON_10ms_0(IN := MC_BR_TorqueControl_0.Enable);
	
	(*
		IF TON_10ms_0.Q = TRUE THEN
			MC_BR_TorqueControl_0.Start := TRUE;
		END_IF
*)
	


END_PROGRAM
