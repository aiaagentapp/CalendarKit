import Foundation

public enum EnumOtherEventTypePod {
    case birthday
    case maturing
    case premiumTermEnding
}

public protocol EventDescriptor {
    var iconImage: UIImage {get}
    var typeText: String {get}
    var typeIsHidden: Bool {get}
    var mainTitleText: String {get}
    var mainTitleTextIsHidden: Bool {get}
    var subTitleText: String {get}
    var subTitleIsHidden: Bool {get}
    var timeText: String {get}
    var timeIsHidden: Bool {get}
    var locationText: String {get}
    var locationIsHidden: Bool {get}
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
    var otherEventAttrText: NSAttributedString? {get}
    var iconLocation: UIImage {get}
    
    // State
    var startDate: Date {get}
    var endDate: Date {get}
    var eventTypeRawValue: Int {get}
    var calendarEventPurposeRawValue: String {get}
    var name: String {get} // For Other Event
    var policy: String {get} // For Other Event
    var dueAmount: String {get}  // For Other Event
    var dueAmountInRM: String {get}  // For Other Event
    var otherEventType: EnumOtherEventTypePod {get} // For Other Event
    
    // Custom
    var font: UIFont {get} // For Programmatically drawn view
    var fontOtherEventBold: UIFont {get} // For Programmatically drawn view
    var fontOtherEventNormal: UIFont {get} // For Programmatically drawn view
    var isAllDay: Bool {get} // For separating diifferent layout
    var color: UIColor {get} //
    
}
