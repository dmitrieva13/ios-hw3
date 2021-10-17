//
//  CollectionCell.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 12.10.2021.
//

import UIKit

final class CollectionCell: UICollectionViewCell {
    
    var alarm: AlarmView?
    var collectionAlarmView: CollectionView!    
    func setupSize() {
        self.frame.size.height = 100
        self.frame.size.width = 250
    }
    
    override func prepareForReuse() {
        alarm?.isActive = false
        alarm?.time = 0
        alarm = nil
    }
    
    
    public func setAlarm(alarmItem: AlarmView) {
        prepareForReuse()
        //if (isInit == false) {
        for subview in contentView.subviews {
            if subview is CollectionView {
                subview.removeFromSuperview()
            }
        }
        print(Int(self.frame.width))
            alarm = AlarmView(time: alarmItem.time, isActive: alarmItem.isActive)
        collectionAlarmView = CollectionView(a: alarm!, w: Int(self.frame.width), h: Int(self.frame.height))
            contentView.addSubview(collectionAlarmView)
        //alarm?.isActive = tableAlarmView.isActivated()
        //}
    }
    
    /*public func setAlarm(alarm: AlarmView) {
        self.contentView.addSubview(alarm)
    }*/
}

