# GFRefreshableScrollView

Implementation of pull down to refresh in SwiftUI compatible with iOS 13.


You can use it as a modifier to your existing views
```swift
var body: some View {
    LazyVStack {
        if isLoading {
            ProgressView()
        }
        ForEach(posts) { post in
            PostView(post: post)
        }
    }
    .modifier(GFRefreshableScrollViewModifier(action: refreshAction))
}
```
Or use it instead of a ScrollView
```swift
var body: some View {
    GFRefreshableScrollView(action: refreshList) {
        if isLoading {
            VStack {
                ProgressView()
                Text("loading...")
            }
        }
        VStack {
            ForEach(posts) { post in
                PostView(post: post)
            }
        }
    }
}
```

# License

GFRefreshableScrollView is available under the MIT license. See the LICENSE file for more info.

