
# The Officical raywenderlich.com Swift Style Guide
### updated for Swift 5
#### https://github.com/StyleShare
#### https://www.notion.so/iOS-878e1ecc1dc348d8a0a79d578639fa44 // IOS 엔지니어 채용
#### https://texture-kr.gitbook.io/wiki/
#### https://github.com/OhKanghoon
#### https://github.com/GeekTree0101
/*
- [ReactorKit](https://github.com/ReactorKit/ReactorKit)
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [Texture](https://github.com/TextureGroup/Texture)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper)
- [Quick](https://github.com/Quick/Quick)
- [Nimble](https://github.com/Quick/Nimble)
### 개발 도구

- [XcodeGen](https://github.com/yonaskolb/XcodeGen)
- [CocoaPods](https://cocoapods.org/)
- [Carthage](https://github.com/Carthage/Carthage)
- [Firebase](https://firebase.google.com/)
- [GitHub Actions](https://github.com/features/actions)
- [fastlane](https://github.com/fastlane/fastlane)
- [POEditor](https://poeditor.com/)
*/
###  refrerence URL 
https://www.raywenderlich.com/14223279-dependency-injection-tutorial-for-ios-getting-started#toc-anchor-003
https://github.com/raywenderlich/swift-style-guide#constants

https://github.com/raywenderlich/swift-style-guide#constants
https://github.com/matteocrippa/awesome-swift#style-guides
https://github.com/vsouza/awesome-ios

https://github.com/linkedin/swift-style-guide#35-optionals
https://google.github.io/swift/ 

```java
    //Text file name Code 
 
```
## Table of Contents
* [Correnctness](#correctness)
* [Using SwiftLint](#using-swiftlint)
* [Namimg](#naming)
    * [Prose](#prose)
    * [Delegates](#delegates)
    * [Use Type Inferred Context](#use-type-inferred-context)
    * [Generics](#generics)
    * [Class Prefixes](#class-prefixes)
    * [Languages](#languages)
* [Code Organization](#code-organization)
    * [Protocol Conformance](#protocol-conformance)
    * [Unused Code](#unused-code)
    * [Minimal Imports](#minimal-imports)
* [Spacing](#spacing)
* [Comments](#comments)
* [Classes and Strunctures](#classes-and-structures)
    * [Use of Self](#use-of-self)
    * [Protocol Conformance](#protocol-conformance)
    * [Computed Properties](#computed-properties)
    * [Final](#final)
    * [Function Declarations](#function-declarations)
* [Function Calls](#function-calls)
* [Closure Expressions](#closure-expressions)
* [Types](#types)
  * [Constants](#constants)
  * [Static Methods and Variable Type Properties](#static-methods-and-variable-type-properties)
  * [Optionals](#optionals)
  * [Lazy Initialization](#lazy-initialization)
  * [Type Inference](#type-inference)
  * [Syntactic Sugar](#syntactic-sugar)
* [Functions vs Methods](#functions-vs-methods)
* [Memory Management](#memory-management)
  * [Extending Object Lifetime](#extending-object-lifetime)
* [Access Control](#access-control)
* [Control Flow](#control-flow)
  * [Ternary Operator](#ternary-operator) :삼항연산자
* [Golden Path](#golden-path)
  * [Failing Guards](#failing-guards)
* [Semicolons](#semicolons)
* [Parentheses](#parentheses) : 괄호
* [Multi-line String Literals](#multi-line-string-literals)
* [No Emoji](#no-emoji)
* [No #imageLiteral or #colorLiteral](#no-imageliteral-or-colorliteral)
* [Organization and Bundle Identifier](#organization-and-bundle-identifier)
* [Copyright Statement](#copyright-statement)
* [Smiley Face](#smiley-face)
* [References](#references)


## Using SwiftLint
raywenderlich.com에 글을 쓸 때 SwiftLint 구성을 사용하는 것이 좋습니다. 일부 팀에서는 필요할 수 있습니다. See the [SwiftLint Policy](SWIFTLINT.markdown) for more information.

## Naming

Decriptive and consistent naming makes software easier to read and understand. Use the Swift naming conventions describe in the [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/). Some key takeaways include:

- striving for clarity at the call site
- prioritizing clarity over brevity
- using `camelCase` (not  `snake_case`)
- using `UpperCamelCase` for types and protocols, `lowerCamelCase` for everythins else
- including all needed words while omitting needless words
- using names based on roles, net types 
- sometimes compenstation for weak type infomation
- striving for fluent usage
- beginngin factory methods with `make`
- naming methods for their side effects
  - verb methods flollow the -ed, -ing rule for the non-mutating version
  - noun methods flollow the fromX rule for the mutating version
  - boolean types should read like assertions
  - protocols that describe _what somthing is_ should read as nouns
  - protocols that describe _a capability_ should and in _-able_ or _-ible_
- using terms that don't surprise experts or confuse begginners
- generally avoiding abreviations of
- using percedent for names
- perferring methods and properties to free functions
- casing acronyms and initialisms uniformly up or down
- giving the same base name to methods that share the same meaning
- avoiding overloads on return type
- choosing good parameter names that serve as documentaion
- perferring to anme the first parameter instead of including its name in the method name, except as mentioned under Delegates
- labeling closure and tuple parameters
- taking advantage of default parameters

### Prose 산문 풍자 문학

When referring to methods in prose, being unambiguos is critical. To refer to a method name, use the simplest from possible
  
  1. Write the method name with no parameters. **Example:** Next, you need to call `addTarget`.
  2. Write the method name with argument labels. **Example:** Next, you need to call `addTarget(_:action:)`.
  3. Write the full method name with agrument labels and types. **Example:** Next, you need to call `addTarget(_:Any?, action: Selector?)`
  
  For the above example using `UIGestureRecognizer`, 1 is unambiguous and perferred.
  ///  'Gesture Recognizer'를 사용하는 위의 예에서는 1이 명확하고 선호됩니다.

  **Pro Tip:** you can use Xcode's jump bar to lookup methods with argument labels. If you're particularly good at mashing lots of keys simultaneously, put the cursor in the method name and press **Shift-Control-Option-Command-C** ( all 4 modifier keys ) and Xcode will kindly put the signature on you clipboard
  //  **프로 Tip:** Xcode의 점프 바를 사용하여 인수 레이블이있는 메서드를 조회 할 수 있습니다. 많은 키를 동시에 매싱하는 데 특히 능숙하다면 메서드 이름에 커서를 놓고 ** Shift-Control-Option-Command-C ** (모든 수정 자 키 4 개)를 누르면 Xcode가 친절하게 서명을 입력합니다. 클립 보드

### Class Prefixed

Swift types are automatically namespaced by the module that contains them and you should not add a class prefix such as RW. If two names from different modules collide you can disabiuate by prefixing the type name with the module name.

```swift
import SomeMoudule

let myClass = MyModule.UsefulClass();
```

### Delegates

When creating custom delegate methods,  an unnamed first parameter should be the delegate source. (UIKit contains numerous examples of this. ) 
사용자 지정 대리자 메서드를 만들 때 이름이 지정되지 않은 첫 번째 매개 변수가 대리자 소스 여야합니다.(UIKit에는 이것의 수많은 예제가 포함되어 있습니다.)

**Preferred**
```swift
 func namePickerView(_ namePickerView: NamePickerView, disSelectname name: String)
 func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
```

**Not Preferred**
```swift
func didSelectName(namePicker: NamePickerViewController, name: String)
func namePickerShouldReload() -> Bool
```

### Use Type Inferred Context 
//: 타이 추론 된 컨텍스트

Use compiler inferred context to write shorter, clear code. ( Also see [Type Inference](#type-inference))

**Preferred** : 타입 추론
```swift
let selector = #selector(viewDidLoad)
view.backgroundcolor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
```

**Not Preferred**
```swift
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey:UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```

### Generics

Generic type parametes shoud be descriptive, upper camel case names. When a type name doesn't have a meaningful relationship or role, use a traditional single uppercase letter such as `T`, `U`, or `V`

**Preferred**: 
```swift
struct Stack<Element> { ... }
func wrete<Target: OutputStream> (to target: inout Target)
func swap<T>(_ a: inout T, _b: inout T)
```

**Not Preferred**:
```swift
struct Stack<T> { ... }
func wrete<target: OutputStream> (to target: inout target)
func swap<Thing>(_ a: inout Thing, _b: inout Thing)
```

### Language

Use US English spelling to match Apple's API.

**Preferred**: 
```swift
let color = "red"
```

**Not Preferred**: 
```swift
let colour = "red"
```
## Code Organization

Use extensions to organize your code into logical blocks of functionality. Each extension should be set off with a `// MARK` comment to keep things well-organized

확장을 사용하여 코드를 논리적 기능 블록으로 구성합니다. 잘 정리 된 상태를 유지하기 위해 각 확장은`// MARK: -` 주석으로 시작해야합니다.

### Protocol Conformance

프로토콜 적합성
In particular, when adding protocol conformance to a model, prefer adding a seperate extension for the protocol methods. This keeps the relatted methods grouped together with the protocol and can simplify instructions to add a protocol to a class with its associated methods.

특히, 모델에 프로토콜 적합성을 추가 할 때 프로토콜 메서드에 대해 별도의 확장을 추가하는 것을 선호합니다. 이렇게하면 관련 메서드가 프로토콜과 함께 그룹화되고 관련 메서드가있는 클래스에 프로토콜을 추가하는 지침을 단순화 할 수 있습니다.
**Preferred**: 
```swift
class MyViewController: UIViewController{
    // class stuff here
}
// MARK: - UITableViewDataSource
extension MyViewController: UITableViewDataSource {
    // table view data source methods
}

// MARK: - UIScrollViewDelegate
extension MyViewController: UIScrollViewDelegate {
    //scroll view delegate methods
}

```


**Not Preferred**: 
```swift
  class MyViewController: UIViewControlller, UITableViewDataSource, UIScrollViewDelegate {
      //all method
  }

```
Since the compiler does not allow you to re-declare protocol conformance in a derived class, it is not always required to replicate the exension groups of the base class. This is especially true if the derived class is a terminal class and a small number of methods are being overridden. when to preserve the exension groups is left to the discretion of the author.

컴파일러에서는 파생 클래스에서 프로토콜 적합성을 다시 선언 할 수 없으므로 항상 기본 클래스의 확장 그룹을 복제 할 필요는 없습니다. 파생 클래스가 터미널 클래스이고 소수의 메서드가 재정의되는 경우 특히 그렇습니다. 확장 그룹을 보존 할시기는 저자의 재량에 달려 있습니다.


### Unused Code 

Unused (dead) code, including Xcode template code and placeholder comments should be removed. An exception is when your tutorial or book instructs the user to use the commented code.

Aspirational methods not directly associated with the tutorial whose implementation simply calls the superclass should also be removed. This includes any empty/unused UIApplicationDelegate methods

Xcode 템플릿 코드 및 자리 표시 자 주석을 포함하여 사용되지 않는 (사용하지 않는) 코드는 제거해야합니다. 자습서 또는 책에서 사용자에게 주석 처리 된 코드를 사용하도록 지시하는 경우는 예외입니다.

구현이 단순히 슈퍼 클래스를 호출하는 자습서와 직접 관련이없는 포부 메서드도 제거해야합니다. 여기에는 비어 있거나 사용되지 않은 UIApplicationDelegate 메서드가 포함됩니다.

**Preferred**: 
```swift
override func tableView(_ tableView: UITableView, numberofRowsInSection section: Int) -> Int {
  return Database.contacts.count
}
```

**Not Preferred**: 
```swift
override func didReceiveMemoryWarning(){
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can e recreated.
 }

override func nmberOfSections(in tableView:UITableView) -> Int {
    //#warning Incomplete implementation, return the number of sections.
    return 1
}
```

### Minimal Imports 

Import only the moudules a source file requires. For example, don't import `UIKit` when importing `Foundation` will suffice. Likewise, don't import if you must import `UIKit`

소스 파일에 필요한 파일 만 가져옵니다. 예를 들어, 'Foundation'을 가져 오는 것으로 충분할 때 'UIKit'를 가져 오지 마십시오. 마찬가지로 'UIKit'를 가져와야하는 경우 가져 오지 마십시오.

**Preferred**: 
```swift
import UIKit
var view: UIView
var deviceModels: [String]

import Foundation
var deviceModels:[String]
```

**Not Preferred**: 
```swift
import UIKit
import Foundation
var view: UIView
var deviceModels: [String] 
```

## Spacing

* Indent using 2 space rather than tabs to conserve space and help prevent line wrapping. Be sure to set this preference in Xcode and in the Project settings as shown below.
 공간을 절약하고 줄 바꿈을 방지하기 위해 탭이 아닌 2 개의 공백을 사용하여 들여 씁니다. 아래 표시된대로 Xcode 및 프로젝트 설정에서이 환경 설정을 지정해야합니다.

![Xcode indent settings](screens/indentation.png)

* Method braces and other braces (`if`/`else`/`switch`/`while` etc.) alwasys open on the same line as the statement but close on a new line.
* Tip: You can re-indent by selecting some code (or **Command-A**) and then **Control-I** (or **Editor ▸ Structure ▸ Re-Indent** in the menu). Some of the Xcode template code will have 4-space tabs hard coded, so this is a goot way to fix that


**Preferred**: 
```swift
if user.isHappy{
  // Do Something 
} else {
  // Do somthing else
}
```

**Not Preferred**: 
```swift
if user.isHappy
{
  // Do something
}
else {
  // Do something else
}
```
* There souuld be on blacnk line between methods and up to one blank line between type declarations to aid in visula clarity and oraganization. Whitespace within methods should separate functionality, but having too many sections in a method often means you should refactor into sereral methods.

* There should be no blank lines after an opening brace or before a closing brace.
* 여는 중괄호 뒤 또는 닫는 중괄호 앞에는 빈 줄이 없어야합니다.
* Colon always have no space on the left and one space on the right. Exceptions are the ternary operator `? : `, empty dictionary `[:]` and `#selector` syntax `addTaget(_:action:)`.

**Preferred**: 
```swift
class TestDatabase: Database {
    var data:  [Striing:CGFloat] = ["A": 1.2, "B": 3.2]
}
```

**Not Preferred**: 
```swift
class TestDatabase: Database {
    var data:  [Striing:CGFloat] = ["A" : 1.2, "B" : 3.2]
}
```

* Long lines should be wrapped at around 70 characters. A hard limit is intentionally not specified.
  긴 lines는 약 70 자로 둘러싸여 야합니다. 하드 제한은 의도적으로 지정되지 않았습니다.
* Avoid trailing whitespaces at the ends of lines.

* Add a single newline character at the end of each file.

### Comments
When they are needed, use commnts to explain **why** a particular piece of code does somthing. Commnents must be kept up-to-date or deleted.

Avoid block comments inline with code, as the code should be as self-documenting as possible. _Exception: This does not apply to those comments used to generate documentation._

필요할 때 특정 코드가 어떤 일을하는 ** 이유 **를 설명하기 위해 commnts를 사용합니다. 칭찬은 최신 상태로 유지하거나 삭제해야합니다.

코드는 가능한 한 자체 문서화되어야하므로 코드 인라인 블록 주석을 피하십시오. _ 예외 : 문서 생성에 사용되는 주석에는 적용되지 않습니다.

Avoid the use of C-style comments (`/* ... */`). Prefer the use of double- or triple-slash.

## Classes and structures

### Which one to use?

structs have. Use structs for things that do not have an identity. An array that contains [a, b, c] is really the same as another array that contains [a, b, c] and they are completely interchageable. It doesn't matter whether you use the first array or the sencode, because they represent the exact same thing. That's whey array are structs.


구조체가 있습니다. 신원이없는 것에는 구조체를 사용하십시오. [a, b, c]를 포함하는 배열은 [a, b, c]를 포함하는 다른 배열과 실제로 동일하며 완전히 상호 교환 할 수 있습니다. 첫 번째 배열을 사용하는지 센 코드를 사용하는지는 똑같은 것을 나타 내기 때문에 중요하지 않습니다. 그것은 유청 배열이 구조체입니다.

Class have. Use classes for things that do have an identity or a spacific life cycle. You would model a person as a class because two persion objects are two different thins. Just because two people have the same name and birthdate, doesn't mean they are same person. But the person's birthdate would be a struct because a date of 3 March 1950 is the same any other date object for 3 March 1950. The date itself doesn't have an identity. 

Sometimes, thins should be structs but need to conform to `AnyObject` or are historically modeled as classes already(`NSDate`, `NSset`). Try to follow these guidelines as closely as possible. 


### Example definition

Hrre's an example of a well-styled classs definition
**Preferred**: 
```swift
class Circle: Shape{
  var x: Int Y: Int
  var radius: Double
  var diameter: Double {}
    get {
      return radius * 2
    }
    set{
      radius = newValue / 2
    }
}

```

**Not Preferred**: 
```swift

```

### Samples 

**Preferred**: 
```swift

```

**Not Preferred**: 
```swift

```