clear all
close all
clc


%read Image
A=imread('mim.jpg');

% adding 3 type of Noise
noise1=imnoise(A,'salt & pepper', 0.02);
noise2 = imnoise(noise1,'poisson')
noise3 = imnoise(noise2,'gaussian')
imshow(noise3)



%Gray scale conversion
gray=double(rgb2gray(noise3));

gray_original = double(rgb2gray(A))


% Error bettween un-noisy oirginal image and Noisy image

error_between_original_and_Noisy_image=immse(gray,gray_original);
error_between_original_and_Noisy_image

[row,col]=size(gray);


% plot of Noisy and Renocstruct Images base on Rank
subplot(2,2,1)
imagesc(gray), axis off
imginv
title('Img in gray sclae after adding Salt & Pepper, Poisson and Gaussian noise')
plot=2;


% using SVD
[U, S, V]=svd(gray);

singV=diag(S);

% selecting different Rank
rank=[ 5 10 99 ];


for i = 1:length(rank)
    img = U(:,1:rank(i)) * S(1:rank(i), 1:rank(i)) *V(:,1:rank(i))';
    error=immse(gray,img);
    X = [' error between recontructed image and original Noisy_image at rank', num2str(rank(i)), ' :', num2str(error)];
    disp(X)
    subplot(2,2,plot);
    plot=plot+1;
    imagesc(img), axis off, imginv;
    storage=100*rank(i)*(row+col)/(row*col);
    title(['new figure by rank: ', num2str(rank(i))])
end


function imginv
colormap(1-gray())
end