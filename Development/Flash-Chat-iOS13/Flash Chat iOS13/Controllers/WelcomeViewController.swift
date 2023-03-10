//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import GhostTypewriter

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cursorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Three lines below are to use GhostTypeWriter.
         Make sure to change titleLabel type above to TypeWriterLabel
         and set UILabel custom class to GhostTypewriter in the Interface
         Builder.twit
        */
        
//        titleLabel.typingTimeInterval = 0.2
//        titleLabel.startTypewritingAnimation()
//        cursorView.alpha = 0.0
        
        titleLabel.text = ""
        let titleText = "⚡️FlashChat"
        var charIndex = 0.0
        let titleTextSpeed = 0.2

        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: titleTextSpeed * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
                timer.invalidate()
            }
            charIndex += 1.0
        }
        
        let waitToBlinkCursor = (titleTextSpeed * Double(titleText.count)) + titleTextSpeed
        Timer.scheduledTimer(withTimeInterval: waitToBlinkCursor, repeats: false) { (timer) in
            self.cursorView.flash(numberOfFlashes: 10000.0)
            timer.invalidate()
        }
    }
}

extension UIView {
    func flash(numberOfFlashes: Float) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.6
        flash.fromValue = 1
        flash.toValue = 0.0
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        flash.autoreverses = true
        flash.repeatCount = numberOfFlashes
        layer.add(flash, forKey: nil)
    }
}
