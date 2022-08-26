//
//  ViewController.swift
//  ColoringMachine
//
//  Created by g.semshchikov on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coloredView: UIView!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var redAmount: CGFloat = 0
    var greenAmount: CGFloat = 0
    var blueAmount: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Red Label
        redLabel.text = "0"
        
        // MARK: Green Label
        greenLabel.text = "0"
        
        // MARK: Blue Label
        blueLabel.text = "0"
        
        // MARK: Red Slider
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        
        // MARK: Green Slider
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        
        // MARK: Blue Slider
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
    }


    @IBAction func redSliderAction() {
        redLabel.text = String(round(redSlider.value * 100) / 100.0)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: greenAmount/255, blue: blueAmount/255, alpha: 1)
        redAmount = CGFloat(redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(round(greenSlider.value * 100) / 100.0)
        coloredView.backgroundColor = UIColor(red: redAmount/255, green: CGFloat(greenSlider.value)/255, blue: blueAmount/255, alpha: 1)
        greenAmount = CGFloat(greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(round(blueSlider.value * 100) / 100.0)
        coloredView.backgroundColor = UIColor(red: redAmount/255, green: greenAmount/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        blueAmount = CGFloat(blueSlider.value)
    }
}

