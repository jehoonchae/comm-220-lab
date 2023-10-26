# ABM Simulation Code

## Introduction
This repository contains the R scripts and functions necessary for running an Agent-Based Modeling (ABM) simulation. The simulation explores the dynamics of information spread among agents within a network, considering various parameters like connectivity, influence rates, and the presence of a central hub. This project is ideal for those interested in network theory, social dynamics, or computational modeling.

## Installation and Setup
**Dependencies:**
- R environment (Version 3.5.0 or later recommended).
- R packages: igraph, ggplot2, colorspace.

**Setup Instructions:**
1. Clone or download the repository to your local machine.
2. Install the required R packages using the following command in R:
   ```R
   install.packages(c("igraph", "ggplot2", "colorspace"))

## Usage
The codebase is split into two main scripts: `functions.R` and `simulate_and_plot.R`.

### `functions.R`
This script contains all the essential functions for the simulation, including network creation, simulation execution, and data visualization. Functions include:

- `run_model`: Executes the simulation model over a number of rounds.
- `make_connections`: Generates a connection matrix for the agent network.
- `plot_history`: Visualizes the history of agent states over simulation rounds.
- `plot_graph`: Creates a graph visualization of the agent network.

### `simulate_and_plot.R`
Responsible for running simulations under various conditions and visualizing the outcomes. Key components:

- `run_simulation`: Sets up and executes the simulation with specific parameters.
- `plot_results`: Visualizes the simulation results in a comprehensive manner.

### Example Usage
```R
# Run a simulation where the hub has information and 30 connections
simulation_result1 <- run_simulation(TRUE, 30)
# Plot the results
plot_results(simulation_result1$connection_matrix, simulation_result1$history, alpha(rainbow(40), .25))
