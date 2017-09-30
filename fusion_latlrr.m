
% for i=1:16
index = 2;

% path1 = 'img_00000.bmp';
% path2 = 'img_00001.bmp';
% fuse_path = 'fused_video_test_latlrr.png';

path1 = ['./source_images/infrared',num2str(index),'.jpg'];
path2 = ['./source_images/visible',num2str(index),'.jpg'];
fuse_path = ['./fused_images/fused',num2str(index),'_latlrr.png'];
% fuse_path = ['./fused_images/fused',num2str(index),'_max_latlrr.png'];

% path1 = ['./infrared_images/IR',num2str(index),'.bmp'];
% path2 = ['./infrared_images/VIS',num2str(index),'.bmp'];
% % fuse_path = ['./fused_images16/fused',num2str(index),'_latlrr.png'];
% fuse_path = ['./fused_images16/fused',num2str(index),'_max_latlrr.png'];

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


% imwrite(F,fuse_path,'png');
% end


index = 180;

lrr1 = I_saliency1;
lrr2 = I_saliency2;
F_s = F_saliency;

lrr1(index,:) = 1;
lrr2(index,:) = 1;
F_s(index,:) = 1;

imwrite(lrr1,'I1_s.png','png');
imwrite(lrr2,'I2_s.png','png');
imwrite(F_s,'F_s.png','png');

figure;
subplot(1,3,1);
imshow(lrr1);
xlabel('I1\_s');
subplot(1,3,2);
imshow(lrr2);
xlabel('I2\_s');
subplot(1,3,3);
imshow(F_s);
xlabel('F_s');

l_data1 = I_saliency1(index,:);
l_data2 = I_saliency2(index,:);
f_data = l_data1 + l_data2;

figure;
plot(l_data1,'LineWidth',1.5);
hold on;
plot(l_data2,'LineWidth',1.5);
ylabel('coefficients');
xlabel('position');
legend('I1\_s','I2\_s','F\_s');
print(gcf,'-dpng','l_data_line.png');

figure;
plot(f_data,'r','LineWidth',1.5);
ylabel('coefficients');
xlabel('position');
legend('F_s');
print(gcf,'-dpng','f_data_line.png');
