//
//  ViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var tasks : [Task] = []
    
    lazy var addBtn  : UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.tintColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        NotificationCenter.default.addObserver(self, selector: #selector(createTask(_:)), name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTask(_:)), name:  NSNotification.Name("com.sindhu.editTask") , object: nil)
        titleLabel.text = "Tasks"
        titleLabel.font = UIFont.style(.h1)
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
    
    @objc func updateTask(_ notification : Notification?) {
        guard let userInfo = notification?.userInfo,
              let updatedTask = userInfo["updateTask"] as? Task else
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
    
    @objc func createTask(_ notification : Notification) {
        guard let userInfo = notification.userInfo ,
              let task =  userInfo["newTask"] as? Task else {
            return
        }
        tasks.append(task)
        tableView.reloadData()
    }
    
}

// MARK:UITableViewDelegate

extension HomeViewController :UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let task = tasks[indexPath.row]
        //        let taskVC = NewTaskViewController(task: task)
        //        present(taskVC, animated: true)
        //
    }
}
// MARK:UITableViewDataSource

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
    }
}

// MARK:TaskTableViewDelegate

extension HomeViewController : TaskTableViewDelegate {
    func editTask(id: String) {
        let task = tasks.first { task in
            task.id == id
        }
        guard let task = task else {
            return
        }
        let taskVC = NewTaskViewController(task: task)
        present(taskVC, animated: true)
    }
    
    func markTask(id: String, complete: Bool) {
        let taskId = tasks.firstIndex { task in
            task.id == id
        }
        guard let taskId = taskId else {
            return
        }
        tasks[taskId].isCompleted = complete
        tableView.reloadData()
    }
    
    
}
