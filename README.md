
How to run
************

Open WeatherLondon.xcworkspace and Command Key + R

Running tests - Open WeatherLondon.xcworkspace and Command Key + U

Architecture
************

- Using Swift 3 / XCode 8

- I like to use as few external libraries as possible. They introduce code who is a bit outside our control.

- For network request I will be using Alamofire. Nowadays all network layer can be done withouth Alamofire and using URLSession class, but Alamofire is a long established network layer library and for this exercise I prefer using it.

- No SwiftyJSON or object parser, as data is in simple format, I don´t feel the need to use it. Also in Swift 4 this can be done easily with the Decodable protocol.

- DIfferent targets, so we can test real Remote data and a Mock local environment.

- In an ideal scenario I would use SSL Pinning, HTTPS is not just enough security, all requests must be SSL pinned, this could be done with the Alamofire feature it has for this.

- Using MVVM architecture with Coordinators (MVVM-C). I like VIPER Architecture, but fits only in few scenarios, requires many coding and fits in scenarios that requirements does not change often. As for Coordinators I am following sample presentacion that Soroush Khanlou did in NSSpain about Presenting Coordinators.

- All data in memory, no local storage. Enabling local storage could be nice for caching information. If requirements asked for local storage I would use Realm encrypted, no CoreData here.

- Model structs conforms to my Loopable protocol. This easily allows two things: debug values with CustomStringConvertible and build a dictionary of properties/values (handy for building JSON)

- Tests. I am also a fan of testing, things should be tested. Implemented Model and ViewModel tests.

- UI Color and Fonts. Using Zeplin style.

- UI. UI By code, Using Autolayout with PureLayout. No Storyboards or NIBs

- Code styling. Using SwiftLint. I am a firm believer of unified coding styles

- Dependency manager. Cocoapods. I am familiar with Cocoapods and Carthage.

- Warnings as Errors. I treat warnings as errors, an app should not have even any warning.

- Static analizer. I run always statiuc analyzer for detecting any potential issue


Network Layer
*************

- Networking. I will be using my wrapper on top of Alamnofire (copied). I already have it done for Swift 2 at https://github.com/pabloroca/PR2StudioSwift, and can be used in a pod file import, but I introduced new things as Advanced NSoperations and didnñt got time to update my github repositories, so I will just copy in a folder.

- Networking. If needed a second request, I would use Concurrent (with DispatchGroup) as it should perform better or serial using NSOperation dependencies

- Network requests recursively repeated if temporary error (increasing delay till 30 second)

- Network requests applied Apple recommendations (make alwqays the request, don´t timeout, ...)

- Network Log network requests/responses to console with different logs levels

- Networking. automatic cache by Alamofire is disabled for security reasons.


Data Model
**********

All data model is held in memory, I think it´s pointless to store it locally. If I needed to store it locally I would use an encrypted Realm data store, with that we can avoid reverse engineering of the results. 

With more time
**************

I would cache data and store ir locally
