B = '.png';
C = 'yjf-00_1-';
k=1;
 
for k=1:50
 
        d=num2str(k);
        e2=strcat(C,d);
        filename3 =strcat(e2,B);
        a=imread('yjf-00_1-bk.png');
        b=imread( filename3);
        a1=a(:,:,1);
        a2=a(:,:,2);
        a3=a(:,:,3);
        %[r c]=size(a1);
        b1=b(:,:,1);
        b2=b(:,:,2);
        b3=b(:,:,3);
        z1= imsubtract(a1,b1);
        z2= imsubtract(a2,b2);
        z3= imsubtract(a3,b3);
 
        fig(:,:,1)=z1;
        fig(:,:,2)=z2;
        fig(:,:,3)=z3;
 
 
        I2=rgb2gray(fig);
        I3 = imadjust(I2, stretchlim(I2), [0 1]);
        level = graythresh(I3);
        bw = im2bw(I3,level);
        K = medfilt2(bw);
        K6 = medfilt2(K,[5,5]);
%         k6=double(K6);
%         K6=edge(K6,'canny');
%         imshow(K6,[])
 
        k=k+1;
 
        Image  = K6;
% get size of image as H,W
        imshow(b);
        [H,W] = size(Image);
        [r,c] = find( bwperim(Image,4) == 1 );
        [tr,tc] = boundarytrack(r,c,H,W,0);
       % X1=tr;
       % Y1 =tc;
        XB=tr;
        YB =tc;
Xmin = min(XB);
Ymin = min(YB);
Xmax = max(XB);
Ymax = max(YB);
        X = [Xmin,Xmax];
        Y = [Ymin,Ymin];
        line(Y,X) ;
        X = [Xmin,Xmin];
        Y = [Ymin,Ymax];
        line(Y,X) ;
        X = [Xmax,Xmax];
        Y = [Ymin,Ymax];
        line(Y,X) ;
        X = [Xmin,Xmax];
        Y = [Ymax,Ymax];
        line(Y,X) ;
%Yg = Xmin+fix((Ymax-Ymin)/2);
%Xg = Ymin+fix((Xmax-Xmin)/2);
        %line(Yg,Xg);
        pause(0.1);
        end
     