# Advantage of BLoC

- Change 2 state but only rerender once.

  Content without BLoC

  ![a](./assets/Screenshot%202023-11-23%20at%2000.11.24.png)

  Content with BLoC

  ![b](./assets/Screenshot%202023-11-23%20at%2000.11.48.png)

# Disadvantage of BLoC

- Can't pass Binding to a View

  Content without BLoC

  ![c](./assets/Screenshot%202023-11-23%20at%2018.39.42.png)

  Content with BLoC

  ![d](./assets/Screenshot%202023-11-23%20at%2018.38.27.png)

# Engineering Principles

1. 1 thing in 1 file

   ![e](./assets/Screenshot%202023-11-23%20at%2021.11.55.png)

2. use `struct` to define required parameters.

   ![f](./assets/Screenshot%202023-11-23%20at%2021.13.58.png)

   the goal: single source of truth for required parameter.

   for example, `ContentWithoutStateViewModelParams` is used by:
   1. `ContentWithoutStateViewModel.init(params:)`
   2. `ContentWithoutStateViewModel.shared(params:)`

   ![g](./assets/Screenshot%202023-11-23%20at%2021.15.38.png)

   ![h](./assets/Screenshot%202023-11-23%20at%2021.17.25.png)