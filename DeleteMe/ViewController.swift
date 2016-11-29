//
//  ViewController.swift
//  DeleteMe
//
//  Created by Adrian B on 11/28/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speechLabel: UILabel!
    @IBOutlet weak var speakButton: UIButton!

    // declare your CanSpeak object. I just initialized it because you're presumably going to use it all the time.
    var canSpeak: CanSpeak?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Button Actions

    @IBAction func speakButtonAction(_ sender: Any) {
        speakButton.setTitle("I'm Busy", for: .normal)
        speechLabel.text = "Now I'm saying something"
        canSpeak = CanSpeak()
        // since I declared canSpeak as an optional, the delegate needs to be set once it's instantiated
        canSpeak?.delegate = self
        canSpeak?.sayThis("How much wood could a woodchuck chuck if a woodchuck could chuck wood.")

    }

}

// I like to put delegate methods in extensions, as I find the code to be more readable. You can also dump delegate stuff in ViewController's class declaration and implement the protocol there.
extension ViewController: CanSpeakDelegate {
    func speechSynthesizerDone(sender: CanSpeak) {
        print("speechSynthesizerDone")
        speakButton.setTitle("Press Me", for: .normal)
        speechLabel.text = "CanSpeak is finished"
    }
}
