//
//  MainViewController.swift
//  EditorColor
//
//  Created by MacBook on 18.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(for colorOfScreen: UIView)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingColorVC = segue.destination as? SettingColorViewController else { return }
        settingColorVC.colorOfMainView = view.backgroundColor
        settingColorVC.delegate = self
    }
    

}

// MARK: - Extension

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(for colorOfScreen: UIView) {
        view.backgroundColor = colorOfScreen.backgroundColor
        
    }
    
    
    
}
