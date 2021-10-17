//
//  EyeCell.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 08.10.2021.
//

import UIKit

final class EyeCell: UITableViewCell {
    
    var alarm: AlarmView?
    var tableAlarmView: TableView!
    var initiate = 0
    
    func setupEye() {
        self.frame.size.height = 50
        let image = UIImageView()
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Double.random(in: 0...400)).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: Double.random(in: -20...40)).isActive = true
        image.image = UIImage(named: "eye")
        image.frame.size.height = 20
        image.frame.size.width = 30
    }
    
    override func prepareForReuse() {
        alarm?.isActive = false
        alarm?.time = 0
        alarm = nil
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
    }
    
    
    public func setAlarm(alarmItem: AlarmView, isInit: Bool) {
        prepareForReuse()
        //if (isInit == false) {
        for subview in contentView.subviews {
            if subview is TableView {
                subview.removeFromSuperview()
            }
        }
        print(Int(self.frame.width))
            alarm = AlarmView(time: alarmItem.time, isActive: alarmItem.isActive)
        tableAlarmView = TableView(a: alarm!, w: Int(window?.frame.width ?? self.frame.width))
            contentView.addSubview(tableAlarmView)
        alarm?.isActive = tableAlarmView.isActivated()
        //}
    }
    
    /*public func setAlarm(alarm: AlarmView) {
        self.contentView.addSubview(alarm)
    }*/
}
