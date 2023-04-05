% Specify the folder where the files live.
myFolder = 'C:\Users\Flevios\Desctop\ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ\traffic signs photos\4';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    imds = imageDatastore({fullFileName});

    I = readimage(imds, 1);


    J = undistortImage(I,cameraParams);
    %print the differents of Images
    %figure; imshowpair(I, J, 'montage');
    %title('Original Image (left) vs Corrected Image (right)');
    %print Corrected Image
    %figure; imshow(J);
    %ImageFolder ='C:\Users\Flevios\Desktop\ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ\traffic signs photos\3';
    file_name = sprintf('00%d.ppm', k)% name Image with a sequence of number, ex Image1.png , Image2.png....
    %fullFileName_1 = fullfile(ImageFolder, file_name);
    imwrite(J, file_name,'ppm') %save the image as a Portable Graphics Format file(png)into the MatLab

    % such as reading it in as an image array with imread()
    %imageArray = imread(fullFileName);
    %imshow(imageArray);  % Display image.
    %drawnow; % Force display to update immediately.
end