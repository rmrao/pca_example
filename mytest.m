%% Load Data:
% Reads data from yalefaces directory and stores it in data
fnames = dir('yalefaces/subject*');
numfids = length(fnames);
data = zeros(numfids, 77760);
for i = 1:numfids
    mat = imread(strcat(['yalefaces/' fnames(i).name]));
    data(i,:) = mat(:)';
end

%% PCA + Display Eigenvectors
impvecs = pca(data);
plotdigits(impvecs)