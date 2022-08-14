classdef HPT < Component

    properties (Access = public)
        tau_HPT
        pi_HPT

    end

    properties (Access = protected)
        f
        tau_LPC
        Perf2 
        Tt2
    end
    
    methods (Access = public)
        function InitVar(obj,cParams,Turbina)

            obj.Perf        = cParams.eta_mH;
            obj.Perf2       = cParams.eta_HPT;
            obj.f           = Turbina.Chamber.f;
            obj.tau_LPC     = Turbina.LPC.tau_LPC;
            obj.Tt2         = Turbina.Difusor.ExitTemp;
            obj.InputTemp   = cParams.T4;
        end
        function CalcExitVar(obj)
            obj.tau_HPT     = 1-(1/obj.Perf)*(1/(1+obj.f))*(obj.Cpc/obj.Cpt)*(obj.Tt2/obj.InputTemp)*obj.tau_LPC*(obj.tau_LPC-1);
            obj.pi_HPT      = (1-((1-obj.tau_HPT)/obj.Perf2))^(obj.gammat/(obj.gammat-1));
            obj.ExitTemp    = obj.tau_HPT*obj.InputTemp;
        end
    end
end