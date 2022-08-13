classdef Difusor < Component
    properties (Access = public)
        delta0
    end 
    properties (Access = private)
        T0
        M0
    end
    
    methods (Access = public)
        function InitVar(obj,cParams,Turbina)
            obj.T0      = cParams.T0;
            obj.M0    = cParams.M0; 
        end
        function CalcExitVar(obj)
            theta0          = 1+(obj.gammac-1/2)*obj.M0^2;
            obj.delta0      = (1+(obj.gammac-1/2)*obj.M0^2)^(obj.gammac/(obj.gammac-1));
            Tt0             = obj.T0*theta0;
            obj.ExitTemp    = Tt0;
        end
    end
end

