//
//  ViewController.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import UIKit

class DailyViewController: UIViewController {
    
    var dailyView = DailyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.overrideUserInterfaceStyle = .light
        
        view.constrain(dailyView, using: .edges)
        
        dailyView.viewController = self
        
        loadData()
        
        //
    }
    
    func loadData() {
        
        setCurrentDay()
        setCurrentValue()
        setWeeklyLabels(total: 3, goal: 6)
        
        set(day: .sunday, date: Date.now - 3, value: 3.5)
        set(day: .monday, date: Date.now - 3, value: 0)
        set(day: .tuesday, date: Date.now - 3, value: 2)
        set(day: .wednesday, date: Date.now, value: 1)
        set(day: .thursday, date: Date.now + 1, value: nil)
        set(day: .friday, date: Date.now + 2, value: nil)
        set(day: .saturday, date: Date.now + 3, value: nil)
    }

    func setCurrentDay() {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM dd")
        
        dailyView.dateLabel.attributedText = formatter.string(from: Date.now).asMutableAttributedString(weight: .bold, size: DeviceManager.regularTextSize + 4)
    }
    
    func setCurrentValue(value: CGFloat = 0) {
        dailyView.milesLabel.text = "\(value.withoutZero())"
    }
    
    func setWeeklyLabels(total: CGFloat, goal: CGFloat) {
        dailyView.weeklyTotalLabel.attributedText = NSMutableAttributedString.join("Weekly Total: ".asMutableAttributedString(weight: .bold, size: DeviceManager.smallTextSize),
                                                                                   "\(total.withoutZero())".asMutableAttributedString(size: DeviceManager.smallTextSize))
        dailyView.weeklyGoalLabel.attributedText = NSMutableAttributedString.join("Weekly Goal: ".asMutableAttributedString(weight: .bold, size: DeviceManager.smallTextSize),
                                                                                  "\(goal.withoutZero())".asMutableAttributedString(size: DeviceManager.smallTextSize))
    }
    
    func set(day: DayOfWeek, date: Date, value: CGFloat?) {
        switch day {
        case .sunday:
            dailyView.sundayBubble.set(date: date, value: value)
        case .monday:
            dailyView.mondayBubble.set(date: date, value: value)
        case .tuesday:
            dailyView.tuesdayBubble.set(date: date, value: value)
        case .wednesday:
            dailyView.wednesdayBubble.set(date: date, value: value)
        case .thursday:
            dailyView.thursdayBubble.set(date: date, value: value)
        case .friday:
            dailyView.fridayBubble.set(date: date, value: value)
        case .saturday:
            dailyView.saturdayBubble.set(date: date, value: value)
        }
    }
}

class DailyView: UIView {
    
    var viewController: DailyViewController?
    
    // Structure
    let mainStack = UIStackView(.vertical, spacing: 10)
    let topArea = UIStackView(.vertical)
    let midArea = UIStackView(.vertical)
    let bottomArea = UIStackView(.vertical, spacing: 5, distribution: .fillEqually)
    
    // Top area
    let topLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = -1
        label.textAlignment = .left
        return label
    } ()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    } ()
    let milesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: DeviceManager.largestTextSize)
        return label
    } ()
    let weeklyTotalLabel = UILabel()
    let weeklyGoalLabel = UILabel()
    
    let weeklyStack = UIStackView(.horizontal)
    
    // Bottom area
    let topBubbleRow = UIStackView(.horizontal, spacing: 20, distribution: .fillEqually)
    let bottomBubbleRow = UIStackView(.horizontal, spacing: 20, distribution: .fillEqually)
    
    let sundayBubble = DayBubble(day: .sunday)
    let mondayBubble = DayBubble(day: .monday)
    let tuesdayBubble = DayBubble(day: .tuesday)
    let wednesdayBubble = DayBubble(day: .wednesday)
    let thursdayBubble = DayBubble(day: .thursday)
    let fridayBubble = DayBubble(day: .friday)
    let saturdayBubble = DayBubble(day: .saturday)
    
    var nextAndBackButtonArea = UIStackView(.vertical)
    let previousButton = UIButton()
    let nextButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        setUpViews()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        self.constrain(mainStack, using: .edges, padding: 20)
        
        let centerSpacer = Spacer(1, .vertical, color: .primary)
        
        mainStack.add([topArea, midArea, centerSpacer, bottomArea])
        
        topArea.add([//Spacer(30, .vertical),
                    topLabel,
                    //UIView(),
                    Spacer(20, .vertical),
                    dateLabel,
                    milesLabel,
                    UIView(),
                    weeklyStack])
        
        midArea.add([weeklyStack])
        weeklyStack.add([weeklyTotalLabel,
                        UIView(),
                        weeklyGoalLabel])
        
        bottomArea.add([topBubbleRow,
                       bottomBubbleRow])
        topBubbleRow.add([sundayBubble,
                          mondayBubble,
                          tuesdayBubble,
                          wednesdayBubble])
        
        bottomBubbleRow.add([thursdayBubble,
                            fridayBubble,
                            saturdayBubble,
                            nextAndBackButtonArea])
        
        nextAndBackButtonArea.add([previousButton,
                                  UIView(),
                                  nextButton])
        
        topArea.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.35).isActive = true
        bottomArea.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.35).isActive = true
    }
    
    func setUpUI() {
        topLabel.attributedText = "How many miles did you run today?".asMutableAttributedString(size: DeviceManager.secondLargestTextSize)
        
        nextButton.configuration = .filled(title: "->", color: .black)
        previousButton.configuration = .filled(title: "<-", color: .black)
    }
}
