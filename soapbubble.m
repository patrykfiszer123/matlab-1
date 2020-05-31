% Szukanie minimum funkji jednej zmiennej.

% Bańka mydlana rozpięta na drucianym szkielecie w kształcie krawędzi sześcianu
% przyjmuje dość złożony kształt: wewnątrz bańki jest niewielki, kwadratowy,
% fragment, od niego rozchodzą się trójkątne i trapezowe powierzchnie kończące
% się na krawędziach. Jeżeli długość boku sześcianu wynosi a, długość x boku
% wspomnianego fragmentu, to możemy obliczyć pole powierzchni S. Rzeczywista
% błonka mydlana będzie miała takie x aby S było jak najmniejsze (minimalne).
% Można przeskalować problem dzieląc przez a^2. Zamiast pola obliczać będziemy
% S/a^2, zamiast x będziemy mieli bezwymiarowe t = x / a, takie że 0 <= t <= 1.
%
% Po nudnych rachunkach dojdziemy do wzoru takiego jak poniżej. 
% Uwaga: błonka ma dwie strony - jeżeli chcemy to uwzględnić to pierwszy
% składnik (pole kwadratu) liczymy dwa razy, co daje 2 * t.^2 itd.

% Definicja funkcji anonimowej.
%
f = @(t) 2 * t.^2 + 2 * 2.^0.5 * (1-t) + 4 .* (1 + t) .* (1 + (1-t).^2).^0.5;

% Zaczynamy od wykreślenia przebiegu funkcji - pozwoli to zorientować się z czym
% mamy do czynienia - a nawet oszacować gdzie jej szukane minimum funkcji f(t).

N = 1000;  % liczba punktów
t = linspace(0, 1, N);  % wartości zmiennej niezależnej

figure(1);      % Uwidocznienie okna w którym będzie rysowany wykres.
clf;            % Usunięcie całej poprzedniej zawartości (jeżeli była),
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
