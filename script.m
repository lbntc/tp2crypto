clear all, close all, clc;
I=imread('cameraman.tif');
choix=input('chiffrement=0, dechiff=1');
figure;
imshow(I);
title('image claire');
k=5; %cle
n=5; %nb de tours
T=dec2bin(I,8);
for i=1:size(T,1)
    S(i,:)=RF(T(i,:),n,k,choix);
end
H=bin2dec(S);
cryp=reshape(H,256,256);
figure;
imshow(uint8(cryp));
title('img chiffree')
