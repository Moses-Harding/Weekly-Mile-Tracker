//
//  CGSize.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation
import UIKit

extension CGSize {
    
    enum Dimension { case width, height }
    mutating func scale(proportionateTo direction: Dimension, with dimension: CGFloat) -> CGSize {
        let currentWidth = self.width
        let currentHeight = self.height
        
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if direction == .width {
            newWidth = dimension
            let ratio = newWidth / currentWidth
            newHeight = currentHeight * ratio
        } else {
            newHeight = dimension
            let ratio = newHeight / currentHeight
            newWidth = currentWidth * ratio
        }
        
        return CGSize(width: newWidth, height: newHeight)
    }
}
