//
//  ViewController.swift
//  ZoomVideoSDKUIToolKitSample
//
//  This sample code is for debugging purposes only and is provided as-is and without warranties of any kind.
//  It is meant only to be used by the direct recipient and may not be redistributed.
//  Copyright 2023 Zoom Video Communications, Inc. All rights reserved.

import UIKit
import ZoomVideoSDKUIToolkit

class ViewController: UIViewController {
    
    let jwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6IkdmdTRERVRXU2tPVHJHOVhWUFc3LXciLCJleHAiOjE3MzQ0MDM0NzYsImlhdCI6MTczMzc5ODY3N30.eC1CYP93M4Nebys--QVg2luY9aXqd5bai8HTObh3_gk"
    let sessionName = "zoom mic test"
    let username = "Dan G"
    
    // If your session requires a password, you can use the password variable here as well.
    // let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Added a simple button and its action to demostrate how the Zoom Video SDK UI Toolkit can be called easily.
    
    @IBAction func tappedBtn(_ sender: UIButton) {
        // If your session requires a password, you will need to add it under the sessionPassword parameter under SessionContext.
        // let vc = UIToolkitVC(sessionContext: SessionContext(jwt: jwt, sessionName: sessionName, sessionPassword: password, username: username))
        
        let vc = UIToolkitVC(sessionContext: SessionContext(jwt: jwt, sessionName: sessionName, username: username))
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

// MARK: Zoom Video UI Kit Delegate

extension ViewController: UIToolkitDelegate {
    
    func onError(_ errorType: UIToolkitError) {
        print("Sample VC onError Callback: \(errorType.rawValue) -> \(errorType.description)")
    }
    
    func onViewLoaded() {
        print("Sample VC onViewLoaded")
    }
    
    func onViewDismissed() {
        print("Sample VC onViewDismissed")
    }
}
