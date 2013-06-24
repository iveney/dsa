%% readdata: read input data
% the data format is described in data/README
% this function reads an input file and translates it into matrix format
% '0' means dummy wire, '1' means real wire, '2' means a cut
function [layout, cuts] = readdata(filepath)
fid = fopen(filepath);
line = fgets(fid);
[ntrack, len] = strread(line);
layout = ones(ntrack, len);
cuts = Cut.empty;
for i=1:ntrack
    line = strread(fgets(fid), '%d');
    p = 1;
    fill = 1;               % start as real wire
    for j=1:numel(line)
        q = line(j);
        layout(i, p:q) = fill;
        layout(i, q) = 2;        % inserts the cut
        cuts(end+1) = Cut(i, q); % add a new Cut object
        fill = 1 - fill;    % alternate b/t dummy and real wire
        p = q + 1;
    end
end
fclose(fid);