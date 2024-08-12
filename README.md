# Optimization of College Investment Strategy

## Overview
This project involves developing an optimization model using linear programming for a small college in Maine. The goal is to determine the optimal amount of investment and debt to undertake to maximize the net present value (NPV) for the next year.

## Problem Statement
A small college in Maine needs to decide how much investment and debt to undertake during the next year. Each dollar invested reduces the NPV of the college by 15 cents, while each dollar of debt increases the NPV by 70 cents. The college can invest at most $1 million, and debt can be at most 50% of the investment. Given that the college has $400,000 in cash available, the objective is to maximize NPV.

## Methodology
1. **Linear Programming**: Used to find the optimal allocation of investments and debt.
2. **Objective Function**:  
   Maximize NPV = 0.70D - 0.15I  
   where:
   - D = debt
   - I = investments

3. **Constraints**:
   - Investment limit: I ≤ $1,000,000
   - Debt limit: D ≤ 0.5I
   - Available cash constraint: D + I ≤ $400,000 + I

## Implementation
- **Language**: MATLAB
- **Algorithm**: Interior-Point-Legacy Algorithm

### Steps
1. Define the objective function coefficients.
2. Set up the constraint matrix and vector.
3. Solve the linear programming problem using the `linprog` function.
4. Visualize results using various plots (bar, contour, 3D surface, scatter).

## Results
- **Optimal Investment (I)**: $0.00
- **Optimal Debt (D)**: $400,000.00
- **Optimal NPV**: $280,000.00

### Visualizations
- Bar Plot: Displays optimal allocation of investment and debt.
- Contour Plot: Shows the impact of investment and debt on NPV.
- 3D Surface Plot: Illustrates the NPV function in three dimensions.
- Scatter Plot: Represents feasible solutions for investment and debt.

## Conclusion
This optimization model provides insights into the financial decision-making process for the college, demonstrating that borrowing money may be more beneficial than investing, given the current financial constraints.

## References
1. A. B. Levy. The Basics of Practical Optimization. Johns Hopkins University Press, Baltimore, 2013.
2. J. Nocedal and S. J. Wright. Numerical Optimization, 2nd edition. Springer, New York, 2006.
3. MATLAB Documentation: [MathWorks](https://www.mathworks.com/help/matlab/)
