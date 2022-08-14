%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%   UNIT TESTING SCRIPT   %%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
load('cParams.mat')
TurbineTest =  TurbineMotor;
Init(TurbineTest,cParams);
if round(TurbineTest.mfDot,5) == round(cParams.mfDotUnitTest,5)
    disp('Fuel mass flow OK!')
else
    warning('Error in fuel mass flow')
end
