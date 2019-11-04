
x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
plot(x,d, 'kx');

w11 = randn(1);
w12 = randn(1);
w13 = randn(1);
w14 = randn(1);
w15 = randn(1);
b11= randn(1);
b12= randn(1);
b13= randn(1);
b14= randn(1);
b15= randn(1);

w21 = randn(1);
w22 = randn(1);
w23 = randn(1);
w24 = randn(1);
w25 = randn(1);
b21= randn(1);


e = zeros(1,20);
y_final = zeros (1,20);
n= 0.1;
for i=1:length(x)
    y_1 = 1/(1+exp(-x(i)* w11 - b11));
    y_2 = 1/(1+exp(-x(i)* w12 - b12));
    y_3 = 1/(1+exp(-x(i)* w13 - b13));
    y_4 = 1/(1+exp(-x(i)* w14 - b14));
    y_5 = 1/(1+exp(-x(i)* w15 - b15));
    y_final(i) = y_1 * w21 + y_2 * w22 + y_3 * w23 + y_4 * w24 + y_5 * w25 + b21;
    
    % Errors calcualtion
    
    e(i) = d(i) - y_final(i);
    
    % Weight update
    % Output layer
    
    w21 = w21 + n * e(i)* y_1;
    w22 = w22 + n * e(i)* y_2;
    w23 = w23 + n * e(i)* y_3;
    w24 = w24 + n * e(i)* y_4;
    w25 = w25 + n * e(i)* y_5;
    b21 = b21 + n * e(i)* 1;
    
    % Hidden layer
    % deltas
    delta1 = (1/(1+exp(-x(i)*w11-b11)))*(1-1/(1+exp(-x(i)*w11-b11))) * e(i) * w21;
    delta2 = (1/(1+exp(-x(i)*w12-b12)))*(1-1/(1+exp(-x(i)*w12-b12))) * e(i) * w22;
    delta3 = (1/(1+exp(-x(i)*w13-b13)))*(1-1/(1+exp(-x(i)*w13-b13))) * e(i) * w23;
    delta4 = (1/(1+exp(-x(i)*w14-b14)))*(1-1/(1+exp(-x(i)*w14-b14))) * e(i) * w24;
    delta5 = (1/(1+exp(-x(i)*w15-b15)))*(1-1/(1+exp(-x(i)*w15-b15))) * e(i) * w25;
    
    % updating wieghts
    w11 = w11 + n * delta1 * x(i);
    w12 = w12 + n * delta2 * x(i);
    w13 = w13 + n * delta3 * x(i);
    w14 = w14 + n * delta4 * x(i);
    w15 = w15 + n * delta5 * x(i);
    
    %updating b
    b11 = b11 * n * delta1;
    b12 = b12 * n * delta2;
    b13 = b13 * n * delta3;
    b14 = b14 * n * delta4;
    b15 = b15 * n * delta5;
    
    
end

pause();
% plot(x,d, 'kx');
plot (x, y_final, 'kx');
