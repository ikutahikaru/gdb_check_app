//
//  ViewController.swift
//  color
//
//  Created by 迫 佑樹 on 2015/12/26.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var RGBLabel: UILabel!
    
    @IBOutlet var redValue: UISlider!
    @IBOutlet var blueValue: UISlider!
    @IBOutlet var greenValue: UISlider!
    
    @IBOutlet var table: UITableView!
    var r = 255, b = 255, g = 255

    func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    func check(var value: Int) -> Int{
        if value > 255{
            value = 255
        }
        if value < 0 {
            value = 0
        }
        
        return value
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 13
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //indexPath.rowで上から何番目なのか取れる
        
        var red = r, green = g, blue = b
        switch indexPath.row {
        case 1:
            red = check(r-20)
        case 2:
            red = check(r-10)
        case 3:
            red = check(r+10)
        case 4:
            red = check(r+20)
        case 5:
            green = check(g-20)
        case 6:
            green = check(g-10)
        case 7:
            green = check(g+10)
        case 8:
            green = check(g+20)
        case 9:
            blue = check(b-20)
        case 10:
            blue = check(b-10)
        case 11:
            blue = check(b+10)
        case 12:
            blue = check(b+20)
        default:
            break // do nothing
        }
        
        cell.backgroundColor = rgb(red,g:green,b:blue,alpha:1)
        
        cell.textLabel?.text = String(NSString(format: "%02x%02x%02x", red, green, blue)).uppercaseString
        
        return cell
        
    }
    
    func changeValue(){

        RGBLabel.text = "RGB value is #" + String(NSString(format: "%02x%02x%02x", r, g, b)).uppercaseString
        table.reloadData()
    }
    
    
    @IBAction func redSlide(sender: AnyObject) {
        print(redValue)
        r = Int(redValue.value)
        redLabel.text = "R: \(r)"
        changeValue()
    }
    
    @IBAction func blueSlide(sender: AnyObject) {
        print(blueValue)
        b = Int(blueValue.value)
        blueLabel.text = "B: \(b)"
        changeValue()
    }
    
    @IBAction func greenSlide(sender: AnyObject) {
        print(greenValue)
        g = Int(greenValue.value)
        greenLabel.text = "G: \(g)"
        changeValue()

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLabel.text = "R: \(r)"
        blueLabel.text = "B: \(b)"
        greenLabel.text = "G: \(g)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

