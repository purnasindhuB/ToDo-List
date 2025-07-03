//
//  ViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit
///This is the first screen you see when the app is launches. This is where user can see all tasks and this is starting point for adding or editing task. Tasks can only be deleted from here.
class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var tasks : [TaskModel] = []
    //We create the button programatically because we cannot add the btn as a subview of tableview in the interface builder.
    lazy var addBtn  : UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.tintColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        //We change the scale of imageView to make the size of plus image bigger.
        button.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addNotification()
    }
    
    func setupView(){
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 24
        titleView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(addBtn)
        titleLabel.text = "Tasks"
        titleLabel.font = UIFont.appFont(for: .title)
    }
    ///We setup the observers to watch for notifications when a new task is created or edited
    private func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(createTask(_:)), name: NSNotification.Name("com.sindhu.createTask"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(editTask(_:)), name:  NSNotification.Name("com.sindhu.editTask") , object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        let safeArea = view.safeAreaInsets.bottom
        let width: CGFloat = 60
        let height : CGFloat = 60
        
        let xpos = view.frame.width / 2 - width / 2
        let ypos = view.frame.height - height - safeArea
        addBtn.frame = CGRect(x: xpos, y: ypos, width: width, height: height)
        addBtn.layer.cornerRadius = width / 2
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: nil)
    }
    
    
    @objc  func addButtonTapped(){
        let taskVC = NewTaskViewController()
        present(taskVC, animated: true)
    }
    
    /// This responds to task that has been edited from NewTaskController . The notification object holds a userinfo object with the taks that needs to be updated .
    /// - Parameters :
    /// - notifcation : The Notification object fron the com.sindhu.editTask
    @objc func editTask(_ notification : Notification?) {
        guard let userInfo = notification?.userInfo,
              let updatedTask = userInfo["updateTask"] as? TaskModel else
        {
            return
        }
        let taskId = tasks.firstIndex { task in
            task.id == updatedTask.id
        }
        guard let taskId = taskId else {
            return
        }
        tasks[taskId] = updatedTask
        tableView.reloadData()
    }
    
    /// This responds to task that has been edited from NewTaskController . The notification object holds a userinfo object with the taks that needs to be updated .
    /// - Parameters :
    /// - notifcation : The Notification object fron the com.sindhu.createTask
    @objc func createTask(_ notification : Notification) {
        guard let userInfo = notification.userInfo ,
              let task =  userInfo["newTask"] as? TaskModel else {
            return
        }
        tasks.append(task)
        tableView.reloadData()
    }
    
}

// MARK: - Methods conforming to UITableViewDelegate
extension HomeViewController :UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                let task = tasks[indexPath.row]
//                let taskVC = NewTaskViewController(task: task)
//                present(taskVC, animated: true)
        
    }
}

// MARK: - Methods conforming to UITableViewDataSource

extension HomeViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        cell.configureUI(withTask : task,delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        else if editingStyle == .insert {
            print("inserted")
        }
    }
}

// MARK: - Methods conforming to TaskTableViewDelegate
extension HomeViewController : TaskTableViewDelegate {
    func editTask(id: Int) {
        let task = tasks.first { task in
            task.id.hashValue == Int(id)
        }
        guard let task = task else {
            return
        }
        let taskVC = NewTaskViewController(task: task)
        present(taskVC, animated: true)
    }
    
    func markTask(id: Int, complete: Bool) {
        let taskId = tasks.firstIndex { task in
            task.id.hashValue == Int(id)
        }
        guard let taskId = taskId else {
            return
        }
        tasks[taskId].isComplete = complete
        tableView.reloadData()
    }
    
    
}
