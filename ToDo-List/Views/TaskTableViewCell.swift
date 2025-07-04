//
//  TaskTableViewCell.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit
/// A delegate protocol to handle task-related actions triggered from the cell.
protocol TaskTableViewDelegate : AnyObject{
    /// Called when the edit button is tapped for a task.
    /// - Parameter id: The ID of the task to be edited.
    func editTask(id:String)
    /// Called when a task is marked as complete or incomplete.
    /// - Parameters:
    ///   - id: The ID of the task.
    ///   - complete: A boolean indicating the new completion state.
    func markTask(id:String,complete:Bool)
}

/// A `UITableViewCell` subclass used to display a task in the task list.
class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    /// Image view to show a   circle based on completion.
    @IBOutlet weak var isCompleteImageView: UIImageView!
    @IBOutlet weak var stripView: UIView!
    
    /// Reuse identifier for this cell.
    static let identifier = "taskCell"
    /// Delegate to notify when actions are performed on the cell.
    private weak var delegate : TaskTableViewDelegate?
    private var task : Task!
    
    /// Formatter used to display the task's date in readable format.
    private var dateFormatter : DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    /// Called after the cell is loaded from the nib.
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    @IBAction func editOptionTapped(_ sender: Any) {
        delegate?.editTask(id: task.id)
    }
    
    /// Configures the cell UI with a `Task` and a delegate.
    /// - Parameters:
    ///   - task: The task to display.
    ///   - delegate: The delegate to notify on user actions.
    func configureUI(withTask task:Task,delegate : TaskTableViewDelegate?){
        stripView.backgroundColor = task.category.color
        categoryLabel.text = task.category.rawValue
        categoryLabel.font = UIFont.appFont(for: .body)
        captionLabel.text = task.caption
        captionLabel.font = UIFont.appFont(for: .body)
        categoryLabel.textColor = task.category.color
        categoryContainerView.backgroundColor = task.category.backgroundColor
        isCompleteImageView.image = task.isCompleted ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
        dateLabel.text = dateFormatter.string(from: task.constantDate)
        dateLabel.font = UIFont.appFont(for: .label)
        selectionStyle = .none
        isCompleteImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleApperance))
        isCompleteImageView.addGestureRecognizer(tap)
        self.task = task
        self.delegate = delegate
    }
    
    /// Toggles the task's completion status and notifies the delegate.
    @objc func toggleApperance (){
        task.isCompleted.toggle()
        delegate?.markTask(id: task.id, complete: task.isCompleted)
    }
    
    /// Sets up the initial appearance of UI elements.
    func setupUI(){
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height/2
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 6
    }
}
