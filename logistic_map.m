function logistic_map()
    % Ustawienia
    x0 = 0.5; % Ustalona wartość początkowa
    r_values = linspace(2.8, 4, 100); % 100 wartości r w przedziale [2.8, 4]
    n_iterations = 1000; % Liczba iteracji
    n_last = 500; % Liczba ostatnich iteracji do wykreślenia

    % Wektor do przechowywania wyników
    x_values = zeros(length(r_values), n_iterations);
    
    % Obliczanie wartości xt dla różnych r
    for i = 1:length(r_values)
        x_values(i, 1) = x0; % Ustawiamy wartość początkową
        for t = 2:n_iterations
            x_values(i, t) = r_values(i) * x_values(i, t-1) * (1 - x_values(i, t-1));
        end
    end

    % Wykres mapy punktów
    figure;
    hold on;
    % Rysujemy tylko ostatnie n_last iteracji
    for i = 1:length(r_values)
        plot(r_values(i) * ones(1, n_last), x_values(i, end-n_last+1:end), 'k.', 'MarkerSize', 1);
    end
    title('Mapa punktów dla modelu logistycznego');
    xlabel('r');
    ylabel('x_t');
    xlim([2.8, 4]);
    ylim([0, 1]);
    hold off;
end
