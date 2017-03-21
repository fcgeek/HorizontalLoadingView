# HorizontalLoadingView
仿安卓横向加载动画

![demo](https://github.com/fcgeek/HorizontalLoadingView/blob/master/loading.gif)  

# Usage
```Swift
let horizontalLoadingView = HorizontalLoadingView()
view.addSubview(horizontalLoadingView)
horizontalLoadingView.snp.makeConstraints { (make) in
    make.leading.trailing.equalTo(selectSourceView)
    make.top.equalTo(selectSourceView.snp.bottom)
    make.height.equalTo(2)
}
horizontalLoadingView.start()
```
