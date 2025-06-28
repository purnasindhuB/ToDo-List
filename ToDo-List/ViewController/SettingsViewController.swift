//
//  SettingsViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 24/06/25.
//

import UIKit
///This class is responsible for handling theme
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appThemeLabel: UILabel!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        settingsTitleLabel.font = UIFont.appFont(for: .title)
        appThemeLabel.font = UIFont.appFont(for: .label)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        ///We change the transform of the modalView to zero to animate
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        ///Depending on the current interface style we change the segmented control's selected index to  the current interface style
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first{$0.isKeyWindow }
        if let window = window {
            switch window.overrideUserInterfaceStyle {
            case .light:
                segmentControl.selectedSegmentIndex = 0
            case .dark :
                segmentControl.selectedSegmentIndex = 1
            case .unspecified:
                segmentControl.selectedSegmentIndex = 2
            @unknown default:
                segmentControl.selectedSegmentIndex = 2
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ///This animates the modal view using a scale up animation whereas it was intially set to scale of zero in viewdidloadd
        modalView.scaleUpAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalView.layer.cornerRadius = 5
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        /**The hierarchy of view is as follows :
         -  uiApplication
         - windowScenes
         - windows
         - keywindow
         -overrideUserInterfaceStyle
         we obtain the window to change the interface style below
         **/
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first{$0.isKeyWindow }
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            window?.overrideUserInterfaceStyle = .dark
        }
        else {
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
    
    ///Removes the view from superView as soon as user completes editing or creating the task
    @IBAction func dismissBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
