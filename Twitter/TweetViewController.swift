//
//  TweetViewController.swift
//  Twitter
//
//  Created by Ian Polidora on 3/13/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetContentLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetContentLabel.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
        
    @IBAction func tweetButton(_ sender: Any) {
        if (!tweetContentLabel.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetContentLabel.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
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
