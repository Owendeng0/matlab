
%%%%% ¾ùÖµ·¨ÌáÈ¡±³¾°
clc
clear;
B=zeros();
s=1;
t=200;
N=t-s;
for i=s:t
c=num2str(i,'%d');
c=strcat(c,'.bmp');
I = imread(c);
[m,n]=size(I);
I=double(I);
B=B+I;
end
B=B/N;
imshow(uint8(B));
