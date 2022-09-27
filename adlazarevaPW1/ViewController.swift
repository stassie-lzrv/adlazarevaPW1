//
//  ViewController.swift
//  adlazarevaPW1
//
//  Created by Настя Лазарева on 20.09.2022.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

func generateString()-> String{
    let arr = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
    return "#".appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)]).appending(arr[Int.random(in:0..<15)])
}


class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        for view in views {
            view.layer.cornerRadius=10
        }
        
    }
    
    
    
    
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        var set = Set<UIColor>()
        while set.count < views.count{
            set.insert(UIColor(hex: generateString())!)
        }
            UIView.animate(withDuration: 2,  animations: {
                for view in self.views {
                    view.layer.cornerRadius=16
                    view.backgroundColor=set.popFirst()
                }
            }){ completion in
                button?.isEnabled = true
                           
        }
        
    }
    

}

