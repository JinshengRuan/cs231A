%Code Taken from Michael Royce
function combine_images(xdata,ydata, trans, img2)

[n o b] = size(trans);
[l m z] = size(img2);

if(xdata(1)<0)
    xdisp = -xdata(1) + 1;
    xdisp = round(xdisp);
    
    if(ydata(1)<0)
     ydisp = round(-ydata(1) + 1);
     imgsizex = max(n, l+ydisp-1);
     imgsizey = max(o, m+xdisp-1);
 
     canvas = uint8(zeros(imgsizex, imgsizey,3));
     canvas1 = uint8(zeros(imgsizex, imgsizey,3));
     canvas2 = uint8(zeros(imgsizex, imgsizey,3));
     
     canvas1(1:(n), 1:o, 1:z) = trans;
     canvas2(ydisp:(l+ydisp-1), xdisp:(m+xdisp-1), 1:z)= img2;
 
    else
     ydisp = round(1+ydata(1));
     imgsizex = max(n+ydisp-1, l);
     imgsizey = max(o, xdisp+m-1);
 
     canvas = uint8(zeros(imgsizex, imgsizey,3));
     canvas1 = uint8(zeros(imgsizex, imgsizey,3));
     canvas2 = uint8(zeros(imgsizex, imgsizey,3));
     
     canvas1(ydisp:(ydisp+n-1), 1:(o), 1:z) = trans;
     canvas2(1:(l), xdisp:(xdisp+m-1), 1:z)= img2;
 
    end    
else
    xdisp = xdata(1) + 1;
    xdisp = round(xdisp);
    
    if(ydata(1)<0)
     ydisp = round(-ydata(1) + 1);
     imgsizex = max(n, l+ydisp-1);
     imgsizey = max(o+xdisp-1, m);
 
     canvas = uint8(zeros(imgsizex, imgsizey,3));
     canvas1 = uint8(zeros(imgsizex, imgsizey,3));
     canvas2 = uint8(zeros(imgsizex, imgsizey,3));
     
     canvas1(1:(n), xdisp:(o+xdisp-1), 1:z) = trans;
     canvas2(ydisp:(ydisp+l-1), 1:(m), 1:z)= img2;
 
    else
     ydisp = round(1+ydata(1));
     imgsizex = max(n+ydisp-1, l);
     imgsizey = max(o+xdisp-1, m);
 
     canvas = uint8(zeros(imgsizex, imgsizey,3));
     canvas1 = uint8(zeros(imgsizex, imgsizey,3));
     canvas2 = uint8(zeros(imgsizex, imgsizey,3));
     
     canvas1(ydisp:(n+ydisp-1), xdisp:(xdisp+o-1), 1:z) = trans;
     canvas2(1:(l), 1:(m), 1:z)= img2;
 
    end    
end    
     canvassub = imsubtract(canvas1, canvas2);
     canvas = imadd(canvassub,canvas2);
     
     imwrite(canvas, 'output.jpg');
figure;
imshow(canvas);