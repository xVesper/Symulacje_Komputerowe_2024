function logistic_initial_conditions()
    % Ustawienia
    r_values = linspace(2.8, 4, 100); % 100 wartości r w przedziale [2.8, 4]
    n_iterations = 1000; % Liczba iteracji
    n_last = 500; % Liczba ostatnich iteracji do wykreślenia
    x0_values = [0.1, 0.5, 0.9]; % Wybrane wartości początkowe

    % Wykres mapy punktów dla różnych x0
    figure;
    hold on;
    colors = ['r', 'g', 'b']; % Kolory dla różnych wartości x0
    for j = 1:length(x0_values)
        x0 = x0_values(j);
        x_values = zeros(length(r_values), n_iterations);
        
        % Obliczanie wartości xt dla różnych r
        for i = 1:length(r_values)
            x_values(i, 1) = x0; % Ustawiamy wartość początkową
            for t = 2:n_iterations
                x_values(i, t) = r_values(i) * x_values(i, t-1) * (1 - x_values(i, t-1));
            end
        end
        
        % Rysujemy mapę punktów
        for i = 1:length(r_values)
            plot(r_values(i) * ones(1, n_last), x_values(i, end-n_last+1:end), '.', 'Color', colors(j), 'MarkerSize', 1);
        end
    end
    
    title('Wpływ wartości początkowych na mapę punktów dla modelu logistycznego');
    xlabel('r');
    ylabel('x_t');
    xlim([2.8, 4]);
    ylim([0, 1]);
    legend(arrayfun(@(x) sprintf('x0 = %.1f', x), x0_values, 'UniformOutput', false));
    hold off;
end
