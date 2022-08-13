classdef Nozzle < Component

    properties (Access = public)
       u9
       Pt9
       P9
       T9
       
    end

    properties (Access = protected)
       P0
       pi_d
       pi_LPC
       pi_HPC
       pi_b
       pi_HPT
       pi_LPT
       pi_n
    end
    
    methods (Access = public)
         function InitVar(obj,cParams,Turbina)
               obj.P0          = cParams.P0;
               obj.InputTemp    = Turbina.LPT.ExitTemp;
               obj.pi_d         = cParams.pi_d;
               obj.pi_LPC       = Turbina.LPC.pi_LPC;
               obj.pi_HPC       = Turbina.HPC.pi_HPC;
               obj.pi_b         = cParams.pi_b;
               obj.pi_HPT       = Turbina.HPT.pi_HPT;
               obj.pi_LPT       = Turbina.LPT.pi_LPT;
               obj.pi_n        = cParams.pi_n;
        end
        function CalcExitVar(obj)
               obj.ExitTemp     = obj.InputTemp;
               obj.Pt9 = obj.P0*obj.pi_d*obj.pi_LPC*obj.pi_HPC*obj.pi_b*obj.pi_HPT*obj.pi_LPT*obj.pi_n; 
               M9 = sqrt(2/(obj.gammat-1)*((obj.Pt9/obj.P0)^((obj.gammat-1)/obj.gammat)-1));
               if M9 > 1
                    M9 = 1;
                    obj.P9 = obj.Pt9*(2/(obj.gammat+1))^(obj.gammat/(obj.gammat-1));
               else
                    obj.P9 = obj.P0;
               end
               obj.T9 = obj.ExitTemp/(1+(obj.gammat-1)/2*M9^2);
               obj.u9 = M9*sqrt(obj.gammat*287*obj.T9);
        end
    end

end