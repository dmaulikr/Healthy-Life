//
//  DetailViewController.swift
//  HealthyLife
//
//  Created by admin on 8/1/16.
//  Copyright © 2016 NguyenBui. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation
import AVKit


class DetailViewController: UIViewController {
    
    var activity: Activities!
  
    var creatorID = String()
    var nameOfPlan = String()
    var activityName = String()
    var trackingRef: FIRDatabaseReference!

    @IBOutlet weak var cancelButtonLabel: UIButton!
    @IBOutlet weak var playInstructionButton: UIButton!
    

    
    @IBOutlet weak var finishButtonLable: UIButton!
    
    @IBOutlet weak var repCountLabel: UILabel!
    
    @IBOutlet weak var setCountLabel: UILabel!
    
    @IBOutlet weak var startButtonLabel: UIButton!
    
    @IBOutlet weak var amountView: UIView!
    
    @IBAction func startButtonAction(sender: AnyObject) {
        finishButtonLable.hidden = false
        amountView.hidden = false
        
      
        startButtonLabel.hidden = true
        cancelButtonLabel.hidden = true
        playInstructionButton.hidden = true
        
        trackingRef.setValue(["activityName": activity.name , "nameOfPlan": nameOfPlan])
        
        
    }
    
   
    @IBAction func playInstructionAction(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "playVideo"
        {
         
            let url = NSURL(string:  activity.videoUrl)
            let destination = segue.destinationViewController as! AVPlayerViewController
            
            destination.player = AVPlayer(URL: url!)
        
        }
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func finishAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        trackingRef.removeValue()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackingRef = DataService.dataService.baseRef.child("users").child(creatorID).child("tracking").child((FIRAuth.auth()?.currentUser?.uid)!).child("workingOn")
        
        finishButtonLable.hidden = true
        amountView.hidden = true
        
        amountView.layer.cornerRadius = 10
        amountView.clipsToBounds = true
        
        startButtonLabel.layer.cornerRadius = 10
        startButtonLabel.clipsToBounds = true
        
        finishButtonLable.layer.cornerRadius = 10
        finishButtonLable.clipsToBounds = true
        
        cancelButtonLabel.layer.cornerRadius = 10
        cancelButtonLabel.clipsToBounds = true
        
        
        repCountLabel.text = activity.rep
        setCountLabel.text = activity.set
        
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
