clear;
close all;
clc;

ref_img = imread('frame.jpg');
ref_img_gray = rgb2gray(ref_img);
ref_pts = detectSURFFeatures(ref_img_gray);
[ref_features, ref_validPts] = extractFeatures(ref_img_gray, ref_pts); 

figure;
imshow(ref_img_gray);
hold on;
plot(ref_pts.selectStrongest(50));

%% 25 caracteristicas mas representativas

figure;
subplot(5,5,3);
for i=1:25
    scale = ref_pts(i).Scale;
    image = imcrop(ref_img, [ref_pts(i).Location-10*scale 20*scale 20*scale]);
    subplot(5,5,i);
    imshow(image);
    hold on;
    rectangle('Position', [5*scale 5*scale 10*scale 10*scale]);
end

%% Comparacion de imagenes

image = imread('frame2.jpg');
I = rgb2gray(image);

I_pts = detectSURFFeatures(I);
[I_features, I_validPts] = extractFeatures(I, I_pts);
figure;
imshow(image);
hold on;
plot(I_pts.selectStrongest(50));

%%

index_pairs = matchFeatures(ref_features, I_features);

ref_matched_pts = ref_validPts(index_pairs(:,1)).Location;
I_matched_pts = I_validPts(index_pairs(:,2)).Location;

figure;
ax = axes;
showMatchedFeatures(image, ref_img, I_matched_pts, ref_matched_pts, 'montage','Parent',ax);