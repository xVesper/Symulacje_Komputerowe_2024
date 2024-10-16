function logistic_with_noise()
    % Ustawienia
    r = 3.9; % Ustalona wartość r w zakresie chaotycznym
    x0 = 0.5; % Ustalona wartość początkowa
    n_iterations = 1000; % Liczba iteracji
    noise_magnitude = 0.01; % Magnituda szumu

    % Obliczanie wartości xt z szumem
    x = zeros(1, n_iterations);
    x(1) = x0;

    for t = 2:n_iterations
        noise = noise_magnitude * randn; % Generowanie losowego szumu
        x(t) = r * x(t-1) * (1 - x(t-1)) + noise; % Dodawanie szumu
        % Ograniczenie wartości do przedziału [0, 1]
        x(t) = max(0, min(1, x(t))); % Zapewnienie, że x pozostaje w granicach
    end

    % Wykres wyników
    figure;
    plot(x, 'b-', 'LineWidth', 1);
    title('Wpływ szumu na iteracje w modelu logistycznym (r = 3.9)');
    xlabel('Iteracja (t)');
    ylabel('x_t');
    xlim([1, n_iterations]);
    ylim([0, 1]);
    grid on;
end
