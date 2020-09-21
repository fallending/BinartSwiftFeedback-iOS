//
//  BAFeedback.swift
//  SwiftEntryKit
//
//  Created by Seven on 2020/8/27.
//

import Foundation

enum BAFeedbackPresent {
    case sample
}

public class BAFeedback {
    
    // MARK: = Toast: title
    
    private static func calculateTextWidth(_ text: String) -> CGFloat {
        let font = getToastTextFont()
        let rect = NSString(string: text).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: font.lineHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    private static func getToastTextFont() -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: 14)!
    }
    
    public static func showToast (_ title: String) {
        var attributes: EKAttributes
        
        attributes = .topFloat
        attributes.displayMode = .inferred
        attributes.hapticFeedbackType = .success
        attributes.entryBackground = .color(color: EKColor(BAFeedbackConfig.amberColor))
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.3),
                scale: .init(from: 1, to: 0.7, duration: 0.7)
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.5,
                radius: 18
            )
        )
        attributes.statusBar = .dark
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .easeOut
        )
        
        let width = calculateTextWidth(title) + 52  // EKNotificationMessage内边距
        
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: width),
            height: .constant(value: 30)
        )
        attributes.roundCorners = .all(radius: 18)
        
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: getToastTextFont(),
                color: EKColor(UIColor(red: 255, green: 255, blue: 255, alpha: 0.9)),
                alignment: NSTextAlignment.center,
                displayMode: .inferred,
                numberOfLines: 1
            ),
            accessibilityIdentifier: "title"
        )
        let description = EKProperty.LabelContent(
            text: "",
            style: .init(
                font: .systemFont(ofSize: 14),
                color: EKColor(BAFeedbackConfig.toastTitleColor),
                displayMode: .inferred
            ),
            accessibilityIdentifier: "description"
        )
        
//        var image: EKProperty.ImageContent?
//        if let imageName = "" {
//            image = EKProperty.ImageContent(
//                image: UIImage(named: imageName)!.withRenderingMode(.alwaysTemplate),
//                displayMode: .inferred,
//                size: CGSize(width: 35, height: 35),
//                tint: EKColor(BAFeedbackConfig.toastTitleColor),
//                accessibilityIdentifier: "thumbnail"
//            )
//        }
        let simpleMessage = EKSimpleMessage(
            image: nil,
            title: title,
            description: nil
        )
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    // MARK: = Info: title + description
    
    public static func showInfo () {
        
    }
    
    
    // MARK: = Alert/Confirm title + description + buttons
    
    
    
    // MARK: = Sheet: title + selections
    

}
