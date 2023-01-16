% Name: Christopher Ciobanu
% Date: 10/10/22
% ECPE 124 Digital Image Processing
% Program 3: Canny Edge Detection
%
% This is the cahmfer_disatance function that calculates the chamfer
% distance 
function chamfer = Chamfer_Distance(edge)   
  [height,width,depth] = size(edge);
    if depth > 1
        edge = im2gray(edge);    % converts rgb image to greyscale
    end
    chamfer = zeros([height width]);
    
    % this for loop does the first pass to compute chamfer distance
    for i=1:height
        for j=1:width 
            if ((i-1)>0 &&  (i+1)<=height && (j-1)>0 && (j+1)<=width)   % Checks to make sure we are not over stepping boundaries
                if(edge(i,j)== 255)
                    chamfer(i,j)= 0;
                else
                    chamfer(i,j)= min(1+chamfer(i-1,j),1+chamfer(i,j-1));
                end
            else
                
            end
        end
    end
        
    % this for loops does the second pass to compute chamfer distance
    for i=height:1
        for j=width:1
            if ((i-1)>0 &&  (i+1)<=height && (j-1)>0 && (j+1)<=width)   % Checks to make sure we are not over stepping boundaries
                if(edge(i,j)== 255)
                    chamfer(i,j)= 0;
                else
                    chamfer(i,j)= min(1+chamfer(i+1,j),1+chamfer(i,j+1));
                end
            else
                
            end
        end
    end
    
end