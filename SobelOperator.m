clear;
clc;
P = imread('papagan.png')
A=imread('papagan.png')
[m,n]= size(A);
N = 3;
M =[ -1,-2,-1 ; 0,0,0 ; 1,2,1];
M1 =[ 0,-1,1 ; 0,-2,2 ; 0,-1,1];
for i =1 : m
    for j =1 :n
        new(i,j)=0; 
    end
end
new = uint8(new);
C = double(A);
for i =1 : m
    for j =1 :m
        Gx(i,j)=0; 
    end
end
for i =1 : n
    for j =1 :n
        Gy(i,j)=0; 
    end
end
for i = 1 : m-(N-1)
    for j = 1 : n-(N-1)
        sum =0;
        sum1 =  0;
        T = C(i:i+(N-1),j:j+(N-1));
         for r = 1 : N
            for c = 1 : N
                sum = sum +double(T(r,c)*M(r,c));
                sum1 = sum1 +double(T(r,c)*M1(r,c));
            end
          end
        Gy(j,1)= sum; 
        Gx(i,1) = sum1;
        A(i,j)=sqrt(Gx(i,1).^2+Gy(j,1).^2);
    end
end
esikdeger = 50;
B =double(A);
C=B;
for i =1 : m
    for j =1 :n
        if(sqrt(Gx(i,1).^2+Gy(j,1).^2)<esikdeger)
            C(i,j)=0;
        end
    end
end
C = uint8(C);
imshow(C);



