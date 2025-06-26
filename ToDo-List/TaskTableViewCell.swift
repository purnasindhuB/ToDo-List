//
//  TaskTableViewCell.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit
protocol TaskTableViewDelegate : AnyObject{
    func editTask(id:String)
    func markTask(id:String,complete:Bool)
}
class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var isCompleteImageView: UIImageView!
    @IBOutlet weak var stripView: UIView!
    

    static let identifier = "taskCell"
    private weak var delegate : TaskTableViewDelegate?
    private var task : Task!
    private var dateFormatter : DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    @IBAction func editOptionTapped(_ sender: Any) {
        delegate?.editTask(id: task.id)
    }
    
    func configureUI(withTask task:Task,delegate : TaskTableViewDelegate?){
        stripView.backgroundColor = task.category.color
        categoryLabel.text = task.category.rawValue
        categoryLabel.font = UIFont.style(.secondaryText)
        captionLabel.text = task.caption
        captionLabel.font = UIFont.style(.secondaryText)
        categoryLabel.textColor = task.category.color
        categoryContainerView.backgroundColor = task.category.backgroundColor
        isCompleteImageView.image = task.isCompleted ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
        dateLabel.text = dateFormatter.string(from: task.constantDate)
        dateLabel.font = UIFont.style(.caption2)
        selectionStyle = .none
        isCompleteImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleApperance))
        isCompleteImageView.addGestureRecognizer(tap)
        self.task = task
        self.delegate = delegate
    }
    
    @objc func toggleApperance (){
        task.isCompleted.toggle()
        delegate?.markTask(id: task.id, complete: task.isCompleted)
    }
    
    func setupUI(){
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height/2
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 6
    }
}
