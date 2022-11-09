
# GitHubRepositoriesApp

User can use GitHubRepositoriesApp to view public github repositories in a list paginated by 10 items for each page. User can view owner name and photo of each repository.


## API Reference

#### Get all github repositories

  https://api.github.com/repositories



## Documentation

- Useing VIPER-Architecture
- Useing CoreData as a persistent layer
- Using Native url session to retrieve data from network
- adding Unit Tests


## Pods for GitHubRepositoriesApp

- SwiftPullToRefresh
- IQKeyboardManagerSwift
- SwiftyMocky


## Features

- Unit Tests become easy with SwiftyMocky Generator
- add more than 50% coverage for unit Tests
- User can search for repository in the main list screen


## NetworkClient Framwork

- you can find that all requests methods called from networkClient by using Native url sessions
- after get data sucessfully from Network all data saved to context of coreData
- then with each page we fetch data from context with a page range

