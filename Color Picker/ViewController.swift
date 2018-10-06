//
//  ViewController.swift
//  Color Picker
//
//  Created by Joseph Chandler on 10/5/18.
//  Copyright © 2018 Joseph Chandler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!

    struct Color {
        var Systemcolor: UIColor
        var colorLabel: String
        init(Color: UIColor, Label: String) {
            Systemcolor = Color
            colorLabel = Label
        }
    }
    //let colors: [UIColor] = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.cyan]
    var colorArray: [Color] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorArray.append(Color(Color: UIColor.red, Label: "red"))
        colorArray.append(Color(Color: UIColor.green, Label: "green"))
        colorArray.append(Color(Color: UIColor.blue, Label: "blue"))
        colorArray.append(Color(Color: UIColor.yellow, Label: "yellow"))
        colorArray.append(Color(Color: UIColor.cyan, Label: "cyan"))
        colorArray.append(Color(Color: UIColor.brown, Label: "brown"))
        
        //set initial conditions
        let first = colorArray[0]
        colorLabel.text = first.colorLabel
        colorPicker.selectRow(0, inComponent: 0, animated: true)
        
        colorPicker.dataSource = self
        colorPicker.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorLabel.text = (colorArray[row].colorLabel)
        self.view.backgroundColor = (colorArray[row].Systemcolor)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (colorArray[row].colorLabel)
    }
}
