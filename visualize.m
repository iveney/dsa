function visualize(layout, thetitle)
%VISUALIZE Visualize a given matrix of dsa layout
mymap = [
1 1 0;    % 0 = dummy wire, yellow
0 0 1;    % 1 = real wire, blue
1 0 0     % 2 = cut, red
];
figure
imagesc(layout);
colormap(mymap);
axis image;
labels = {'dummy','real','cut'};
lcolorbar(labels,'fontweight','bold');
title(thetitle);
end

