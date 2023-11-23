# Conclusion

Keep it simple. No need to overengineering with BLoC.

# Engineering Principles

1. 1 thing in 1 file

   ![e](./assets/Screenshot%202023-11-23%20at%2021.11.55.png)

2. use `struct` to define required parameters.

   ![f](./assets/Screenshot%202023-11-23%20at%2021.13.58.png)

   the benefit: 
   1. single source of truth for required parameter.

   for example, `ContentWithoutStateViewModelParams` is used by:
   1. `ContentWithoutStateViewModel.init(params:)`
   2. `ContentWithoutStateViewModel.shared(params:)`

   ![g](./assets/Screenshot%202023-11-23%20at%2021.15.38.png)

   ![h](./assets/Screenshot%202023-11-23%20at%2021.17.25.png)

3. never inject a ViewModel to a constructor. 

   use the parameters, then initialize the ViewModel inside the constructor.

   ![i](./assets/Screenshot%202023-11-23%20at%2022.04.22.png)

   if we pass ViewModel to a constructor, it will lead to unexpected behavior such as:
   1. if we pass a ViewModel to a Sheet View, the ViewModel will not deinit when the sheet is dismissed.
   2. if we pass a ViewModel to a non Sheet View, the ViewModel will deinit. Concerning😂

4. 1 component for 1 thing

   the benefit:
   1. easy to read View file.
   2. (bonus) maybe, reusable component.

   ![j](./assets/Screenshot%202023-11-23%20at%2022.12.54.png)

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