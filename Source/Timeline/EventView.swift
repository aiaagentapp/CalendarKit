import UIKit
import DateToolsSwift
import Neon

public protocol EventViewDelegate: AnyObject {
    func eventViewDidTap(_ eventView: EventView)
    func eventViewNameDidTap(_ eventView: EventView)
    func eventViewPolicyDidTap(_ eventView: EventView)
    func eventViewDidLongPress(_ eventview: EventView)
}

open class EventView: UIView {

  weak var delegate: EventViewDelegate?
  public var descriptor: EventDescriptor?

  public var color = UIColor.lightGray

  var contentHeight: CGFloat {
    return textView.height
  }

  lazy var textView: UITextView = {
    let view = UITextView()
    view.isUserInteractionEnabled = false
    view.backgroundColor = .clear
    view.isScrollEnabled = false
    return view
  }()
    
    lazy var iconImageView: UIImageView = {
    let view = UIImageView()
    return view
  }()

  lazy var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
  lazy var longPressGestureRecognizer: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }

  func configure() {
    clipsToBounds = true
    [tapGestureRecognizer, longPressGestureRecognizer].forEach {addGestureRecognizer($0)}
    self.layer.cornerRadius = 5
    color = tintColor
    addSubview(textView)
    addSubview(iconImageView)
  }
    
  func updateWithDescriptor(event: EventDescriptor) {
    
    self.backgroundColor = event.backgroundColor
    self.descriptor = event
    self.color = event.color
    self.iconImageView.image = event.iconImage
    
    if let otherEventText = event.otherEventAttrText {
      textView.attributedText = otherEventText
    } else {
      textView.text = event.mainTitleText
      textView.textColor = event.textColor
      textView.font = event.font
    }
    setNeedsDisplay()
    setNeedsLayout()
  }

  @objc func tap() {
    delegate?.eventViewDidTap(self)
  }

  @objc func longPress() {
    delegate?.eventViewDidLongPress(self)
  }

  override open func draw(_ rect: CGRect) {
    super.draw(rect)
    let context = UIGraphicsGetCurrentContext()
    context!.interpolationQuality = .none
    context?.saveGState()
    context?.setStrokeColor(color.cgColor)
    context?.setLineWidth(3)
    context?.translateBy(x: 0, y: 0.5)
    let x: CGFloat = 0
    let y: CGFloat = 0
    context?.beginPath()
    context?.move(to: CGPoint(x: x, y: y))
    context?.addLine(to: CGPoint(x: x, y: (bounds).height))
    context?.strokePath()
    context?.restoreGState()
  }

  override open func layoutSubviews() {
    super.layoutSubviews()
    textView.fillSuperview(left: 45, right: 0, top: 0, bottom: 0)
    iconImageView.anchorInCorner(.topLeft, xPad: 15, yPad: 10, width: 20, height: 20)
  }
}
