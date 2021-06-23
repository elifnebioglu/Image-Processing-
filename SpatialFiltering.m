clear;
clc;
A=imread('papagan.png')
[m,n]= size(A);
N = 3;
M =[ 1,1,1 ; 1,1,1 ; 1,1,1];
for i =1 : m
    for j =1 :n
        new(i,j)=0; 
    end
end
new = uint8(new);
for i =1 : m+N-1
    for j =1 :n+N-1
       B(i,j)=0;
    end
end
B = uint8(B);
[a,b]= size(B);
B((N+1)/2:a -(((N+1)/2)-1),(N+1)/2:b -(((N+1)/2)-1)) = A; %zero padding uyguladıktan sonra tam ortaya resmi yerleştirme
for i = 1 : a-(N-1)
    for j = 1 : b-(N-1)
        T =B(i:i+N-1,j:j+N-1); % maskeyi gezdirirken resmin hangi kısmıyla ilgileniyoruz
        sum =0;
         for r = 1 : N
            for c = 1 : N
                sum = sum +double(T(r,c)*M(r,c));
            end
          end
        new(i,j)= sum/(N*N); 
    end
end

%imshow(A);
%figure
imshow(new);