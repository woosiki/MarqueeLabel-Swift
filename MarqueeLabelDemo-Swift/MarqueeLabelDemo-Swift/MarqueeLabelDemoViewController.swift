/**
* Copyright (c) 2014 Charles Powell
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/

//
//  MarqueeLabelDemoViewController.swift
//  MarqueeLabelDemo-Swift
//

import UIKit

class MarqueeLabelDemoViewController : UIViewController {
    
    @IBOutlet weak var demoLabel1: MarqueeLabel!
    @IBOutlet weak var demoLabel2: MarqueeLabel!
    @IBOutlet weak var demoLabel3: MarqueeLabel!
    @IBOutlet weak var demoLabel4: MarqueeLabel!
    @IBOutlet weak var demoLabel5: MarqueeLabel!
    @IBOutlet weak var demoLabel6: MarqueeLabel!
    
    @IBOutlet weak var labelizeSwitch: UISwitch!
    @IBOutlet weak var holdLabelsSwitch: UISwitch!
    @IBOutlet weak var pauseLabelsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Continuous Type
        demoLabel1.tag = 101
        demoLabel1.type = .Continuous
        demoLabel1.speed = .Duration(15)
        demoLabel1.animationCurve = .EaseInOut
        demoLabel1.fadeLength = 10.0
        demoLabel1.leadingBuffer = 30.0
        demoLabel1.trailingBuffer = 20.0
        // Text string for this label is set via Interface Builder!
        
        
        // Reverse Continuous Type, with attributed string
        demoLabel2.tag = 201
        demoLabel2.type = .ContinuousReverse
        demoLabel2.textAlignment = .Right
        demoLabel2.lineBreakMode = .ByTruncatingHead
        demoLabel2.speed = .Duration(8.0)
        demoLabel2.fadeLength = 15.0
        demoLabel2.leadingBuffer = 40.0
        
        let attributedString2 = NSMutableAttributedString(string:"This is a long string, that's also an attributed string, which works just as well!")
        attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 18)!, range: NSMakeRange(0, 21))
        attributedString2.addAttribute(NSBackgroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, 14))
        attributedString2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0.234, green: 0.234, blue: 0.234, alpha: 1.0), range: NSMakeRange(0, attributedString2.length))
        attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size: 18)!, range: NSMakeRange(21, attributedString2.length - 21))
        demoLabel2.attributedText = attributedString2
        
        
        // Left/right example, with rate usage
        demoLabel3.tag = 301
        demoLabel3.type = .LeftRight
        demoLabel3.speed = .Rate(60)
        demoLabel3.fadeLength = 10.0
        demoLabel3.leadingBuffer = 30.0
        demoLabel3.trailingBuffer = 20.0
        demoLabel3.textAlignment = .Center
        demoLabel3.text = "This is another long label that scrolls at a specific rate, rather than scrolling its length in a defined time window!"
        
        
        // Right/left example, with tap to scroll
        demoLabel4.tag = 401
        demoLabel4.type = .RightLeft
        demoLabel4.textAlignment = .Right
        demoLabel4.lineBreakMode = .ByTruncatingHead
        demoLabel4.tapToScroll = true
        demoLabel4.trailingBuffer = 20.0
        demoLabel4.text = "This label will not scroll until tapped, and then it performs its scroll cycle only once. Tap me!"
        
        
        // Continuous, with tap to pause
        demoLabel5.tag = 501
        demoLabel5.type = .Continuous
        demoLabel5.speed = .Duration(10)
        demoLabel5.fadeLength = 10.0
        demoLabel5.trailingBuffer = 30.0
        demoLabel5.text = "This text is long, and can be paused with a tap - handled via a UIGestureRecognizer!"
        
        demoLabel5.userInteractionEnabled = true // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "pauseTap:")
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        demoLabel5.addGestureRecognizer(tapRecognizer)
        
        // Continuous, with attributed text
        demoLabel6.tag = 601
        demoLabel6.type = .Continuous
        demoLabel6.speed = .Duration(15.0)
        demoLabel6.fadeLength = 10.0
        demoLabel6.trailingBuffer = 30.0
        
        let attributedString6 = NSMutableAttributedString(string:"This is a long, attributed string, that's set up to loop in a continuous fashion!")
        attributedString6.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0.123, green: 0.331, blue: 0.657, alpha: 1.000), range: NSMakeRange(0,34))
        attributedString6.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0.657, green: 0.096, blue: 0.088, alpha: 1.000), range: NSMakeRange(34, attributedString6.length - 34))
        attributedString6.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range: NSMakeRange(0, 16))
        attributedString6.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range: NSMakeRange(33, attributedString6.length - 33))
        demoLabel6.attributedText = attributedString6;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // If you have trouble with MarqueeLabel instances not automatically scrolling, implement the
        // viewWillAppear bulk method as seen below. This will attempt to restart scrolling on all
        // MarqueeLabels associated (in the view hierarchy) with the calling view controller
        
        // MarqueeLabel.controllerViewWillAppear(self)
        
        // Or.... (see below)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        // Or you could use viewDidAppear bulk method - try both to see which works best for you!
    
        // MarqueeLabel.controllerViewDidAppear(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLabelTexts(sender: AnyObject) {
        // Use demoLabel1 tag to store "state"
        if (demoLabel1.tag == 101) {
            demoLabel1.text = "This label is not as long."
            demoLabel3.text = "This is a short, centered label."
            
            let attributedString2 = NSMutableAttributedString(string: "This is a different longer string, but still an attributed string, with new different attributes!")
            attributedString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, attributedString2.length))
            attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size:18.0)!, range:NSMakeRange(0, attributedString2.length))
            attributedString2.addAttribute(NSBackgroundColorAttributeName, value: UIColor(white:0.600, alpha:1.000), range:NSMakeRange(0,33))
            attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(19, attributedString2.length - 19))
            demoLabel2.attributedText = attributedString2;
            
            let attributedString6 = NSMutableAttributedString(string: "This is a different, longer, attributed string, that's set up to loop in a continuous fashion!")
            attributedString6.addAttribute(NSForegroundColorAttributeName, value:UIColor(red:0.657, green:0.078, blue:0.067, alpha:1.000), range:NSMakeRange(0,attributedString6.length))
            attributedString6.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(0, 16))
            attributedString6.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(33, attributedString6.length - 33))
            attributedString6.addAttribute(NSForegroundColorAttributeName, value: UIColor(red:0.123, green:0.331, blue:0.657, alpha:1.000), range:NSMakeRange(33, attributedString6.length - 33))
            demoLabel6.attributedText = attributedString6;
            
            demoLabel1.tag = 102;
        } else {
            demoLabel1.text = "This is a test of MarqueeLabel - the text is long enough that it needs to scroll to see the whole thing.";
            demoLabel3.text = "That also scrolls left, then right, rather than in a continuous loop!"
            
            let attributedString2 = NSMutableAttributedString(string: "This is a long string, that's also an attributed string, which works just as well!")
            attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size:18.0)!, range:NSMakeRange(0, 21))
            attributedString2.addAttribute(NSBackgroundColorAttributeName, value: UIColor.lightGrayColor(), range:NSMakeRange(10,11))
            attributedString2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red:0.234, green:0.234, blue:0.234, alpha:1.000), range:NSMakeRange(0,attributedString2.length))
            attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range: NSMakeRange(21, attributedString2.length - 21))
            demoLabel2.attributedText = attributedString2
            
            let attributedString6 = NSMutableAttributedString(string: "This is a long, attributed string, that's set up to loop in a continuous fashion!")
            attributedString6.addAttribute(NSForegroundColorAttributeName, value:UIColor(red:0.123, green:0.331, blue:0.657, alpha:1.000), range:NSMakeRange(0,attributedString6.length))
            attributedString6.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(0, 16))
            attributedString6.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(33, attributedString6.length - 33))
            demoLabel6.attributedText = attributedString6
            
            demoLabel1.tag = 101;
        }
    }
    
    func pauseTap(recognizer: UIGestureRecognizer) {
        let continuousLabel2 = recognizer.view as! MarqueeLabel
        if recognizer.state == .Ended {
            continuousLabel2.isPaused ? continuousLabel2.unpauseLabel() : continuousLabel2.pauseLabel()
        }
    }
    
    @IBAction func labelizeSwitched(sender: UISwitch) {
        if sender.on {
            MarqueeLabel.controllerLabelsLabelize(self)
        } else {
            MarqueeLabel.controllerLabelsAnimate(self)
        }
    }
    
    @IBAction func holdLabelsSwitched(sender: UISwitch) {
        for pv in view.subviews as [UIView] {
            if let v = pv as? MarqueeLabel {
                v.holdScrolling = sender.on
            }
        }
    }
    
    @IBAction func togglePause(sender: UISwitch) {
        for pv in view.subviews as [UIView] {
            if let v = pv as? MarqueeLabel {
                sender.on ? v.pauseLabel() : v.unpauseLabel()
            }
        }
    }
    
    @IBAction func unwindModalPopoverSegue(segue: UIStoryboardSegue) {
        // Empty by design
    }

}

