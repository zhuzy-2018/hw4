name=('test2');
I=imread([name,'.tif']);
figure,
subplot(2,2,1),imshow(I);title([name,'ԭͼ']);
[sx,sy]=size(I);
sigma=1.5;
for N=1:3;            %��С�ǣ�2N+1������2N+1��
N_row = 2*N+1;
GausFilter = fspecial('gaussian',[N_row N_row],sigma);
I_AftGau=imfilter(I,GausFilter,'conv');
subplot(2,2,2),imshow(I_AftGau);title([num2str(N_row,'%d'),'x',num2str(N_row),'matlab��˹�˲�']);
I_AftMed=medfilt2(I,[N_row N_row]);
subplot(2,2,3),imshow(I_AftMed,[N_row N_row]);title([num2str(N_row,'%d'),'x',num2str(N_row),'matlab��ֵ�˲�']);
saveas(gcf,['task1_',name,'_',num2str(N_row,'%d'),'x',num2str(N_row,'%d'),'.jpg']);
%%
figure,
subplot(2,2,1),imshow(I);title([name,'ԭͼ']);
I_AftMyGaus=MyGaus(sigma,N,1,I);
subplot(2,2,2),imshow(I_AftMyGaus);title([num2str(N_row,'%d'),'x',num2str(N_row),'�ҵĸ�˹�˲�']);
I_AftMyMed=MyMed(N,1,I);
subplot(2,2,3),imshow(I_AftMyMed,[N_row N_row]);title([num2str(N_row,'%d'),'x',num2str(N_row),'�ҵ���ֵ�˲�']);
saveas(gcf,['task1_',name,'_','my_',num2str(N_row,'%d'),'x',num2str(N_row,'%d'),'.jpg']);
end