classdef Chamber < Component
    properties (Access = public)
        f
        
    end 

    methods (Access = public)
       function InitVar(obj,cParams,Turbina)
            obj.Perf        = cParams.eta_b;
            obj.InputTemp   = Turbina.LPC.ExitTemp;
            obj.ExitTemp    = cParams.T4;
        end
        function CalcExitVar(obj)
            obj.f = (obj.Cpt*obj.ExitTemp-obj.Cpc*obj.InputTemp)/(obj.Perf*obj.h-obj.Cpt*obj.ExitTemp);
        end
    end
end