//
//  DeviceManager.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation
import UIKit

struct DeviceManager {
    
    static var helper = DeviceManager()
    
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var smallestTextSize: CGFloat {
        if isPhone {
            return 10
        } else {
            return 18
        }
    }
    
    static var smallTextSize: CGFloat {
        if isPhone {
            return 12
        } else {
            return 20
        }
    }
    
    static var regularTextSize: CGFloat {
        if isPhone {
            return 16
        } else {
            return 24
        }
    }
    
    static var largeTextSize: CGFloat {
        if isPhone {
            return 20
        } else {
            return 28
        }
    }
    
    static var titleTextSize: CGFloat {
        if isPhone {
            return 32
        } else {
            return 40
        }
    }
    
    static var secondLargestTextSize: CGFloat {
        if isPhone {
            return 50
        } else {
            return 60
        }
    }
    
    static var largestTextSize: CGFloat {
        if isPhone {
            return 150
        } else {
            return 160
        }
    }
}
