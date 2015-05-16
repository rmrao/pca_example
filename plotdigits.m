function plotdigits(vecs)
% Function to plot images that have been reshaped into vectors
figure(1)
num = min(50, size(vecs, 2));
for i = 1:num
    v = vecs(:,i)/max(vecs(:,i))*255;
    v = reshape(v, 243, 320); % replace this with dimensions of image
    subplot(ceil(num/5), 5, i);
    imshow(v, [0 255]) % Shows image as grayscale - replace for different image formats
end
end

