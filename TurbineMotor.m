classdef TurbineMotor < handle 

    properties (Access = public)
        mDot 
        F

        Difusor 
        HPC
        LPC
        HPT
        LPT
        Chamber
        Nozzle
    end 
    methods (Access = public)
        function Init (obj,cParams)
            InitVar (obj,cParams);
            InitCompVar(obj,cParams);
            CalcExitProperties(obj,cParams);
        end
    end 
    
    methods (Access = public)
        function InitVar (obj,cParams)
            obj.F = cParams.F;
            obj.Difusor = Difusor;
            obj.HPC     = HPC;
            obj.LPC     = LPC;
            obj.HPT     = HPT;
            obj.LPT     = LPT;
            obj.Chamber = Chamber;
            obj.Nozzle  = Nozzle;
        end

        function InitCompVar(obj,cParams)
            Init(obj.Difusor,cParams,obj)
            Init(obj.LPC,cParams,obj)
            Init(obj.HPC,cParams,obj)
            Init(obj.Chamber,cParams,obj)
            Init(obj.HPT,cParams,obj)
            Init(obj.LPT,cParams,obj)
            Init(obj.Nozzle,cParams,obj)
        end
        
        function CalcExitProperties(obj,cParams)
            obj.mDot = obj.F/((1+obj.Chamber.f)*obj.Nozzle.u9-cParams.u0+(1+obj.Chamber.f)*(287)*(obj.Nozzle.T9/obj.Nozzle.u9)*(1-(cParams.P0/obj.Nozzle.P9)));
        end
    end
end

