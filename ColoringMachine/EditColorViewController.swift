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

class EditColorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var startColor: UIColor!
    
    weak var delegate: EditColorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
        
        coloredView.layer.cornerRadius = 15
        
        // MARK: Red Slider
        redSlider.minimumTrackTintColor = .red
        redSlider.value = 10
        redTextField.text?.append("10")
        
        // MARK: Green Slider
        greenSlider.minimumTrackTintColor = .green
        greenSlider.value = 60
        greenTextField.text?.append("60")
        
        // MARK: Blue Slider
        blueSlider.value = 200
        blueTextField.text?.append("200")

        setValue(for: redLabel, greenLabel, blueLabel)
        coloredView.backgroundColor = startColor
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0:
            redLabel.text = string(from: sender)
            redTextField.text = string(from: sender)
        case 1:
            greenLabel.text = string(from: sender)
            greenTextField.text = string(from: sender)
        case 2:
            blueLabel.text = string(from: sender)
            blueTextField.text = string(from: sender)
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
    
    // MARK: - Everything about textFields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if Int(textField.text!) ?? 0 > 255 {
            textField.text = "255"
        }
        redLabel.text = redTextField.text
        redSlider.value = Float(redTextField.text!) ?? 0.0
        greenLabel.text = greenTextField.text
        greenSlider.value = Float(greenTextField.text!) ?? 0.0
        blueLabel.text = blueTextField.text
        blueSlider.value = Float(blueTextField.text!) ?? 0.0
        setColor()
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redLabel.text = redTextField.text
        redSlider.value = Float(redTextField.text!) ?? 0.0
        greenLabel.text = greenTextField.text
        greenSlider.value = Float(greenTextField.text!) ?? 0.0
        blueLabel.text = blueTextField.text
        blueSlider.value = Float(blueTextField.text!) ?? 0.0
        setColor()
        self.view.endEditing(true)
    }
}

