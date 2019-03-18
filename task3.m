%3.利用高通滤波器滤波测试图像test3,4：包括unsharp masking, Sobel edge detector, and Laplace edge detection；Canny algorithm.分析各自优缺点；
I3=imread('test3_corrupt.pgm');
figure,subplot(1,2,1),imshow(I3);title('test3 origin');
I4=imread('test4 copy.bmp');
subplot(1,2,2),imshow(I4);title('test4 origin');
saveas(gcf,['task3_','origin','.jpg']);
% %%
% %unsharp masking
% GaussKernel=fspecial('gaussian',5,3);
% I3_unsharp=I3-imfilter(I3,GaussKernel);
% I4_unsharp=I4-imfilter(I4,GaussKernel);
% figure,subplot(1,2,1),imshow(I3_unsharp);title('unsharp masking');
% subplot(1,2,2),imshow(4*I4_unsharp);title('unsharp masking 灰度x4');
% saveas(gcf,['task3_','unsharp','.jpg']);
% %%
% %Sobel edge detector
% I3_sobel = edge(I3,'sobel');
% I4_sobel = edge(I4,'sobel');
% 
% figure,subplot(1,2,1),imshow(I3_sobel);title('Sobel edge detector');
% subplot(1,2,2),imshow(I4_sobel);title('Sobel edge detector');
% saveas(gcf,['task3_','sobel','.jpg']);
% %%
% %Laplace edge detection
% I3_log = edge(I3,'log');
% I4_log= edge(I4,'log');
% 
% figure,subplot(1,2,1),imshow(I3_log);title('Laplace edge detection');
% subplot(1,2,2),imshow(I4_log);title('Laplace edge detection');
% saveas(gcf,['task3_','log','.jpg']);
%%
%Canny algorithm
GausFilter = fspecial('gaussian',[7 7],1.5);
I3=imfilter(I3,GausFilter,'conv');
GausFilter = fspecial('gaussian',[7 7],1.5);
I4=imfilter(I4,GausFilter,'conv');
I3_canny = edge(I3,'canny');
I4_canny= edge(I4,'canny');

figure,subplot(1,2,1),imshow(I3_canny);title('Canny algorithm');
subplot(1,2,2),imshow(I4_canny);title('Canny algorithm');
saveas(gcf,['task3_','cannys','.jpg']);