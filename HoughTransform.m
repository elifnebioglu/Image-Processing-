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
            for p =1:3
                new(i,j,p)=0; 
            end
        end
end
new = uint8(new);
C = double(A);
Gx = zeros(m);
Gy = zeros(n);
rho = ceil(sqrt(m.^2 + n.^2));
acc = zeros(2*rho,101);
maxdist=sqrt(m*m+n*n) ;
for i = 1 : m-(N-1)
    for j = 1 : n-(N-1)
        sum =0;
        sum1 =0;
        T = C(i:i+(N-1),j:j+(N-1));
         for r = 1 : N
            for c = 1 : N
                sum = sum +double(T(r,c)*M(r,c));
                sum1 = sum1 +double(T(r,c)*M1(r,c));
            end
          end
        Gy(j)= sum; 
        Gx(i) = sum1;
        A(i,j)=sqrt(Gx(i).^2+Gy(j).^2);
    end
end
for i = 1 : m
    for j = 1 : n
            if(A(i,j)>0)
            Q = round(atan(Gy(j)/Gx(i)));
            p = round(i*cos(Q)+j*sin(Q));
            rho_idx = round(p)+rho;
            theta_idx = floor((Q + pi/2) / pi * 100) + 1;
            if(rho_idx<2*rho && rho_idx>0 && theta_idx < 101 && theta_idx>0)
                acc(rho_idx, theta_idx) = acc(rho_idx, theta_idx) + sqrt(Gx(i).^2+Gy(j).^2);
            end

            end
       
    end
end
imshow(acc);