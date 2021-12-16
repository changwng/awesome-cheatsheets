### Swift Mvvm 가이드
git clone https://github.com/kickstarter/ios-oss

https://junhyi-park.medium.com/mvvm-%ED%95%99%EC%8A%B5-%EC%A0%95%EB%A6%AC-bb7576e23c65

### Styel Guide 
https://www.raywenderlich.com/14223279-dependency-injection-tutorial-for-ios-getting-started#toc-anchor-003
https://github.com/raywenderlich/swift-style-guide#constants

https://github.com/raywenderlich/swift-style-guide#constants
https://github.com/matteocrippa/awesome-swift#style-guides
https://github.com/vsouza/awesome-ios

https://github.com/linkedin/swift-style-guide#35-optionals
https://google.github.io/swift/ 

```java
//Text file name HelloWorld.java
 
```

### SWIFT XIB from hirerichy 기본틀로써 작용
```java
@IBAction func showView(_ sender: Any) {
    let view = MyView(frame: self.view.frame)
    self.view.addSubview(view)
}

class XibView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit(){
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}


class MyView2: XibView { // 내 커스텀 뷰
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
```

 