//
//  LetsTalkMailMeViewController.swift
//  Resume
//
//  Created by Joseph Buchoff on 12/6/19.
//  Copyright © 2019 The Spot of Joe. All rights reserved.
//

import UIKit
import MessageUI

class LetsTalkMailMeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Launch email compose view
        let subject = "Let's set up an interview"
        let body = "Joe,\n\nMy name is ____ and I work with ____. I found your resume app, and I think you're what we're looking for! I'd like to set an interview up with you.\n\nHow does _:__AM/PM work on __/__/____?\n\nThis will be over the phone/in person at ______.\n\nLet me know,\n\nNAME"
        let to = ["joebuchoff@gmail.com"]
        let mailComposer: MFMailComposeViewController = MFMailComposeViewController()
        
        mailComposer.mailComposeDelegate = self
        mailComposer.setSubject(subject)
        mailComposer.setMessageBody(body, isHTML: false)
        mailComposer.setToRecipients(to)

        self.present(mailComposer, animated: true, completion: nil)
    }
    
    // I want to put this as a result of the TabButton, not a separate view... For now though I'm putting it as a part of this view

    func mailComposeController(_:MFMailComposeViewController, didFinishWith result:MFMailComposeResult, error:Error?) {

        self.presentedViewController!.dismiss(animated: true, completion: nil)
        
        // Segue to the "Who Am I" screen
        self.performSegue(withIdentifier: "doneWithMailSegue", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
