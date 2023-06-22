import SwiftUI
import MessageUI

@objc
class MaterialBlurViewProvider: UIViewController, SwiftUIProvider {

  // MARK: INIT
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  required public init() {
    super.init(nibName: nil, bundle: nil)
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupSwiftUIView(content: swiftUIView)
  }

  // MARK: PRIVATE
  private var swiftUIView = MaterialBlurView()

  // Receive data from NativeScript
  // func updateData(data: NSDictionary) {
  //   data.forEach { (k,v) in swiftUIView.data.props[k] = v }
  // }
  func updateData(data: NSDictionary) {
    if let blurValue = data.value(forKey: "blurValue") as? CGFloat {
      // update swiftUI view
      swiftUIView.props.blurValue = blurValue
      // notify nativescript
      self.onEvent?(["blurValue": blurValue])
    }
  }

  /// Allow sending of data to NativeScript
  var onEvent: ((NSDictionary) -> ())?
}