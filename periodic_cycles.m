function periodic_cycles()
    % Ustawienia
    r_values = linspace(2.8, 4, 1000); % Wartości r do analizy
    n_iterations = 1000; % Liczba iteracji
    n_last = 500; % Liczba ostatnich iteracji do analizy
    x0 = 0.5; % Ustalona wartość początkowa

    % Przechowywanie wyników
    cycles = zeros(length(r_values), 1); % Zmienna do przechowywania długości cyklu

    for i = 1:length(r_values)
        % Obliczanie wartości xt
        x = zeros(1, n_iterations);
        x(1) = x0;
        for t = 2:n_iterations
            x(t) = r_values(i) * x(t-1) * (1 - x(t-1));
        end

        % Analiza ostatnich n_last iteracji w celu znalezienia cyklu
        last_values = x(end-n_last+1:end);
        unique_values = unique(last_values);
        if length(unique_values) == 2
            cycles(i) = 2; % Cykl o długości 2
        elseif length(unique_values) == 4
            cycles(i) = 4; % Cykl o długości 4
        elseif length(unique_values) == 8
            cycles(i) = 8; % Cykl o długości 8
        end
    end

    % Wykres
    figure;
    hold on;
    plot(r_values(cycles == 2), zeros(sum(cycles == 2), 1), 'r.', 'MarkerSize', 10, 'DisplayName', 'Cykl o długości 2');
    plot(r_values(cycles == 4), zeros(sum(cycles == 4), 1), 'g.', 'MarkerSize', 10, 'DisplayName', 'Cykl o długości 4');
    plot(r_values(cycles == 8), zeros(sum(cycles == 8), 1), 'b.', 'MarkerSize', 10, 'DisplayName', 'Cykl o długości 8');
    title('Okresowe cykle w modelu logistycznym');
    xlabel('r');
    ylabel('Długość cyklu');
    yticklabels([]); % Ukrycie etykiet osi y
    xlim([2.8, 4]);
    legend show;
    hold off;
end
