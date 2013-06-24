%% redis: Performs DSA redistribution
% returns the redistributed layout
function [success, opt] = redis(layout, cuts, templates, rule)
success = true;
opt = layout;

%% sort the cut array according to column then row
RC = [ [cuts.r]' [cuts.c]'];
[~, idx] = sortrows(RC, [2, 1]);
sorted = cuts(idx);

%% mark the status of each cut
% 1 = not finish, 0 = finished
finish = sparse(RC(:,1), RC(:,2), ones(numel(cuts), 1));

%% construct the graph
% first compute the distance between each pair
dist = abs(bsxfun(@minus,RC(:,1),RC(:,1)')) + abs(bsxfun(@minus,RC(:,2),RC(:,2)'));

% Note: this is Euclidean distance
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
    nodes = find(cs == i);
    
    % finds a template to match
    
    % try to 'implement' the match by moving cuts
    
    % check if it creates new conflict
end