

imds = imageDatastore({'C:\Users\Flevios\Desktop\ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ\traffic signs photos\4\Στιγμιότυπο οθόνης (4605).png'});
I = readimage(imds, 1);


J = undistortImage(I,cameraParams);
figure; imshowpair(I, J, 'montage');
title('Original Image (left) vs Corrected Image (right)');
figure; imshow( J);



