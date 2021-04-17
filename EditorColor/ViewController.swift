//
//  ViewController.swift
//  EditorColor
//
//  Created by MacBook on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redLevel: UILabel!
    @IBOutlet var greenLevel: UILabel!
    @IBOutlet var blueLevel: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewColor.layer.cornerRadius = 10
        
        viewColor.backgroundColor = .black
        
        
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
    
    private func setColor() {
        viewColor.backgroundColor = .init(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
}

