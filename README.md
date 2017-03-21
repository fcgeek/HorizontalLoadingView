# HorizontalLoadingView
仿安卓横向加载动画

![demo](https://github.com/fcgeek/HorizontalLoadingView/blob/master/loading.gif)  

# Usage
```Swift
class WebViewController: UIViewController, UIWebViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let horizontalLoadingView = HorizontalLoadingView()
        horizontalLoadingView.frame = CGRect(x: 0, y: 0, w: 200, h: 2)
        view.addSubview(horizontalLoadingView)        
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {        
        horizontalLoadingView.stop()
    }

    func webViewDidStartLoad(_ webView: UIWebView) {        
        horizontalLoadingView.start()
    }
}
```
