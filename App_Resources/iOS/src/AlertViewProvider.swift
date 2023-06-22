import SwiftUI
import MessageUI

@objc
class AlertViewProvider: UIViewController, SwiftUIProvider {

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
  private var swiftUIView = AlertView()

  // Receive data from NativeScript
  func updateData(data: NSDictionary) {}

  /// Allow sending of data to NativeScript
  var onEvent: ((NSDictionary) -> ())?
}