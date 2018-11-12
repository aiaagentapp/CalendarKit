//
//  CustomEventView.swift
//  CalendarKit
//
//  Created by Hexa - Zhen Fung on 24/10/2018.
//

import Foundation

class CustomEventView: EventView {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var iconLocation: UIImageView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    var event: EventDescriptor!
    var baseView: UIView!
    override func updateWithDescriptor(event: EventDescriptor) {
        self.event = event
        self.backgroundColor = UIColor.clear
        backgroundView.backgroundColor = event.backgroundColor
        if let attributedText = event.attributedText {
            titleLabel.attributedText = attributedText
        } else {
            titleLabel.text = event.text
        }
        descLabel.text = event.service
        iconImageView.image = event.iconImage
        self.layer.cornerRadius = 5
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    override func configure() {
        clipsToBounds = true
        [tapGestureRecognizer, longPressGestureRecognizer].forEach {addGestureRecognizer($0)}
        
        color = tintColor
    }
    
    @objc override func tap() {
        delegate?.eventViewDidTap(self)
    }
    
    @objc override func longPress() {
        delegate?.eventViewDidLongPress(self)
    }
    
    fileprivate class func instanceFromNib(owner:Any?) -> UIView {
        let bundle = Bundle(identifier: "org.cocoapods.CalendarKit")
        return bundle?.loadNibNamed("CustomEventView", owner: owner, options: nil)![0] as! UIView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        baseView = CustomEventView.instanceFromNib(owner:self)
        baseView.translatesAutoresizingMaskIntoConstraints = true
        baseView.frame = self.bounds
        self.addSubview(baseView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

