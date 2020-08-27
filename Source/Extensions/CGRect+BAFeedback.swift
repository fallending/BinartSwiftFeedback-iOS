//
//  CGRect+BAFeedback.swift
//  SwiftEntryKit
//
//  Created by Seven on 2020/8/27.
//

import UIKit
import Foundation

extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}
