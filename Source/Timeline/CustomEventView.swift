//
//  CustomEventView.swift
//  CalendarKit
//
//  Created by Hexa - Zhen Fung on 24/10/2018.
//

import Foundation

class CustomEventView: EventView {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainTitleRowView: UIStackView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var iconLocation: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    var event: EventDescriptor!
    var baseView: UIView!
    
    override func updateWithDescriptor(event: EventDescriptor) {
        self.layer.cornerRadius = 5
        self.event = event
        self.iconIV.image = event.iconImage
        self.descriptor = event
        
        self.typeLabel.text = event.typeText
        self.typeLabel.isHidden = event.typeIsHidden
        
        if let otherEventText = event.otherEventAttrText {
            self.mainTitleLabel.attributedText = otherEventText
        } else {
            self.mainTitleLabel.text = event.mainTitleText
        }
        
        self.mainTitleLabel.textColor = event.textColor
        self.mainTitleRowView.isHidden = event.mainTitleTextIsHidden
        
        self.subtitleLabel.text = event.subTitleText
        self.subtitleLabel.textColor = event.textColor
        self.subtitleLabel.isHidden = event.subTitleIsHidden
        
        self.timeLabel.text = event.timeText
        self.timeLabel.textColor = event.textColor
        self.timeView.isHidden = event.timeIsHidden
        
        self.iconLocation.image = event.iconLocation
        self.locationLabel.text = event.locationText
        self.locationLabel.textColor = event.textColor
        self.locationView.isHidden = event.locationIsHidden
        self.locationLabel.isHidden = event.locationIsHidden
        
        self.backgroundView.backgroundColor = event.backgroundColor
        
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

