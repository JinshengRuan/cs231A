function [desc, keypt] = selectKeypointsInBbox(desc, keypt, x1, y1, x2, y2)
%[desc, keypt] = selectKeypointsInBbox(desc, keypt, x1, y1, x2, y2)

ind = keypt(1, :)>=x1 & keypt(1, :)<=x2 & ...
    keypt(2, :)>=y1 & keypt(2, :)<=y2;
desc = desc(:, ind);
keypt = keypt(:, ind);
