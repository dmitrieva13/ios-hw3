//
//  AlarmView.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 08.10.2021.
//

/*import UIKit

final class AlarmView: UIView {
    
    public var time: Int?
    private var isActive: Bool?
    
    init(time: Int, isActive: Bool, w: Int) {
        self.time = time
        self.isActive = isActive
        super.init(frame: CGRect(x: 0, y: 0, width: w, height: 50))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        time = 0
        isActive = false
        setupTimeText()
        setupActivationToggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //super.init(coder: coder)
    }
    
    private let timeText = UITextView()
    
    private func setupTimeText() {
        self.addSubview(timeText)
        timeText.backgroundColor = .clear
        timeText.translatesAutoresizingMaskIntoConstraints = false
        timeText.topAnchor.constraint(
            equalTo: self.topAnchor,constant: 10
        ).isActive = true
        timeText.leadingAnchor.constraint(
            equalTo: self.leadingAnchor, constant: 30 ).isActive = true
        let h: Int = time!/60
        let m: Int = time!%60
        let hours = h>9 ? String(h) : "0"+String(h)
        let minutes = m>9 ? String(m) : "0"+String(m)
        timeText.text = hours+":"+minutes
    }
    
    private func setupActivationToggle() {
        let locationToggle = UISwitch()
        self.addSubview(locationToggle)
        locationToggle.translatesAutoresizingMaskIntoConstraints = false
        locationToggle.topAnchor.constraint(
            equalTo: self.topAnchor,constant: 10
        ).isActive = true
        locationToggle.trailingAnchor.constraint(
            equalTo: self.trailingAnchor, constant: -30 ).isActive = true
        locationToggle.addTarget(self,
        action: #selector(locationToggleSwitched),
        for: .valueChanged
        )
    }
    
    @objc
    func locationToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            isActive = true
            timeText.textColor = .black
        } else {
            isActive = false
            timeText.textColor = .gray
        }
    }
}*/

struct AlarmView {
    var time: Int
    var isActive: Bool
}

