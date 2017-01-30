% function fractscape(npow,vari,water)
% Eg: 9,1000,4
npow = 8;
vari = 1000;
water = 10000;
    grids = 2^npow;
    map = double(zeros(grids,grids));
    map(1,1) = rand*vari;
    map(grids,1) = rand*vari;
    map(1,grids) = rand*vari;
    map(grids,grids) = rand*vari;
    
    map = iterate(map,1,1,grids,grids);
    map = map(1:end-1,1:end-1);
    mesh(map)
    h1 = max(max(map));
    h2 = min(min(map));

    newmap = (map > (h2+(h1-h2)/water)).*map + (map < (h2+(h1-h2)/water)).*(h2+(h1-h2)/water);
    mesh(newmap,'FaceColor','interp','FaceLighting','none')
    camlight headlight
    colormap('jet')
    
%     img = imread('D:\IMPORTANT\Programs New\Fractal landscape\overlay.jpg');
%     Pd = img(1:grids,1:grids,:);
%     % Collect quantized colors for point display
%     Colors = Pd(1:1:size(Pd,1),1:1:size(Pd,2),:);
%     Colors = reshape(Colors,[size(Colors,1)*size(Colors,2) size(Colors,3)]);
%     cfac = 20;
%     C8 = round(cfac*Colors);
%     [U,I,J] = unique(C8,'rows');
%     C8 = C8/cfac;
% 
%     figure(2), clf, hold on, axis equal;
%     for i=1:size(U,1)
%         plot3(-Pd(1,J==i),-Pd(3,J==i),-Pd(2,J==i),'.','Color',C8(I(i),:));
%     end
%     view(161,14), grid on;
%     xlabel('x (meters)'), ylabel('z (meters)'), zlabel('y (meters)');
    
    
%     lighting FLAT sets the lighting of the current graph to flat.
%     lighting GOURAUD sets the lighting to gouraud.
%     lighting PHONG sets the lighting to phong.
%     lighting NONE turns off lighting.

%     hsv        - Hue-saturation-value color map.
%     hot        - Black-red-yellow-white color map.
%     gray       - Linear gray-scale color map.
%     bone       - Gray-scale with tinge of blue color map.
%     copper     - Linear copper-tone color map.
%     pink       - Pastel shades of pink color map.
%     white      - All white color map.
%     flag       - Alternating red, white, blue, and black color map.
%     lines      - Color map with the line colors.
%     colorcube  - Enhanced color-cube color map.
%     vga        - Windows colormap for 16 colors.
%     jet        - Variant of HSV.
%     prism      - Prism color map.
%     cool       - Shades of cyan and magenta color map.
%     autumn     - Shades of red and yellow color map.
%     spring     - Shades of magenta and yellow color map.
%     winter     - Shades of blue and green color map.
%     summer     - Shades of green and yellow color map.
% end