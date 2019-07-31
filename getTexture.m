function getTexture(~)
%%
p = pwd;

archive = '\TexturasPAIM\Proyecto Final PAIM';
archiveLBP = '\line efficientLBP';

path = strcat(p, archive);
path2 = strcat(p,archiveLBP);
out = 'mezclilla';
addpath(path);
addpath(path2);

I = imread('ImagenPRueba.jpg');

gray = rgb2gray(I);

[m, n, ~] = size(gray);

canvas = uint8(ones(m,n)*255);

Ire =  canvas - gray ;

bw = im2bw(Ire, 0.02);

bw = bwmorph(bw, 'clean');
bw = bwmorph(bw, 'hbreak');
bw = bwmorph(bw, 'fill');

bwProps = bwareaopen(bw, 200);

props = regionprops('table', bwProps, 'centroid');

cent = props.Centroid;

% figure,
% imshow(I)
% hold on
% plot(cent(:,1),cent(:,2), 'b*')
% hold off 

[m , ~, ~] = size(cent);

obj = uint8(bw).*Ire;

figure, imshow(I);
h = imrect;
rect = wait(h);
close

IG = imcrop(obj, rect);

glcm = graycomatrix(IG,'Numlevels',255);

props = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
Contrast = props.Contrast;
Corr = props.Correlation;
Energy = props.Energy;
Hom = props.Homogeneity;
Entropy = entropy(IG);
Mean = mean2(IG);
Var = var(var(double(IG)));
Std = std2(IG);

Array = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var, Std];
Array2 = zeros(size(Array));
b = true(1);
load('TextureBase.mat');

if(Array(1)> gCoprops(3,1) - 200 && Array(1)< gCoprops(3,1) + 200 && b)
    if(Array(6)> gCoprops(3,6) - 120 && Array(6)< gCoprops(3,6) + 120)
        if(Array(5)> gCoprops(3,5) - 4.3 && Array(5)< gCoprops(3,5) + 4.3)
            out = 'Agua';
            
            b = false(1);
            disp(out)

        end
    end
end
    
% if(Array(1)> 0 && Array(1)< gCoprops(1,1) + 500 && b)
%     if(Array(6)> gCoprops(1,6) - 50 && Array(6)< gCoprops(1,6) + 50)
%         if(Array(7)> gCoprops(1,7)- 2000 && Array(7)< gCoprops(1,7) + 2000)
%             out = 'Mezclilla1';
%             b = false(1);
% 
%             disp(out)
% 
%         end 
%     end
% end

% figure,
zero = zeros(121,121);
canvas = uint8(zeros(size(I)));

close all

for i = 1:m
    evalIm = imcrop(Ire, [round(cent(i,1) - 60), round(cent(i,2)-60) 120 120]);
    coMatrix = graycomatrix(evalIm, 'numlevels', 255);
    
    props = graycoprops(coMatrix,{'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
    Contrast = props.Contrast;
    Corr = props.Correlation;
    Energy = props.Energy;
    Hom = props.Homogeneity;
    Entropy = entropy(evalIm);
    Mean = mean2(evalIm);
    Var = var(var(double(evalIm)));
    Std = std2(evalIm);
    bw = imbinarize(evalIm);
    bw = imclose(bw, strel('disk', 1));
    euler = bweuler(bw);
    
    Array2 = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var, Std];
%     disp(Contrast)
%     imshow(evalIm)
%     disp('***')
%     disp(Array2(1) > Array(1) - 40 && Array2(1) < Array(1) + 40)
%     disp(Array2(6) > Arr9ay(6) - 2 && Array2(6) < Array2(6) + 2)
%     disp(Array2(5) > Array(5) - 1 && Array2(5) < Array(5)+1)
    
%     if(strcmp(out, 'Agua'))
%         if(Array2(1) > Array(1) - Array(1)*0.7 && Array2(1) < Array(1) + 0.7*Array(1))
%             if (Array2(6) > Array(6) - Array(6)*0.4 && Array2(6) < Array(6) + Array(6)*0.4)
%                 if(Array2(5) > Array(5) - Array(5)*0.47 && Array2(5) < Array(5) + Array(5)*0.47)
% %                     if(euler < 3)
%                         if(Array2(3) > Array(3)-Array(3)*2 && Array2(3) < Array(3)+Array(3)*2)
%                             outp = 'Agua Encontrada';
% 
%                             canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1);
%                             canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2);
%                             canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3);
%         %                     
% %                             disp(outp);
% %                         end
%                     end
%                 end
%             end
%         end
%     end

 if(strcmp(out, 'Agua'))
        if(Array2(1) > Array(1) - Array(1)*5  && Array2(1) < Array(1) + 5*Array(1))
            if (Array2(6) > Array(6) - Array(6)*5 && Array2(6) < Array(6) + Array(6)*5)
                if(Array2(8) > Array(8) - Array(8)*5 && Array2(8) < Array(8) + Array(8)*5)

%                 if(Array2(5) > Array(5) - Array(5)*0.47 && Array2(5) < Array(5) + Array(5)*0.47)
%                     if(euler < 3)
                        if(Array2(3) > Array(3)-Array(3)*10 && Array2(3) < Array(3)+Array(3)*10)
                            outp = 'Agua Encontrada';

                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3);
        %                     
%                             disp(outp);
%                         end
                    end
%                 end
            end
            end
    end
    else
        if(Array2(1) > Array(2) - Array(1)*0.1  && Array2(1) < Array(1) + 0.1*Array(1))
            if (Array2(6) > Array(6) - Array(6)*0.5 && Array2(6) < Array(6) + Array(6)*0.5)
                if(Array2(8) > Array(8) - Array(8)*0.5 && Array2(8) < Array(8) + Array(8)*0.55)

%                 if(Array2(5) > Array(5) - Array(5)*0.47 && Array2(5) < Array(5) + Array(5)*0.47)
%                     if(euler < 3)
                        if(Array2(3) > Array(3)-Array(3)*10 && Array2(3) < Array(3)+Array(3)*10)
                            outp = 'Agua Encontrada';

                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3);
        %                     
                            disp(out);
%                         end
                    end
%                 end
            end
            end
        end
    
end

figure,
imshow(canvas)

disp(out);

M = gCoprops;

clear out


end