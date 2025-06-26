//
//  NewTaskViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit
protocol HandleCloseModuleDelegate: AnyObject {
    func closeModule()
    func presentErrorAlert(title:String,message:String)
}

class NewTaskViewController: UIViewController{
    
    lazy var modalView : NewTaskModelView = {
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight : CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modalHeight / 2 ), width: modalWidth, height: modalHeight)
        let modelView = NewTaskModelView(frame: frame,task: task)
        modelView.delegate = self
        return modelView
    }()
    
    private  var task : Task?
    
    init(task:Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(modalView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(springDuration: 0.35, initialSpringVelocity: 1, delay: 0, options: [.curveEaseInOut]){
//        UIView.animate(withDuration: 0.25, delay: 0,options: [.curveEaseOut] ) {
            self.modalView.transform = CGAffineTransform.identity
        }
    }
}
extension NewTaskViewController : HandleCloseModuleDelegate {
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func closeModule() {
        dismiss(animated: true)
    }
}
