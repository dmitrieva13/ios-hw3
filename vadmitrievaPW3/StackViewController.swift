//
//  StackViewController.swift
//  vadmitrievaPW3
//
//  Created by Varvara on 08.10.2021.
//

import UIKit

class StackViewController: UIViewController, UIScrollViewDelegate {
    
    private var stack: UIStackView!
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        scrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200*40).isActive = true
        setupStackView()
        for _ in 0...200 {
            alarms.append(AlarmView(
                time: Int.random(in: 0...1440),
                isActive: Bool.random()
                )
            )
        }
        alarms.sort(by: {$0.time < $1.time})
        setupAlarms()
        //stack?.addSubview(UITextView())
    }
    
    private func setupStackView() {
        self.stack = UIStackView(frame: .zero)
        scrollView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor,
                                     constant: 0).isActive = true
       // collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
       // collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
       // collection.pin(to: view, .left, .right)
        stack.backgroundColor = .white
        //self.stack = stack
    }
    
    //let scroll = UIScrollView()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.contentSize = CGSize(width: stack?.frame.width ?? view.frame.width, height: 200*40)
        scroll.alwaysBounceVertical = true
        scroll.isUserInteractionEnabled = true
        scroll.isScrollEnabled = true
        //scroll.bounces = true
        return scroll
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: self.scrollView.frame.width,
                                    height: (stack?.frame.height)!)
        scrollView.alwaysBounceVertical = true
    }
    
   private func setupAlarms() {
        var top = 0
        for i in 0...alarms.count-1 {
            let stackAlarmView = StackView(a: alarms[i], w: Int(stack?.frame.width ?? view.frame.width))
            //view.addSubview(stackAlarmView)
            stack?.addArrangedSubview(stackAlarmView)
            stackAlarmView.translatesAutoresizingMaskIntoConstraints = false
            stackAlarmView.topAnchor.constraint(equalTo: stack!.topAnchor, constant: CGFloat(top)).isActive = true
            stackAlarmView.trailingAnchor.constraint(equalTo: stack!.trailingAnchor, constant: 0).isActive = true
            stackAlarmView.leadingAnchor.constraint(equalTo: stack!.leadingAnchor, constant: 0).isActive = true
            //stackAlarmView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
            //print(i)*/
            top += 40
        }
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let layout = view.safeAreaLayoutGuide
            scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
            scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
            scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
        }
}
    
    /*private func setupAlarms() {
        var top = 0
        for i in 0...alarms.count {
            stack?.addSubview(alarms[i])
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(
                equalTo: stack!.leadingAnchor,
                constant: 10
            ).isActive = true
            view.trailingAnchor.constraint(
                equalTo: stack!.trailingAnchor,
                constant: -10 ).isActive = true
            view.topAnchor.constraint(
                equalTo: stack!.topAnchor,
                constant: CGFloat(top)
            ).isActive = true
            view.heightAnchor.constraint(equalToConstant: 30).isActive = true
            top += 40
        }
    }*/

