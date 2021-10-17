//
//   CollectionViewController.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 08.10.2021.
//

import UIKit

class  CollectionViewController: UIViewController {
    
    private var collection: UICollectionView?
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        setupCollectionView()
        for _ in 0...200 {
            alarms.append(AlarmView(
                time: Int.random(in: 0...1440),
                isActive: Bool.random()
                )
            )
        }
        alarms.sort(by: {$0.time < $1.time})
        collection?.register(CollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
        collection?.delegate = self
        collection?.dataSource = self
        //setupAlarms()
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10,
        bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 60)
        layoutFlow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero,
        collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
       // collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
       // collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
       // collection.pin(to: view, .left, .right)
        collection.backgroundColor = .white
        self.collection = collection
    }
    
    let scroll = UIScrollView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(width: self.scroll.frame.width,
                                    height: (collection?.frame.height)!)
        scroll.alwaysBounceVertical = false
        scroll.alwaysBounceHorizontal = true
    }
    
    func setupAlarms() {
        for alarm in alarms {
            let collectionView = CollectionView(a: alarm, w: Int(view.safeAreaLayoutGuide.layoutFrame.width)-100,
                                                h: Int(view.safeAreaLayoutGuide.layoutFrame.height)-50)
            collection?.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarms.count
        }
}

extension CollectionViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collection?.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionCell
            cell?.setupSize()
            cell?.setAlarm(alarmItem: alarms[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
}
