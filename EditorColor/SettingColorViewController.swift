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
        
        setColor()
        
    }
    
    @IBAction func actionSliderOfGreen() {
        greenLevel.text = String(format: "%.2f", sliderGreen.value)
        
        setColor()
    }
    
    @IBAction func actionSliderOfBlue() {
        blueLevel.text = String(format: "%.2f", sliderBlue.value)
        
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

