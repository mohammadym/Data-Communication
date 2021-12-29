%Project2 - 96462104 - mohammad yarmoghadam

clc
clear
%STEP 2
[input_data, fps] = audioread('temp.wav');
%STEP 3
%print input data
fprintf('data: %1.8g\n',input_data) 
fprintf("-------------------End of input data-------------------\n")
% get fps rate(frame per second)
fprintf("Frame per second (Fs in the question): %d\n", fps)
%get size of input data 
fprintf("Data size: %d\n", size(input_data))
fprintf("-----------End of Printing fps and size-----------\n")
%STEP 4
histogram(input_data, 'FaceColor', 'blue');
grid on;
%Getting first channel of input data
%Input wav file has two channels and we need 1D dimensional array
data_1 = input_data(:,1);
probability = hist(data_1)/sum(hist(data_1));
size_of_probs = size(probability)
fprintf("Probablity : \n")
disp(probability)
%Get sum of all probs
fprintf("Total probability: %d\n", sum(probability))
fprintf("-------------End of Printing Probs-------------\n")
enthropy = -sum(probability .* log2(probability));
fprintf("Enthropy: %d\n", enthropy)
%STEP 5
fprintf("-----------End of Enthropy calculations-----------\n")
disp(hist(data_1));
%display histogram of first channel of data
dict = huffmandict(hist(data_1),probability);
sig = randsrc(268237,1,[hist(data_1);probability]);
%Calculate size of compressed file
comp = huffmanenco(sig,dict);
% convert to rows
fprintf("huffman compressed encode: %d\n", comp)
comp = comp';
audiowrite('compressed_temp.wav', comp, fps);


