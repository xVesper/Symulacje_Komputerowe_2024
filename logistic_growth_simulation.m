function logistic_growth_simulation()
    % Ustawienia
    iterations_1 = 100;
    iterations_2 = 10000;

    % Zadanie 1a: r = 1.1, pięć losowych wartości x0
    r1 = 1.1;
    x0_values_1 = rand(1, 5); % 5 losowych wartości w (0, 1)
    figure;
    hold on;
    for x0 = x0_values_1
        xt = logistic_growth(r1, x0, iterations_1);
        plot(xt, 'DisplayName', sprintf('x0 = %.2f', x0));
    end
    title('Zachowanie iteracji logistycznej dla r = 1.1');
    xlabel('t');
    ylabel('x_t');
    legend show;
    hold off;

    % Zadanie 1b: r = 3, pięć losowych wartości x0
    r2 = 3;
    x0_values_2 = rand(1, 5); % 5 losowych wartości w (0, 1)
    figure;
    hold on;
    for x0 = x0_values_2
        xt = logistic_growth(r2, x0, iterations_1);
        plot(xt, 'DisplayName', sprintf('x0 = %.2f', x0));
    end
    title('Zachowanie iteracji logistycznej dla r = 3');
    xlabel('t');
    ylabel('x_t');
    legend show;
    hold off;

    % Zadanie 1c: r = 3.9, dwa losowe wartości x0
    r3 = 3.9;
    x0_values_3 = rand(1, 2); % 2 losowe wartości w (0, 1)
    figure;
    hold on;
    for x0 = x0_values_3
        xt = logistic_growth(r3, x0, iterations_2);
        plot(xt, 'DisplayName', sprintf('x0 = %.2f', x0));
    end
    title('Zachowanie iteracji logistycznej dla r = 3.9');
    xlabel('t');
    ylabel('x_t');
    legend show;
    hold off;
end

function xt = logistic_growth(r, x0, n)
    % Funkcja obliczająca kolejne iteracje dla wzrostu logistycznego
    xt = zeros(1, n);
    xt(1) = x0;
    for t = 2:n
        xt(t) = r * xt(t-1) * (1 - xt(t-1));
    end
end
