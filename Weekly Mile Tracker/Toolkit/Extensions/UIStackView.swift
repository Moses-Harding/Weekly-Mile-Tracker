//
//  UIStackView.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation
import UIKit

enum ConstraintType {
    case height, width, centerX, centerY, leading, trailing, top, bottom
}

enum ConstraintMethod {
    case scale, edges
}

extension UIStackView {
    
    /* This convenience init is simply to facilitate the more common usages of UIStackView */
    convenience init(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil, isLayoutMarginsRelativeArrangement: Bool = true, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill) {
        self.init(frame: CGRect.zero)
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        
        if let spacing = spacing {
            self.spacing = spacing
        }
        
        self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
    }
    
    /* Add: Add a list of views to a stackview and optionally provide percentages to scale each of the children. By default, if the percentages exceed 100, an error will be thrown. */
    func add(children: [(UIView, CGFloat?)], overrideErrorCheck: Bool = false) {
        
        var count: CGFloat = 0
        
        var constraintType: ConstraintType
        
        if self.axis == .horizontal {
            constraintType = .width
        } else {
            constraintType = .height
        }
        
        for (child, multiplier) in children {
            self.addArrangedSubview(child)
            if let multiplier = multiplier {
                self.setConstraint(for: child, constraintType, multiplier: (multiplier - 0.01))
                count += multiplier
            }
        }
        
        guard count <= 1 || overrideErrorCheck == true else {
            fatalError("Stack constraints exceed 100%")
        }
    }
    
    func add(_ children: [UIView]) {
        for child in children {
            self.addArrangedSubview(child)
        }
    }
    
    func colorSections() {
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .cyan, .purple]
        
        var i = 0
        for subview in self.arrangedSubviews {
            subview.backgroundColor = colors[i % colors.count]
            i += 1
        }
    }
}
