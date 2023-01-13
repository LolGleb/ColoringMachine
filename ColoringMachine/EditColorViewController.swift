//
//  ViewController.swift
//  ColoringMachine
//
//  Created by g.semshchikov on 26.08.2022.
//

import UIKit

protocol EditColorViewControllerDelegate: AnyObject {
    func saveColor (color: UIColor)
}

class EditColorViewController: UIViewController {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var delegate: EditColorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredView.layer.cornerRadius = 15
        
        // MARK: Red Slider
        redSlider.minimumTrackTintColor = .red
        redSlider.value = 10
        
        // MARK: Green Slider
        greenSlider.minimumTrackTintColor = .green
        greenSlider.value = 60
        
        // MARK: Blue Slider
        blueSlider.value = 200

        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate?.saveColor(color: coloredView.backgroundColor ?? UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        dismiss(animated: true)
    }
    
    
    private func setColor() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                              green: CGFloat(greenSlider.value) / 255,
                                              blue: CGFloat(blueSlider.value) / 255,
                                              alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(Int(slider.value))
    }
}

