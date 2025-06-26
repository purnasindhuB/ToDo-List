//
//  TaskModelView.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 17/06/25.
//

import UIKit

let notificationName = NSNotification.Name("com.sindhu.createTask")

class NewTaskModelView: UIView {
    
    @IBOutlet private weak var categoryPickerView: UIPickerView!
    @IBOutlet private weak var descrptionTextView: UITextView!
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var submitBtn: ShadowButton!
    
    var newTaskViewController : NewTaskViewController?
    weak var delegate : HandleCloseModuleDelegate?
    private  var task : Task?
    
    var caption : String  {
        get { return descrptionTextView.text }
        set(newValue) { descrptionTextView.text = newValue }
    }
    
    init(frame : CGRect,task: Task?){
        super.init(frame: frame)
        self.task = task
        initSubViews()
    }
    
    required init?(coder:NSCoder){
        super.init(coder: coder)
        initSubViews()
    }
    
    func initSubViews() {
        let nib =   UINib(nibName: "NewTaskModelView", bundle: nil)
        nib.instantiate(withOwner: self)
        descrptionTextView.layer.borderWidth = 0.5
        descrptionTextView.layer.borderColor = UIColor.gray.cgColor
        descrptionTextView.layer.cornerRadius = 8
        descrptionTextView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
      
        contentView.frame = bounds
        if let task = task {
            descrptionTextView.text = task.caption
            descrptionTextView.textColor = UIColor.label
            if   let row = Category.allCases.firstIndex(of: task.category){
                categoryPickerView.selectRow(row, inComponent: 0, animated: true)
            }
        }
        else {
            descrptionTextView.text = "Add caption ..."
            descrptionTextView.textColor = UIColor.placeholderText
            categoryPickerView.selectRow(1, inComponent: 0, animated: true)
        }
        
        addSubview(contentView)
    }
    
    /// This is a place ideal for layout changes as it accounts for layout changes and change in size of view
    
    override func layoutSubviews(){
        contentView.layer.cornerRadius = 5
    }
    
    @IBAction func exitBtnTapped(_ sender: Any) {
        delegate?.closeModule()
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        guard let caption = descrptionTextView.text,
              caption.count >= 4 && caption.count <= 50,
              descrptionTextView.textColor != UIColor.placeholderText else {
            delegate?.presentErrorAlert(title: "Caption Error", message: "You need to provide a description with 4 or more characters")
            shakeAnimation()
            return
        }
            let selectedRow = categoryPickerView.selectedRow(inComponent: 0)
            let category = Category.allCases[selectedRow]
            if let task = task {
                
                let task = Task(id: task.id, category: category, caption: caption, constantDate: task.constantDate, isCompleted: task.isCompleted)
                let userInfo = ["updateTask":task]
                NotificationCenter.default.post(name: NSNotification.Name("com.sindhu.editTask") , object: self, userInfo: userInfo)
            }
            else {
                let taskId = UUID().uuidString
                let task = Task(id: taskId,category: category, caption: caption, constantDate: Date(), isCompleted: false)
                let userInfo = ["newTask":task]
                NotificationCenter.default.post(name: NSNotification.Name("com.sindhu.createTask") , object: self, userInfo: userInfo)
            }
            delegate?.closeModule()
        }
}

/// we have removed awakeNIB cuz it is not triggered due to top level obj connected to file owner

extension NewTaskModelView :UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add caption ...."
            textView.font = UIFont(type: .assistantMedium, size: .theme(.caption))
            textView.textColor = UIColor.placeholderText
        }
    }
}

extension NewTaskModelView : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
    
}

extension NewTaskModelView : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category =  Category.allCases[row]
        return category.rawValue
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel : UILabel? = view as? UILabel
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(type: .assistantSemiBold, size: .theme(.secondaryText))
            pickerLabel?.textAlignment = .center
        }
        let category = Category.allCases[row]
        pickerLabel?.text = category.rawValue
        return pickerLabel!
    }
}

