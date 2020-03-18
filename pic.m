clc,
close all;
clear;


ImageData1 = imread('Pic1.bmp');
imshow(ImageData1);
set(gcf,'name','原图');


model=[-1,0,1;
       -2,0,2;
       -1,0,1];
[m,n]=size(ImageData1);
ImageData2 = double(ImageData1);


for i=2:m-1
    for j=2:n-1
        ImageData2(i,j)=ImageData1(i+1,j+1)+2*ImageData1(i+1,j)+ImageData1(i+1,j-1)-ImageData1(i-1,j+1)-2*ImageData1(i-1,j)-ImageData1(i-1,j-1);
    end
end
figure,
imshow(ImageData2),title('边缘提取后的图像');
ImageData2 = ImageData2 + double(ImageData1);
figure;
imshow(uint8(ImageData2)),title('锐化后');