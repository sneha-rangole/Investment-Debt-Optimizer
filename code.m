
close all
% Define the objective function coefficients
f = [-0.15, 0.70]; % Coefficients for I (investment) and D (debt)

% Define the constraint matrix and vector
A = [1, 0; 0.5, -1; 1, 1]; % Coefficients for I (investment) and D (debt)
b = [1e6; 0; 400000]; % Constraint limits

% Define lower and upper bounds for variables
lb = [0; 0]; % Lower bounds for I and D
ub = [1e6; 1e6]; % Upper bounds for I and D

% Solve the linear programming problem
[x, fval, exitflag] = linprog(-f, A, b, [], [], lb, ub);

if exitflag == 1
    % Extract the solution values
    I_solution = x(1); % Investment
    D_solution = x(2); % Debt

    % Display the optimal solution
    fprintf('Optimal Investment (I): $%.2f\n', I_solution);
    fprintf('Optimal Debt (D): $%.2f\n', D_solution);
    fprintf('Optimal NPV: $%.2f\n', -fval);
    
    % Plotting
    
    % Data: Example of different types of investments in the college
    investment_types = {'Infrastructure', 'Faculty Development', 'Research', 'Student Services'};
    investment_amounts = [100000, 200000, 300000, 400000];
    debt_amounts = [50000, 100000, 150000, 200000];

    % Bar plot with custom colors and styles
    figure;
    bar(investment_amounts, 'FaceColor', [0.2 0.4 0.6], 'EdgeColor', 'none', 'LineWidth', 1.5);
    hold on;
    bar(debt_amounts, 'FaceColor', [0.8 0.2 0.2], 'EdgeColor', 'none', 'LineWidth', 1.5);
    title('Optimal Investment and Debt Allocation');
    xlabel('Investment Type'); % X-axis label
    ylabel('Amount ($)'); % Y-axis label
    legend({'Investment', 'Debt'}, 'Location', 'northwest'); % Add legend
    grid on;

    % Customize axis ticks and labels
    xticks(1:numel(investment_amounts));
    xticklabels(investment_types);
    ylim([0, max(max(investment_amounts), max(debt_amounts)) + 50000]); % Adjust y-axis limit

    % Add description below x-axis label
    annotation('textbox', [0.1, 0, 0.8, 0.05], 'String', ...
        {'Bar plot: Visualizes the optimal allocation of investment and debt'}, ...
        'FitBoxToText', 'on', 'EdgeColor', 'none', 'HorizontalAlignment', 'center');

    % Define the objective function range
    I_range = linspace(0, 1e6, 100); % Investment range
    D_range = linspace(0, 0.5e6, 100); % Debt range
    [I_grid, D_grid] = meshgrid(I_range, D_range);
    NPV = 0.70 * D_grid - 0.15 * I_grid;

    % Contour plot
    figure;
    contourf(I_grid, D_grid, NPV, 20, 'LineWidth', 1.5);
    title('Optimal NPV Contour Plot');
    xlabel('Investment ($)');
    ylabel('Debt ($)');

    % Display optimal NPV
    hold on;
    plot(I_solution, D_solution, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    text(I_solution, D_solution, sprintf('Optimal NPV: $%.2f', -fval), ...
        'FontSize', 12, 'VerticalAlignment', 'bottom', ...
        'HorizontalAlignment', 'right', 'Color', 'black');
    hold off;

    % Add colorbar for NPV levels
    colorbar;
    caxis([min(NPV(:)), max(NPV(:))]);

    % Add description
    annotation('textbox', [0.1, 0.005, 0.8, 0.05], 'String', ...
        {'Contour plot: Visualizes the impact of investment and debt on NPV'}, ...
        'FitBoxToText', 'on', 'EdgeColor', 'none', 'HorizontalAlignment', 'center');

    % 3D surface plot: Displays the NPV function in 3D
    figure;
    surf(I_grid, D_grid, NPV);
    hold on;
    plot3(I_solution, D_solution, -fval, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    text(I_solution, D_solution, -fval, sprintf('Optimal NPV: $%.2f', -fval), ...
        'FontSize', 12, 'VerticalAlignment', 'bottom', ...
        'HorizontalAlignment', 'right', 'Color', 'black');
    hold off;
    title('3D Surface Plot of NPV');
    xlabel('Investment ($)');
    ylabel('Debt ($)');
    zlabel('NPV ($)');

    % Add description
    annotation('textbox', [0.1, 0.005, 0.8, 0.05], 'String', ...
        {'3D surface plot: Displays the NPV function in 3D'}, ...
        'FitBoxToText', 'on', 'EdgeColor', 'none', 'HorizontalAlignment', 'center');

    % Scatter plot: Shows feasible solutions on a 3D scatter plot
    feasible_points = A * x <= b; % Check feasibility
    feasible_I = I_grid(feasible_points);
    feasible_D = D_grid(feasible_points);
    feasible_NPV = NPV(feasible_points);
    figure;
    scatter3(feasible_I, feasible_D, feasible_NPV, 'filled');
    title('Scatter Plot of Feasible Solutions');
    xlabel('Investment ($)');
    ylabel('Debt ($)');
    zlabel('NPV ($)');

    % Add description
    annotation('textbox', [0.1, 0.005, 0.8, 0.05], 'String', ...
        {'Scatter plot: Shows feasible solutions on a 3D scatter plot'}, ...
        'FitBoxToText', 'on', 'EdgeColor', 'none', 'HorizontalAlignment', 'center');
else
    fprintf('Optimization failed.\n');
end