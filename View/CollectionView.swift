//
//  CollectionView.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 12.10.2021.
//

import UIKit

class CollectionView: UIView {
    
    private var alarm: AlarmView?
    
    init(a: AlarmView, w: Int, h: Int){
        alarm = a
        super.init(frame: CGRect(x: 0, y: 0, width: w, height: h))
        setupTimeText()
        setupActivationToggle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupTimeText()
        //setupActivationToggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //super.init(coder: coder)
    }
    
    private let timeText = UILabel()
    
    private func setupTimeText() {
        self.addSubview(timeText)
        timeText.backgroundColor = .clear
        timeText.translatesAutoresizingMaskIntoConstraints = false
        timeText.topAnchor.constraint(
            equalTo: self.topAnchor,constant: 10
        ).isActive = true
        timeText.leadingAnchor.constraint(
            equalTo: self.leadingAnchor, constant: 30 ).isActive = true
        let h: Int = (alarm?.time ?? 0)/60
        let m: Int = (alarm?.time ?? 0)%60
        let hours = h>9 ? String(h) : "0"+String(h)
        let minutes = m>9 ? String(m) : "0"+String(m)
        timeText.text = hours+":"+minutes
    }
    
    let activationToggle = UISwitch()
    
    private func setupActivationToggle() {
        self.addSubview(activationToggle)
        activationToggle.translatesAutoresizingMaskIntoConstraints = false
        activationToggle.topAnchor.constraint(
            equalTo: self.topAnchor,constant: 10
        ).isActive = true
        activationToggle.trailingAnchor.constraint(
            equalTo: self.trailingAnchor, constant: -10 ).isActive = true
        activationToggle.addTarget(self,
                                   action: #selector(activationToggleSwitched),
                                   for: .valueChanged
        )
        if ((alarm?.isActive) == true) {
            activationToggle.setOn(true, animated: false)
            timeText.textColor = .black
        } else {
            activationToggle.setOn(false, animated: false)
            timeText.textColor = .gray
        }
    }
    
    @objc
    func activationToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            alarm?.isActive = true
            timeText.textColor = .black
        } else {
            alarm?.isActive = false
            timeText.textColor = .gray
        }
    }

}
