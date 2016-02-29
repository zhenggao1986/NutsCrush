//
//  ViewController.swift
//  NutsCrush
//
//  Created by Zheng Gao on 2/28/16.
//  Copyright © 2016 Zheng Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myNut.hidden = true
        myNut.backgroundColor = UIColor.blueColor()
        myNut.layer.cornerRadius = myNut.frame.size.width/2
        myNut.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myNut:UIImageView!

    var location = CGPoint(x:0, y:0)
    let screenSize:CGRect = UIScreen.mainScreen().bounds
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch! = touches.first!
        location = touch.locationInView(self.view)
        myNut.center = location
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch! = touches.first!
        location = touch.locationInView(self.view)
        myNut.center = location
    }

    private func generateRandomCGRect() -> CGRect {
        let xMin:Int = Int(screenSize.minX)
        let xMax:Int = Int(screenSize.maxX - myNut.layer.cornerRadius * 2)
        let yMin:Int = Int(screenSize.minY)
        let yMax:Int = Int((screenSize.maxY - myNut.layer.cornerRadius * 2) * 0.9)
        let randomPoint2D:Point2D = RandomGenerator2D.getRandom2D(xMin, xMax:xMax, yMin:yMin, yMax:yMax)
        return CGRect(x:randomPoint2D.x, y:randomPoint2D.y, width:Int(myNut.frame.width), height:Int(myNut.frame.height))
    }
    
    private func updateMyNut() {
        //myNut = UIImageView()
        //let myNutRect:CGRect = generateRandomCGRect()
        myNut.frame = generateRandomCGRect()//CGPoint(x:Int(myNutRect.minX), y:Int(myNutRect.midY))
        myNut.hidden = false
    }
    
    private func createNuts(var numberOfNuts:Int) {
        while --numberOfNuts >= 0 {
            let targetNut:UIImageView = UIImageView()
            targetNut.backgroundColor = UIColor.blackColor()
            targetNut.frame = generateRandomCGRect()
            targetNut.layer.cornerRadius = myNut.layer.cornerRadius
            targetNut.clipsToBounds = true
            self.view.addSubview(targetNut)
        }
    }

    @IBOutlet weak var showNutsButton: UIButton!
    
    @IBAction func onClickShowNuts(sender: UIButton) {
        for viewToDelete in self.view.subviews{
            if viewToDelete is UIImageView && viewToDelete.backgroundColor != myNut.backgroundColor {
                viewToDelete.removeFromSuperview()
            }
        }
        updateMyNut()
        createNuts(3)
    }
}

