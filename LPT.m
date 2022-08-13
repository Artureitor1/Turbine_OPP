classdef LPT < Component

    properties (Access = public)
        tau_LPT
        pi_LPT
    end

    properties (Access = protected)
        f
        tau_HPT
        tau_LPC
        Perf2 
        Tt2
    end
    
    methods (Access = public)
         function InitVar(obj,cParams,Turbina)

            obj.Perf        = cParams.eta_mL;
            obj.Perf2       = cParams.eta_LPT;
            obj.f           = Turbina.Chamber.f;
            obj.tau_HPT     = Turbina.HPT.tau_HPT;
            obj.tau_LPC     = Turbina.LPC.tau_LPC;
            obj.Tt2         = Turbina.Difusor.ExitTemp;
            obj.InputTemp   = cParams.T4;
        end
        function CalcExitVar(obj)
            obj.tau_LPT = 1-(1/obj.Perf)*(1/(1+obj.f))*(obj.Cpc/obj.Cpt)*(obj.Tt2/obj.InputTemp)*(1/obj.tau_HPT)*(obj.tau_LPC-1);
            obj.pi_LPT = (1-((1-obj.tau_LPT)/obj.Perf2))^(obj.gammat/(obj.gammat-1));
            obj.ExitTemp    = obj.tau_LPT*obj.InputTemp;
        end
    end
end