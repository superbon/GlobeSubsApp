# 📱 GlobeSubsApp

A SwiftUI app that displays a list of Globe Telecom subscribers with their photo, name, address, and subscription type (Prepaid or Postpaid).

This project demonstrates:
- Clean architecture with SOLID principles
- Offline-first approach using **SwiftData (iOS 17+)** or **Core Data (iOS 16)**
- Modern iOS practices including Swift Concurrency, MVVM, dependency injection, and more
- Integration with [Alamofire](https://github.com/Alamofire/Alamofire) for networking and [Kingfisher](https://github.com/onevcat/Kingfisher) for image caching

---

## 📦 Features

✅ Fetches a subscriber list from a remote JSON API  
✅ Caches data locally for offline use  
✅ Displays list of subscribers with name, photo, and subscription type  
✅ Tapping a list item shows detailed info  
✅ Graceful fallback between SwiftData and Core Data depending on iOS version  
✅ Unit tests for UseCase, ViewModel, Repository, and DataSources  

---
## 📸 Screenshots

| List View | Detail View |
|----------|-------------|
| ![](https://drive.google.com/uc?export=view&id=1PtNwbKRmyRgAur7IE75o-1Yjaweha-qY) | ![](https://drive.google.com/uc?export=view&id=1TGeUtNmXctyzsd9N9PCvPhTUmFrqfPEl) |

---
