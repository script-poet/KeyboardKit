//
//  KeyboardButtonRowComponent.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A keyboard button row component is a view that can be added
 to a keyboard button row's horizontal stack view.
 
 The `KeyboardButtonRow`'s stack view uses `.fillEqually` by
 default, but you can change it's behavior at any time. When
 you do, you may have to set a hard width for each component.
 
 */

import UIKit

public protocol KeyboardButtonRowComponent: UIView {
    
    var widthConstraint: NSLayoutConstraint? { get set }
}

public extension KeyboardButtonRowComponent {
    
    var width: CGFloat {
        get { return widthConstraint?.constant ?? intrinsicContentSize.width }
        set { setWidth(to: newValue) }
    }
}

private extension KeyboardButtonRowComponent {
    
    func setWidth(to width: CGFloat) {
        widthConstraint = widthConstraint ?? widthAnchor.constraint(equalToConstant: width)
        widthConstraint?.priority = .defaultLow
        widthConstraint?.constant = width
        widthConstraint?.isActive = true
    }
}