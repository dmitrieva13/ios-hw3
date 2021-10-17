//
//  TableViewController.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 08.10.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    private var table: UITableView?
    private var alarms: [AlarmView] = []
    private var initialized: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        setupTableView()
        for _ in 0...200 {
            alarms.append(AlarmView(
                time: Int.random(in: 0...1440),
                isActive: Bool.random()
                )
            )
            initialized.append(false)
        }
        alarms.sort(by: {$0.time < $1.time})
        table?.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
        table?.delegate = self
        table?.dataSource = self
        
    }
    
    private func setupTableView() {
        let table = UITableView(frame: .zero)
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
       // collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
       // collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
       // collection.pin(to: view, .left, .right)
        table.backgroundColor = .white
        self.table = table
    }
    
    let scroll = UIScrollView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(width: self.scroll.frame.width,
                                    height: (table?.frame.height)!)
        scroll.alwaysBounceVertical = true
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        alarms.count
}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

var count = 0

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                   IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell
        cell?.setupEye()
        cell?.setAlarm(alarmItem: alarms[indexPath.row], isInit: initialized[indexPath.row])
            initialized[indexPath.row] = true
        cell?.layoutIfNeeded()
        alarms[indexPath.row].isActive = (cell?.alarm?.isActive != nil ? cell?.alarm?.isActive as! Bool : alarms[indexPath.row].isActive)
        print(cell?.alarm?.isActive as! Bool)
        return cell ?? UITableViewCell()
        //let s: String = String(alarms[indexPath.row].time ?? -99)
        //print(cell ?? "sad")
    }
}

