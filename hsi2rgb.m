function c=hsi2rgb(p) %% hsiÍ¼Ïñ×ª»»ÎªrgbÍ¼Ïñ
h=im2double(p(:,:,1)).*2.*pi;
h1=im2double(p(:,:,1)).*2.*pi;
h2=im2double(p(:,:,1)).*2.*pi;
s=im2double(p(:,:,2));
i=im2double(p(:,:,3));
[x,y]=size(h);
r=zeros(x,y);
g=zeros(x,y);
b=zeros(x,y);
for k=1:x
    for j=1:y
if h(k,j)<=2*pi/3 && 0<h(k,j)
    b(k,j)=i(k,j)*(1-s(k,j));
    r(k,j)=i(k,j)*(1+(s(k,j)*cos(h(k,j)))/cos(pi/3-h(k,j)));
    g(k,j)=3*i(k,j)-(r(k,j)+b(k,j));
elseif h(k,j)<=4*pi/3 && 2*pi/3<h(k,j)
    h(k,j)=h(k,j)-2*pi/3;
    r(k,j)=i(k,j)*(1-s(k,j));
    g(k,j)=i(k,j)*(1+(s(k,j)*cos(h(k,j)))/cos(pi/3-h(k,j)));
    b(k,j)=3*i(k,j)-(r(k,j)+g(k,j));
elseif h(k,j)<=2*pi && 4*pi/3<h(k,j)
    h(k,j)=h(k,j)-4*pi/3;
    g(k,j)=i(k,j)*(1-s(k,j));
    b(k,j)=i(k,j)*(1+(s(k,j)*cos(h(k,j)))/cos(pi/3-h(k,j)));
    r(k,j)=3*i(k,j)-(b(k,j)+g(k,j));
end
    end
end
c=cat(3,r,g,b);
end