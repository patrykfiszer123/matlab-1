% Szukanie minimum funkcji jednej zmiennej.

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

% Definicja funkcji f(t) obliczającej pole (wyrażone w jednostach a^2)
% powierzchni błonki mydlanej. Użyliśmy funkcji anonimowej (w Matlab'ie),
% bo jest to dość prosta zależność, nie chcieliśmy tworzyć dodatkowego pliku,
% a nie mogliśmy użyć funkcji lokalnych (bo to niemożliwe w skryptach)
% i nie chcieliśmy przekształcać skryptu w funkcję.
%
f = @(t) 2 * t.^2 + 2 * 2.^0.5 * (1-t) + 4 .* (1 + t) .* (1 + (1-t).^2).^0.5;

% Zaczynamy od wykreślenia przebiegu funkcji - pozwoli to zorientować się z czym
% mamy do czynienia - a nawet oszacować gdzie jej szukane minimum funkcji f(t).

N = 1000;  % liczba punktów
t = linspace(0, 1, N);  % wartości zmiennej niezależnej

figure(1);          % Uwidocznienie okna w którym będzie rysowany wykres.
clf;                % Usunięcie całej poprzedniej zawartości (jeżeli była).
plot(t, f(t));      % Narysowanie wykresu funkcji.
grid on;            % Włączenie siatki na wykresie ułatwiającej odczyt wartości.
grid minor;         % Włączenie drobnej siatki na wykresie.
xlabel('t = x/a');  % Opis dla osi odciętych.
ylabel('S/a^2');    % Opis dla osi rzędnych.

% Obliczenia numeryczne.

format long;              % Włączenie pokazywania wszystkich cyfr wyników.
tmin = fminbnd(f, 0, 1);  % Znalezienie minimum.
fmin = f(tmin);           % Obliczenie wartości funkcji dla tmin.

% Prezentacja wyników obliczeń.

hold all;                % Wyłączenie wymazywania poprzedniego wykresu.
plot(tmin, fmin, 'or');  % Dorysowanie wykresu złożonego z jednego punktu.
