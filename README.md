# Github Trending Repositories (iOS App)

A simple single screen app which shows the current trending Github repositories fetched from a public API.
The app has been built using Swift and UIKit with iOS 13 as the deployment target. 
This was built using **Test Driven Development** (`TDD`) and MVVM was used as the architecture of choice for this simple app. The `code coverage` for this app is `87.1%`

The fetched JSON data is cached using `URLCache`. The user can fetch fresh data by pulling down on the table view to refresh.

### GIF 🎉
<img src="https://github.com/RayanSaeed/Github-Trending-Repos/assets/8598858/42e2404c-6071-4c02-919e-a993554612cd" width="350"> 


![GithubRepos](https://user-images.githubusercontent.com/8598858/174490737-44e82ddc-2ada-4f69-a0ba-6ee74453e8a7.png)

### Code Coverage
![CleanShot 2022-06-19 at 21 25 59@2x](https://user-images.githubusercontent.com/8598858/174490779-acba57fe-4399-48fa-9b0b-1a0bb00f65e5.png)


### Tech Stack and Libraries
- UIKit
- Swift
- iOS 13
- MVVM
- Async/Await
- Nimble (for testing)
- Lottie (for lottie animations)
- Kingfisher (for fetching images)
- SkeletonView (for skeleton/shimemer views)

### Features
- Skeleton View
- Dark mode support
- Show trending Github repositories
