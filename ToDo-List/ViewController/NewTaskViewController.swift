//
//  NewTaskViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit

//TODO: - Move to separte protocol's class
///NewTaskDelegate links the NewTaskVC and the NewTaskModalView .
/// This helps the NewTaskViewController know when to dismiss when the x btn is tapped on the  NewTaskModalView and to present the error alert
protocol NewTaskDelegate: AnyObject {
    ///Dismiss the NewTaskController . called when x button tappen on NewModalView
    func closeView()
    /**
     This presents an error alert when the user enters invalid input
    - Parameters:
     - title : This is the title of error alert
     - message : A short description of what went wrong
     **/
    func presentErrorAlert(title:String,message:String)
}
///This class is reponsible for creating new task
class NewTaskViewController: UIViewController{
    
    lazy var modalView : NewTaskModelView = {
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight : CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modalHeight / 2 ), width: modalWidth, height: modalHeight)
        let modelView = NewTaskModelView(frame: frame,task: task)
        modelView.delegate = self
        return modelView
    }()
    
    /// The task being edited. If `nil`, a new task is being created.
    private  var task : TaskModel?
    
    /**
     This creates the NewTaskViewContreoller
     - Parameters :
        - task : if a task is being edited , the task shlould be passed, If a new task is being created task shld be nil.
     - Returns : NewTaskViewController with a NewTaskModalView for the user to edit or create a task
     **/
    init(task:TaskModel? = nil) {
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
        modalView.scaleUpAnimation()
        }
    }

//MARK: - Conforms to New Task Delegate
extension NewTaskViewController : NewTaskDelegate {
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func closeView() {
        dismiss(animated: true)
    }
}
