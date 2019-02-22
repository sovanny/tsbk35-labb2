close all
a = -10;
b = 20;
x = a:0.1:b
n_steps = 10;

[x2,stepsize] = quantize_equal(x,n_steps,a,b);
x3 = quantize_equal_simple(x,stepsize);
figure
plot(x,x,x,x2,x,x3)

figure
plot(x,x3)
