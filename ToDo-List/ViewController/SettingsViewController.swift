//
//  SettingsViewController.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 24/06/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalView.layer.cornerRadius = 5
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
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
    
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
