%{
MIT License

Copyright (c) 2017 Biro Eniko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

%}
% ================================
% INPUT (length, distance, lines, count)
% length - length of needle
% distance - distance between lines
% lines - number of lines
% count - number of needles
% ================================
% OUTPUT mypi - estimation of pi
% ================================
% TESZT 
% ================================
% Buffon(9.999, 10, 4, 10000)
% ================================
% Buffon(9.5, 10, 4, 10000)
% ================================

function mypi = Buffon(length, distance, lines, count)
% x - the center of the needle, 0 <= x <= d/2

% check the parameters
if (length > distance)
    error('The lenght of the needle must be grater than the distance between lines!');
end

% plot the lines
for i = 0:lines-1
    X = [0-length, (lines-1)*distance+length];
    Y = [i*distance, i*distance];
    plot(X,Y, 'k'); hold on;
end

step = 10;
xbuf = zeros(2,step);
ybuf = zeros(2,step);

k = 0;
for i = 1:count
    xt = 0;
    yt = 0;
    while ((xt == 0 && yt == 0) || (xt^2 + yt^2) > 1)
        xt = 2*rand() - 1;
        yt = 2*rand() - 1;
    end 
    
    dist = sqrt(xt^2 + yt^2);
    xt = xt / dist;
    yt = yt / dist;

    % generate the center of the needle
    x = (lines-1) * distance * rand();
    y = lines * distance * rand() - distance/2;
    
    % calculate the end-points of the needle
    x1 = x + length/2*xt;
    y1 = y + length/2*yt;
    x2 = x - length/2*xt;
    y2 = y - length/2*yt;
    
    % calculate between which lines are the needle's end-points
    which1 = floor(y1/distance);
    if y1 < 0
        which1 = -1;
    elseif y1 > (lines-1)*distance
        which1 = lines;
    end
    
    which2 = floor(y2/distance);
    if y2 < 0
        which2 = -1;
    elseif y2 > (lines-1)*distance
        which2 = lines;
    end
    
    if (which1 ~= which2)
        k = k+1;
    end
    
    if (distance*k != 0)
        mypi = (2*length*i)/(distance*k);
    else
        mypi = (2*length*i)/(distance*k+eps);
    end
    j = mod(i-1,step)+1;
    xbuf(1,j) = x1;
    xbuf(2,j) = x2;
    ybuf(1,j) = y1;
    ybuf(2,j) = y2;
    
    if j == step
        title(sprintf('#needles = %d, pi = %f', i, mypi));
        plot([x1,x2],[y1,y2]); axis equal;
        plot(xbuf,ybuf); axis equal; hold on;
        drawnow;
    end
    
    if floor(mypi*10000) == 31415
        title(sprintf('#needles = %d, pi = %f', i, mypi));
        plot(xbuf(:,1:j),ybuf(:,1:j)); axis equal; hold on;
        drawnow;
        break
    end
end


 
 
