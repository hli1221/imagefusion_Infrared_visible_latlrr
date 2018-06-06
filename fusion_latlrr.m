
% for i=1:16
index = 2;

path1 = ['./source_images/IV_images/IR',num2str(index),'.png'];
path2 = ['./source_images/IV_images/VIS',num2str(index),'.png'];
fuse_path = ['./fused_images/fused',num2str(index),'_latlrr.png'];

image1 = imread(path1);
image2 = imread(path2);

if size(image1,3)>1
    image1 = rgb2gray(image1);
    image2 = rgb2gray(image2);
end

image1 = im2double(image1);
image2 = im2double(image2);

lambda = 0.8;
disp('latlrr');
tic
X1 = image1;
[Z1,L1,E1] = latent_lrr(X1,lambda);
X2 = image2;
[Z2,L2,E2] = latent_lrr(X2,lambda);
toc
disp('latlrr');

I_lrr1 = X1*Z1;
I_saliency1 = L1*X1;
I_lrr1 = max(I_lrr1,0);
I_lrr1 = min(I_lrr1,1);
I_saliency1 = max(I_saliency1,0);
I_saliency1 = min(I_saliency1,1);
I_e1 = E1;

I_lrr2 = X2*Z2;
I_saliency2 = L2*X2;
I_lrr2 = max(I_lrr2,0);
I_lrr2 = min(I_lrr2,1);
I_saliency2 = max(I_saliency2,0);
I_saliency2 = min(I_saliency2,1);
I_e2 = E2;

% lrr part
F_lrr = (I_lrr1+I_lrr2)/2;
% saliency part
F_saliency = I_saliency1 + I_saliency2;

F = F_lrr+F_saliency;

figure;imshow(I_saliency1);
figure;imshow(I_saliency2);
figure;imshow(F);

imwrite(F,fuse_path,'png');
% end

