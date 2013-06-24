% Author: Zigang Xiao <zxiao2@illinois.edu>
% 
% DSA Redistribution

% there are three templates
templates = {
ones(3, 1)
ones(2, 1)
ones(2, 2)
};

% design rule: minimum distance between cuts
rule = 5;

% read in a file
[layout, cuts] = readdata('data/tiny');
visualize(layout);
[success, layout] = redis(layout, cuts, templates, rule);
if success == true
    visualize(layout)
end