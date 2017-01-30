function [map]=iterate(map,lowR,lowC,highR,highC)
    if(highR-lowR > 1)
        a = round((highR-lowR)/2);
        map(lowR,lowC+a) = (map(lowR,lowC)+map(lowR,highC))/2;
        map(lowR+a,lowC) = (map(lowR,lowC)+map(highR,lowC))/2;
        map(highR,lowC+a) = (map(highR,lowC)+map(highR,highC))/2;
        map(lowR+a,highC) = (map(lowR,highC)+map(highR,highC))/2;
        map(lowR+a,lowC+a) = (map(lowR,lowC)+map(lowR,highC)+map(highR,lowC)+map(highR,highC))/4 + randn*a*3;
        map = iterate(map,lowR,lowC,lowR+a,lowC+a);
        map = iterate(map,lowR,lowC+a,lowR+a,highC);
        map = iterate(map,lowR+a,lowC,highR,lowC+a);
        map = iterate(map,lowR+a,lowC+a,highR,highC);
    else
        return
    end
end