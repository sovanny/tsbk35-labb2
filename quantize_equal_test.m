close all
a = -10
b = 20
x = a:0.1:b
%x = a + (b-a).*rand([1 1000]
plot(x,x)

x2 = quantize_equal(x,a,b,10)
figure
plot(x,x,x,x2)
