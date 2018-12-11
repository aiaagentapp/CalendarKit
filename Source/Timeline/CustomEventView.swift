//
//  CustomEventView.swift
//  CalendarKit
//
//  Created by Hexa - Zhen Fung on 24/10/2018.
//

import Foundation

class CustomEventView: EventView {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var iconLocation: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    var event: EventDescriptor!
    var baseView: UIView!
    override func updateWithDescriptor(event: EventDescriptor) {
        self.event = event
        self.backgroundColor = UIColor.clear
        self.descriptor = event
        backgroundView.backgroundColor = event.backgroundColor
        
        if(!event.service.isEmpty) {
            serviceLabel.text = event.service
            serviceLabel.isHidden = false
        }
        else {
            serviceLabel.isHidden = true
        }
        if let attributedText = event.attributedText {
            titleLabel.attributedText = attributedText
        } else {
            titleLabel.text = event.text
        }
        if(!event.name.isEmpty) {
            subtitleLabel.text = event.name
            subtitleLabel.isHidden = false
        }
        else {
            subtitleLabel.isHidden = true
        }
        if(!event.time.isEmpty) {
            timeLabel.text = event.time
            timeLabel.isHidden = false
        }
        else {
            timeLabel.isHidden = true
        }
        if(!event.location.isEmpty) {
            locationLabel.text = event.time
            locationLabel.isHidden = false
            iconLocation.image = event.iconLocation
        }
        else {
            locationLabel.isHidden = true
            iconLocation.isHidden = true
        }
        
        imageView.image = event.iconImage        
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

