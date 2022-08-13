classdef HPC < Component

    properties (Access = public)
        pi_HPC
        eta_HPC

    end
    
    methods (Access = public)
       function InitVar(obj,cParams,Turbina)
            obj.pi_HPC      = cParams.pi_HPC; 
            obj.eta_HPC     = cParams.eta_HPC;
            obj.InputTemp   = Turbina.LPC.ExitTemp;
        end
        function CalcExitVar(obj)
            tau_HPC = (((((obj.pi_HPC)^(obj.gammac-1/obj.gammac))-1)/(obj.eta_HPC)))+1;
            obj.ExitTemp = tau_HPC*obj.InputTemp;
        end
    end
end