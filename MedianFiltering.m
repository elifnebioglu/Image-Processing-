clear;
clc;
v = VideoReader( 'hakli.mp4' );
video = VideoWriter('yourvideo.mp4');
open(video); 
while hasFrame(v)
    frame = readFrame(v);
    [m,n,o]= size(frame);
    N=3;
    for i =1 : m
        for j =1 :n
            for p =1:3
                new(i,j,p)=0; 
            end
        end
    end
    new = uint8(new);
    for i =1 : m+2
        for j =1 :n+2
            for p =1:3
                B(i,j,p)=0; 
            end
        end
    end
    B = uint8(B);
    [a,b,k]= size(B);
for p = 1 :o
     B((N+1)/2:a -(((N+1)/2)-1),(N+1)/2:b -(((N+1)/2)-1),p) = frame(:,:,p);
    for i = 1 : a-2
        for j = 1 : b-2
          T =B(i:i+2,j:j+2,p);
          T = T(:)';
          T = sort(T);
          median = T(5);
          new(i,j,p) = median;
          writeVideo(video,new);
       end
   end
end
    
end
close(video); 
function [T]= sort(T)
[t,k] = size(T);
for  u = 1: k 
    for  v = 1: k - u 
        if (T(v) > T(v + 1)) 
           temp = T(v);
           T(v) = T(v + 1);
           T(v + 1) = temp;
        end
     end
end
end

