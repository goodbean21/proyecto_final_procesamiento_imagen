function getTextureBase()

%%
clear

n = 8;
j = 1;

p = pwd;

archive = '\TexturasPAIM\Proyecto Final PAIM';

path = strcat(p,archive);

addpath(path);

% Mezclilla
I1 = imread('mezclilla1.jpg');
I2 = imread('mezclilla2.jpg');
I3 = imread('agua2.jpg');

IG1 = rgb2gray(I1);
IG2 = rgb2gray(I2);
IG3 = rgb2gray(I3);

[m, n, ~] = size(IG1);

IG2r = imresize(IG2,[m n]);
IG3r = imresize(IG3,[m n]);

IG = cat(3,IG1, IG2r, IG3r);

gCoprops = zeros(3,8);

for i = 1:3
   glcm = graycomatrix(IG(:,:,i),'Numlevels',255);

   props = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
   Contrast = props.Contrast;
   Corr = props.Correlation;
   Energy = props.Energy;
   Hom = props.Homogeneity;
   Entropy = entropy(IG(:,:,i));
   Mean = mean2(IG(:,:,i));
   Var = var(var(double(IG(:,:,i))));
   Std = std2(IG(:,:,i));

   Array = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var, Std];
    
   gCoprops(j,:) = Array;
   j = j + 1;
   
end

LBP = cat(3,efficientLBP(IG(:,:,1)),efficientLBP(IG(:,:,2)),efficientLBP(IG(:,:,3)));
vectLBP = cat(3,extractLBPFeatures(IG(:,:,1)), extractLBPFeatures(IG(:,:,2)), extractLBPFeatures(IG(:,:,3)));

save('TextureBase.mat', 'gCoprops', 'LBP', 'vectLBP');

end