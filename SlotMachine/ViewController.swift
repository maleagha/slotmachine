//
//  ViewController.swift
//  SlotMachine
//
//  Created by M on 3/5/17.
//  Copyright © 2017 M. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource {

    
    
    
    var pickerDataSource = [1...100,1...100,1...100]
    
    let icons: [UIImageView] = [
        UIImageView(image: #imageLiteral(resourceName: "tips-icon")),
        UIImageView(image: #imageLiteral(resourceName: "business-summary")),
        UIImageView(image: #imageLiteral(resourceName: "contacts-icon")),
        UIImageView(image: #imageLiteral(resourceName: "location-icon"))
    ]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 0.05,
                             target: self,
                             selector: #selector(scroller),
                             userInfo: nil,
                             repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scroller() {
        let component = arc4random() % 3
        let row = arc4random() % 100
        pickerView.selectRow(Int(row), inComponent: Int(component), animated: true)
    }

}


extension ViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource[component].count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerDataSource[component][row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //let index = Int(arc4random() % 2)
        switch row % 3 {
        case 0:
            return UIImageView(image: #imageLiteral(resourceName: "contacts-icon"))
        case 1:
            return UIImageView(image: #imageLiteral(resourceName: "business-summary"))
        case 2:
            return UIImageView(image: #imageLiteral(resourceName: "tips-icon"))
        default:
            return UIImageView(image: #imageLiteral(resourceName: "location-icon"))
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return #imageLiteral(resourceName: "location-icon").size.height
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return #imageLiteral(resourceName: "location-icon").size.width
    }
    
}

