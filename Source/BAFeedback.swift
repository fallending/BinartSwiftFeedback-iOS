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
    
    public static func showToast (_ title: String) {
        var attributes: EKAttributes
        
        attributes = .topFloat
        attributes.displayMode = .inferred
        attributes.hapticFeedbackType = .success
        attributes.entryBackground = .gradient(
            gradient: .init(
                colors: [EKColor(BAFeedbackConfig.amberColor), EKColor(BAFeedbackConfig.pinkyColor)],
                startPoint: .zero,
                endPoint: CGPoint(x: 1, y: 1)
            )
        )
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
                radius: 10
            )
        )
        attributes.statusBar = .dark
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .easeOut
        )
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.minEdge),
            height: .intrinsic
        )
        
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: .systemFont(ofSize: 16),
                color: EKColor(BAFeedbackConfig.toastTitleColor),
                displayMode: .inferred
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
