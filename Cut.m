classdef Cut
    %Cut Deinfes the cut class
    %   Detailed explanation goes here
    
    properties
        r      % row
        c      % column
    end
    
    properties ( GetAccess = 'public', SetAccess = 'private' )
        id
    end
    
    methods ( Static, Access = 'private' )
        function result = increment()
            persistent stamp;
            if isempty( stamp )
                stamp = 0;
            end
            stamp = stamp + uint32(1);
            result = stamp;
        end
    end  
    
    methods
        function obj = Cut(r, c)
            obj.r = r;
            obj.c = c;
            obj.id = Cut.increment();
        end
    end
    
end

