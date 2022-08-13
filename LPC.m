classdef LPC < Component


    properties (Access = public)
        pi_LPC
        eta_LPC
        tau_LPC
        
    end
    
    methods (Access = public)
       function InitVar(obj,cParams,Turbina)
            obj.pi_LPC      = cParams.pi_LPC;
            obj.eta_LPC     = cParams.eta_LPC; 
            obj.InputTemp   = Turbina.Difusor.ExitTemp;
        end
        function CalcExitVar(obj)
            obj.tau_LPC = (((((obj.pi_LPC)^(obj.gammac-1/obj.gammac))-1)/(obj.eta_LPC)))+1;
            obj.ExitTemp = obj.tau_LPC*obj.InputTemp;
        end
    end
end