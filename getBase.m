function getBase()
%%
p = pwd;

archive = '\BasePAIM';

path = strcat(p,archive);

addpath(path);

drCoprops = zeros(13,7);
gCoprops = drCoprops;
hCoprops = drCoprops;
j = 1;
p = 1;

MeanArr = zeros(3, 13);

for i = 1:15
   if i ~=13 && i ~= 14
       drName = strcat('0', int2str(i),'_dr.jpg');
       I = imread(drName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
       Contrast = props.Contrast;
       Corr = props.Correlation;
       Energy = props.Energy;
       Hom = props.Homogeneity;
       Entropy = entropy(IG);
       Mean = mean2(IG);
       Var = var(var(double(IG)));
       Array = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var];
       
       MeanArr(1,j) = Mean;
       
       drCoprops(j,:) = Array;
       j = j + 1;
   
   else
       hName = strcat('0', int2str(i),'_h.jpg');
       I = imread(hName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Homogeneity'});
       Contrast = props.Contrast;
       Hom = props.Homogeneity;
       
       test1(p,:) = [Contrast, Hom];
       p = p + 1;

   end
   
end

j = 1;
p = 1;

for i = 1:15
   
   if i ~=13 && i ~= 14
       gName = strcat('0', int2str(i),'_g.jpg');
       I = imread(gName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
       Contrast = props.Contrast;
       Corr = props.Correlation;
       Energy = props.Energy;
       Hom = props.Homogeneity;
       Entropy = entropy(IG);
       Mean = mean2(IG);
       Var = var(var(double(IG)));
       
       MeanArr(2,j) = Mean;
       
       Array = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var];
       
       gCoprops(j,:) = Array;
       j = j + 1;
   
   else
       hName = strcat('0', int2str(i),'_h.jpg');
       I = imread(hName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Homogeneity'});
       Contrast = props.Contrast;
       Hom = props.Homogeneity;
       
       test2(p,:) = [Contrast, Hom];
       p = p + 1;

       
   end
   
end

j = 1;
p = 1;

for i = 1:15
    if i ~=13 && i ~= 14
       hName = strcat('0', int2str(i),'_h.jpg');
       I = imread(hName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
       Contrast = props.Contrast;
       Corr = props.Correlation;
       Energy = props.Energy;
       Hom = props.Homogeneity;
       Entropy = entropy(IG);
       Mean = mean2(IG);
       Var = var(var(double(IG)));
       
       MeanArr(3,j) = Mean;
       
       Array = [Contrast, Corr, Energy, Hom, Entropy, Mean, Var];
       
       hCoprops(j,:) = Array;
       j = j + 1;
    
    else
       hName = strcat('0', int2str(i),'_h.jpg');
       I = imread(hName);
       IG = rgb2gray(I);
       glcm = graycomatrix(IG,'numlevels',8);
       props = graycoprops(glcm, {'Contrast', 'Homogeneity'});
       Contrast = props.Contrast;
       Hom = props.Homogeneity;
       
       test3(p,:) = [Contrast, Hom];
       p = p + 1;

    end   
    
    
end

varMed = var(MeanArr.');

dr = corrcoef(drCoprops);
h = corrcoef(hCoprops);
g = corrcoef(gCoprops);

Vcat = vertcat([hCoprops(:,1),hCoprops(:,4)],[gCoprops(:,1),gCoprops(:,4)],[drCoprops(:,1),drCoprops(:,4)]);

targets = zeros(39,2);

targets(1:13,1) = 0; % Sano
targets(1:13,2) = 1;

targets(14:27,1) = 1; % Glaucoma
targets(14:27,2) = 0;

targets(28:39,1) = 1; % Diabetes
targets(28:39,2) = 1; % Diabetes

hcat = horzcat(Vcat,targets);

test = vertcat(test1,test2,test3);

testTargets(1:2,1) = 0; % Sano
testTargets(1:2,2) = 1;

testTargets(3:4,1) = 1; % Glaucoma
testTargets(3:4,2) = 0;

testTargets(5:6,1) = 1; % Diabetes
testTargets(5:6,2) = 1; % Diabetes

testCat = horzcat(test,testTargets);

% title = {'Contraste', 'Homogeneidad', 'Target'};
% 
% csvwrite('Red.csv',title);
% csvwrite('Red.csv',hcat);
% 
% csvwrite('Tester.csv',title);
% csvwrite('Tester.csv',testCat);
% 
% title = {'Contrast', 'Corr', 'Energy', 'Homogeneidad', 'Entropia', 'Media', 'Varianza'};
% %
% xlswrite('Database.xls', title, 'Diabetica', 'A1');
% xlswrite('Database.xls', drCoprops, 'Diabetica', 'A2');
% 
% xlswrite('Database.xls', title, 'Glaucoma', 'A1');
% xlswrite('Database.xls', gCoprops, 'Glaucoma', 'A2');
% 
% xlswrite('Database.xls', title, 'Sano', 'A1');
% xlswrite('Database.xls', hCoprops, 'Sano', 'A2');
% %
% xlswrite('Correlation.xls', title, 'Diabetica', 'B1');
% xlswrite('Correlation.xls', title.', 'Diabetica', 'A2');
% xlswrite('Correlation.xls', dr, 'Diabetica', 'B2');
% 
% xlswrite('Correlation.xls', title, 'Glaucoma', 'B1');
% xlswrite('Correlation.xls', title.', 'Glaucoma', 'A2');
% xlswrite('Correlation.xls', g, 'Glaucoma', 'B2');
% 
% xlswrite('Correlation.xls', title, 'Sano', 'B1');
% xlswrite('Correlation.xls', title.', 'Sano', 'A2');
% xlswrite('Correlation.xls', h, 'Sano', 'B2');

end