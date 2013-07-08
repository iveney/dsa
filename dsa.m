% Author: Zigang Xiao <zxiao2@illinois.edu>
% 
% DSA Redistribution

addpath('graph');

% there are three templates in this demo
templates = {
ones(3, 1)
ones(2, 1)
ones(2, 2)
};

% design rule: minimum distance between cuts
rule = 5;

% read in a file
[layout, cuts] = readdata('data/tiny');

% draw the layout
visualize(layout, 'original');

% perform redistribution
[success, modified] = redis(layout, cuts, templates, rule);


% draw the new layout if successful
if success == true
    visualize(modified, 'modified');
end