f = @(t) t.^2 + 2.^0.5 * (1-t) + 2 .* (1 + t) .* (1 + (1-t).^2).^0.5;

t = linspace(0, 1, N);

figure(1);
clf;
plot(t, f(t));
grid on;
grid minor;
xlabel('t = x/a');
ylabel('S/a^2');

format long;
tmin = fminbnd(f, 0, 1);
fmin = f(tmin);

hold all;
plot(tmin, fmin, 'or');
