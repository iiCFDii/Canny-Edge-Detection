% Name: Christopher Ciobanu
% Date: 10/11/22
% ECPE 124 Digital Image Processing
% Program 3: Canny Edge Detection
% How to Use Testing Script: Hit Run at the Top of Matlab and select the
% input image and then type in the sigma value. 

[FileName,FilePath]=uigetfile('*');          % Reads in File  
image1 = imread(strcat(FilePath,FileName));  % Reads in File
n = input('Select Sigma Value (Default = 0.6): ');  % get sigma value from user input
sigma = n;

% Creates Kernel

[G,w] = Gaussian(sigma);
[Gderiv,w] = Gaussian_Deriv(sigma);

% performs convolution to create vertical and horizontal images
image_h = convolve(image1,G');
image_h = convolve(image_h,Gderiv);

image_v = convolve(image1,G);
image_v = convolve(image_v,Gderiv');
 
figure
imshow(image_h)
title('Horizontal')


figure
imshow(image_v)
title('Vertical')

[Magnitude, Gradient] = MagnitudeGradient(image_h,image_v);


figure
imshow(Gradient)
title('Gradient')

figure
imshow(uint8(Magnitude))
title('Magnitude')

supressed = NonMaxSuppression(Magnitude,Gradient);

figure
imshow(uint8(supressed))
title('Non-Maximal Suppression Image')

edge = Hysteresis(supressed);

figure
imshow((edge))
title('Final Output (Edges)')

chamfer = Chamfer_Distance(edge);

figure
imshow((chamfer))
title('Chamfer')

figure
imshow(uint8(chamfer))
title('SSD Map')
