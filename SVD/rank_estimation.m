clear all
close all
clc


%read Image
A=imread('mim.jpg');
imshow(A)

gray=double(rgb2gray(A));




% adding 3 type of Noise
noise1=imnoise(gray,'salt & pepper', 0.02);
noise2 = imnoise(noise1,'poisson')
noise3 = imnoise(noise2,'gaussian')
imshow(noise3)

error=immse(gray,noise3);

imshow(noise3)



[row,col]=size(noise3);

figure
imagesc(noise3), axis off
imginv
title('Img in gray sclae')

[U, S, V]=svd(noise3);

singV = diag(S);
figure
semilogy(singV), grid on
xlabel('Rank')
ylabel('Singular Value')
title('Analayzing singular value & Rank')

error

function imginv
colormap(1-gray())
end

