//
//  SettingColorViewController.swift
//  EditorColor
//
//  Created by MacBook on 31.03.2021.
//

import UIKit

class SettingColorViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redLevel: UILabel!
    @IBOutlet var greenLevel: UILabel!
    @IBOutlet var blueLevel: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    var colorOfMainView: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewColor.layer.cornerRadius = 10
        
        viewColor.backgroundColor = colorOfMainView
        
        
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.minimumTrackTintColor = .blue
    }

    @IBAction func actionSliderOfRed() {
        redLevel.text = String(format: "%.2f", sliderRed.value)
        redTextField.text = redLevel.text
        
        setColor()
        
    }
    
    @IBAction func actionSliderOfGreen() {
        greenLevel.text = String(format: "%.2f", sliderGreen.value)
        greenTextField.text = greenLevel.text
        setColor()
    }
    
    @IBAction func actionSliderOfBlue() {
        blueLevel.text = String(format: "%.2f", sliderBlue.value)
        blueTextField.text = blueLevel.text
        setColor()
        
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(for: viewColor)
        dismiss(animated: true)
    }
    
    private func setColor() {
        viewColor.backgroundColor = .init(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
}

// MARK: - extinsion

extension SettingColorViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
    
        let doneButton = UIBarButtonItem(
            title:"Done",
            style: .done,
            target: self,
            action: #selector(textFieldShouldReturn(_:))
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                sliderRed.setValue(currentValue, animated: true)
                redLevel.text = String(format: "%.2f", sliderRed.value)
            case greenTextField:
                sliderGreen.setValue(currentValue, animated: true)
                greenLevel.text = String(format: "%.2f", sliderGreen.value)
            default:
                sliderBlue.setValue(currentValue, animated: true)
                blueLevel.text = String(format: "%.2f", sliderBlue.value)
            }
            
            setColor()
            return
        }
        
       
    }
    
}

