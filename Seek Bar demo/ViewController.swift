////
////  ViewController.swift
////  Seek Bar demo
////
////  Created by Deepali on 21/08/24.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var valueTextField: UITextField!
//    @IBOutlet weak var slider: UISlider!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Configure slider
//        slider.minimumValue = 0
//        slider.maximumValue = 10
//        slider.value = 0 // Initial value
//
//        updateUI(for: slider.value)
//    }
//
//    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        updateUI(for: sender.value)
//    }
//
//    private func updateUI(for value: Float) {
//        // Update label and text field with the current slider value
//        let intValue = Int(value)
//        //valueLabel.text = "\(intValue)"
//        valueTextField.text = "\(intValue)"
//
//        // Change slider color from red to green based on value
//        let percentage = CGFloat(value) / 10.0
//        slider.minimumTrackTintColor = UIColor(red: percentage, green: (1.0 - percentage), blue: 0.0, alpha: 1.0)
//    }
//}
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    private var thumbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure slider
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.value = 10
        
        // Create a label to show the value above the thumb
        thumbLabel = UILabel()
        thumbLabel.textAlignment = .center
        thumbLabel.textColor = .black
        thumbLabel.font = UIFont.systemFont(ofSize: 12)
        thumbLabel.text = "\(Int(slider.value))"
        view.addSubview(thumbLabel)
        
        // Update UI initially
        updateUI(for: slider.value)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateUI(for: sender.value)
    }
    
    private func updateUI(for value: Float) {
        let intValue = Int(value)
        valueTextField.text = "\(intValue)"
        thumbLabel.text = "\(intValue)"
        
        updateThumbLabelPosition()
        
        // Change slider color from green to red based on value
        let percentage = CGFloat(value) / 10.0
        slider.minimumTrackTintColor = UIColor(
            red: percentage,
            green: 1.0 - percentage,
            blue: 0.0,
            alpha: 1.0
        )
    }
    
    private func updateThumbLabelPosition() {
        // Get the thumb's position
        let thumbRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slider.trackRect(forBounds: slider.bounds), value: slider.value)
        thumbLabel.frame = CGRect(x: thumbRect.midX - 15, y: thumbRect.minY - 30, width: 30, height: 20)
    }
}

