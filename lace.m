function F=lace(g)
z=[0 1 0;1 -4 1;0 1 0];
g_r=im2double(g);
x=size(g,1);y=size(g,2);
picure=zeros(x+2,y+2);
picure_s=zeros(x,y);
for i=2:x+1
    for j=2:y+1
    picure(i,j)=g_r(i-1,j-1);
    end
end
for i=2:x+1
    for j=2:y+1
    picure_s(i-1,j-1)=picure(i-1,j-1)*z(1,1)+picure(i,j-1)*z(2,1)+picure(i+1,j-1)*z(3,1)+picure(i-1,j)*z(1,2)+picure(i,j)*z(2,2)+picure(i+1,j)*z(3,2)+picure(i-1,j+1)*z(1,3)+picure(i,j+1)*z(2,3)+picure(i+1,j+1)*z(3,3);
    end
end
F=im2uint8(picure_s);
end