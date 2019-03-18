function AftImg=MyGaus(sigma,N,m,image)
N_row = 2*N+1;%模板大小
%隔m个像素遍历
[sx,sy]=size(image);
filter = [];                                        %求高斯模板filter
for i=1:N_row
    for j=1:N_row
        fenzi=double((i-N-1)^2+(j-N-1)^2);
        filter(i,j)=exp(-fenzi/(2*sigma*sigma))/(2*pi*sigma);
    end
end
filter=filter/sum(filter(:));              %归一化
AftImg=zeros(sx,sy);
MidImg=double(padarray(image,[N_row N_row],'replicate'));
MidImg2=MidImg;

for i=N+1:m:N_row+sx+N+1
    for j=N+1:m:N_row+sx+N+1
        temp=MidImg(i-N:i+N,j-N:j+N);
        temp=temp.*filter;
        MidImg2(i,j)=sum(sum(temp,2));
    end
end

for i=1:sx
    for j=1:sy
        AftImg(i,j)=MidImg2(i+N_row,j+N_row);
    end
end
AftImg=uint8(AftImg);
% WTF=sum(sum(AftImg-image,2))
% figure,imshow(AftImg);