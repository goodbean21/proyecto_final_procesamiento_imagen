function segmentTexture()
%%

n = 8;
j = 1;

p = pwd;

archive = '\TexturasPAIM\Proyecto Final PAIM';

path = strcat(p,archive);

addpath(path);

I = imread('Formas.jpg');

IC = imcrop(I);

getTexture(I);

end