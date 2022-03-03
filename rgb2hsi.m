function f=rgb2hsi(p) %% rgbÍ¼Ïñ×ªÎªhsiÍ¼Ïñ
if size(p,3)==3
r=im2double(p(:,:,1));
g=im2double(p(:,:,2));
b=im2double(p(:,:,3));
[x,y]=size(r);
c=min(min(r,g),b);
for i=1:x
    for j=1:y
    if b(i,j)<=g(i,j)
        h(i,j)=acos((0.5*(2*r(i,j)-g(i,j)-b(i,j)))./sqrt(eps+((r(i,j)-g(i,j)).^2+(r(i,j)-b(i,j)).*(g(i,j)-b(i,j)))));
    else
        h(i,j)=2*pi-acos(0.5*(2*r(i,j)-g(i,j)-b(i,j))./sqrt(eps+((r(i,j)-g(i,j)).^2+(r(i,j)-b(i,j)).*(g(i,j)-b(i,j)))));
    end
    end
end
h=h./2./pi;
s=1-3.*c./(r+g+b);
i=(r+g+b)./3;
f=cat(3,h,s,i);
else
    disp('no answer');
end
end