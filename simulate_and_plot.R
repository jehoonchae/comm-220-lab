# Define the simulation function
run_simulation <- function(hub_has_info, 
                           hub_connections,
                           n_agents = 40,
                           influence_rate = .2,
                           connectedness = 1,
                           seed = 2023) {
  
  set.seed(seed)
  have_info = n_agents * .1
  rounds_of_interaction = n_agents * 20
  
  agent_states = rep(0, n_agents)
  
  if (hub_has_info) {
    agent_states[1] = 1
    agent_states[-1][sample(1:(n_agents - 1), (have_info - 1))] = 1
  } else {
    agent_states[1] = 0
    agent_states[-1][sample(1:(n_agents - 1), have_info)] = 1
  }
  
  n_delete = round((1 - connectedness) * n_agents ^ 2)
  connection_matrix = make_connections(n_agents, 
                                       n_delete = n_delete, 
                                       type = 'circle')
  
  for (i in sample(2:40, hub_connections)) {
    connection_matrix[1, i] = 1
  }
  
  edge_list = which(connection_matrix > 0, arr.ind = TRUE)
  
  history = run_model(
    agent_states = agent_states,
    edge_list = edge_list,
    rounds_of_interaction = rounds_of_interaction,
    influence_rate = influence_rate
  )
  
  result <- list(connection_matrix = connection_matrix, history = history)
  return(result)
}

# Define the function to plot the results
plot_results <- function(connection_matrix, history, colors) {
  par(mfrow = c(2, 2))
  
  plot_graph(connection_matrix, history[1, ], colors)
  plot_graph(connection_matrix, history[nrow(history), ], colors)
  
  plot_history(
    history,
    colors = colors,
    line_width = 3,
    line_type = 'l',
    y_axis_range = c(0, 1)
  )
  plot(
    rowMeans(history),
    type = 'l',
    ylim = c(0, 1),
    xlab = 'Iteration',
    ylab = 'Average state'
  )
}

# Now run the simulation for one of the cases and store the result:
simulation_result1 <- run_simulation(TRUE, 30)  # For example, Case 1: Hub has info, 20 connections
simulation_result2 <- run_simulation(TRUE, 5)  # Case 2: Hub has info, 5 connections
simulation_result3 <- run_simulation(FALSE, 30)  # Case 3: Hub has no info, 20 connections
simulation_result4 <- run_simulation(FALSE, 5)  # Case 4: Hub has no info, 5 connections

plot_results(simulation_result1$connection_matrix,
             simulation_result1$history,
             alpha(rainbow(40), .25))
plot_results(simulation_result2$connection_matrix,
             simulation_result2$history,
             alpha(rainbow(40), .25))
plot_results(simulation_result3$connection_matrix,
             simulation_result3$history,
             alpha(rainbow(40), .25))
plot_results(simulation_result4$connection_matrix,
             simulation_result4$history,
             alpha(rainbow(40), .25))

