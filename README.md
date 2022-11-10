

# GitHubRepositoriesApp

User can use GitHubRepositoriesApp to view public github repositories in a list paginated by 10 items for each paginated. User can view owner name and photo of each repository.


## API Reference

#### Get all github repositories

  https://api.github.com/repositories



## Documentation

- Useing VIPER-Architecture
- Useing CoreData as a persistent layer
- Using Native url session to retrieve data from network
- adding Unit Tests


## NetworkClient Framwork

- you can find that all requests methods called from networkClient by using Native url sessions
- after get data sucessfully from Network all data saved to context of coreData
- then with each page we fetch data from context with a page range

## Pods for GitHubRepositoriesApp

- SwiftPullToRefresh
- IQKeyboardManagerSwift
- SwiftyMocky


## Features

- Unit Tests become easy with SwiftyMocky Generator
- add more than 50% coverage for unit Tests
- User can search for repository in the main list screen


## Screenshots

![Simulator Screen Shot - iPhone 12 Pro Max - 2022-11-10 at 02 05 45](https://user-images.githubusercontent.com/12607600/200968485-d0e9370e-4080-4e55-92cc-e61b36050a18.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2022-11-10 at 02 05 54](https://user-images.githubusercontent.com/12607600/200968544-05c09e7f-8fa9-4cc7-a3c2-36997115fc4c.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2022-11-10 at 02 06 15](https://user-images.githubusercontent.com/12607600/200968563-57da7093-55ed-47af-99e3-1fa9f36f3391.png)


https://user-images.githubusercontent.com/12607600/200974016-6551261e-46f0-40dd-9102-b2bca2bfd768.mov

