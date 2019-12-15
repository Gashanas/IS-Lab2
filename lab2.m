
x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
% plot();

% plot(x,d, 'kx');
% pause();

w1 = [randn(1) randn(1) randn(1) randn(1) randn(1)];
w2 = [randn(1) randn(1) randn(1) randn(1) randn(1)];
b1 = [randn(1) randn(1) randn(1) randn(1) randn(1)];
b21= randn(1);


e = zeros(1,20);
y_final = zeros (1,20);
n= 0.1;
y = (length(w1));
delta = (length(w1));

for i=1:length(x)
    for j=1:length(w1)
        y(j) = 1/(1+exp(-x(i)* w1(j) - b1(j)));
        y_final(i) = y(j) * w2(j) + y_final(i);
    end
    y_final(i) = y_final(i) + b21;
    
    % Errors calcualtion
    
    e(i) = d(i) - y_final(i);
    
    % Weight update
    % Output layer
    for j=1:length(w1)
        w2(j) = w2(j) + n * e(i) * y(j);
    end
    b21 = b21 + n * e(i)* 1;
    
    % Hidden layer
    % deltas
    for j=1 : length(w1)
        delta(j) = (1/(1+exp(-x(i)*w1(j)-b1(j))))*(1-1/(1+exp(-x(i)*w1(j)-b1(j)))) * e(i) * w2(j);
    end
    % updating wieghts
    for j=1:length(w1)
        w1(j) = w1(j) + n * delta(j) * x(i);
        %updating b
        b1(j) = b1(j) * n * delta(j);
    end
    
end

% plot(x,d, 'kx');
plot (x,d, 'ko', x, y_final, 'r*');
