classdef Component < handle 
    properties (Access = public)
        ExitTemp
    end
    properties (Access = protected)
       Perf
       gammat = 1.3;
       gammac = 1.4;
       h = 43e6; 
       Cpt
       Cpc

       InputTemp
    end

   methods (Access = public)
       function Init(obj,cParams,Turbina)
            obj.Cpt = (obj.gammat)/(obj.gammat-1)*287;
            obj.Cpc = (obj.gammac)/(obj.gammac-1)*287;
            obj.InitVar(cParams,Turbina)
            obj.CalcExitVar()
        end
    end
end

