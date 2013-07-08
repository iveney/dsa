%% redis: Performs DSA redistribution
% returns the redistributed layout

% NOTE: the 'goal' should probably be 'do your best', i.e., 
% the modified layout may contain some cuts not matched to any template
% but most of them are redistributed to match.

% TODO: report detailed status, not just 'fail' or 'success'
function [success, mod] = redis(layout, cuts, templates, rule)
success = false;
mod = layout;

%% sort the cut array according to column then row
RC = [ [cuts.r]' [cuts.c]'];
[~, idx] = sortrows(RC, [2, 1]);
sorted = cuts(idx);

%% status of each cut
% 1 = unfinish, 0 = finished, initialize as unfinish
finish = sparse(RC(:,1), RC(:,2), ones(numel(cuts), 1));

%% construct the graph
% first compute the distance between each pair
dist = abs(bsxfun(@minus,RC(:,1),RC(:,1)')) + abs(bsxfun(@minus,RC(:,2),RC(:,2)'));

% Note: the following is Euclidean distance
% dist = bsxfun(@minus,RC(:,1),RC(:,1)').^2 + bsxfun(@minus,RC(:,2),RC(:,2)').^2;
% dist = sqrt(dist);

% Find all pairs of cuts s.t. their distance is smaller than the rule
% Note that the matrix is symmetric, use only the upper part is enough
upper = triu(dist);
[R, C] = find(0 < upper & upper < rule);

%% compute all connected components as initial grouping
cs = grComp([R C], numel(cuts));

%% resolve conflict for each group
for i=1:max(cs)
    indices = find(cs == i)
    
    % find a template to match, note that there may not be an exact match
    
    % try to 'implement' the match by moving cuts
    
    % check if it creates new conflict
end