//
//  DayBubble.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/13/24.
//

import Foundation
import UIKit

class DayBubble: UIView {
    
    // Structure
    let mainStack = UIStackView(.vertical, spacing: 2)
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    } ()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    } ()
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    } ()
    
    // Data
    var day: DayOfWeek
    
    init(day: DayOfWeek) {
        
        self.day = day
        
        super.init(frame: .zero)
        
        self.setUpViews()
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.constrain(mainStack, using: .edges, padding: 20)
        
        mainStack.add([dayLabel,
                       dateLabel,
                       Spacer(1, .vertical, color: .white),
                       numberLabel])
    }
    
    func setUpUI() {
        self.layer.cornerRadius = 30
        
        self.backgroundColor = .primary
        
        dayLabel.attributedText = day.rawValue.asMutableAttributedString(weight: .bold, size: DeviceManager.smallTextSize, color: .white)
    }
    
    func set(date: Date, value: CGFloat?) {
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("M/dd")
        
        dateLabel.attributedText = "\(formatter.string(from: date))".asMutableAttributedString(weight: .bold, size: DeviceManager.smallTextSize, color: .white)
        if let value = value {
            numberLabel.attributedText = "\(value.withoutZero())".asMutableAttributedString(size: DeviceManager.largeTextSize, color: .white)
        } else {
            numberLabel.attributedText = "\n".asMutableAttributedString(size: DeviceManager.largeTextSize, color: .white)
        }
    }
}
