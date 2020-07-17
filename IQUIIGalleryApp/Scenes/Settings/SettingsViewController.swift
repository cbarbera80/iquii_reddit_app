//
//  SettingsViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!
    
    private var appVersionString: String {
        
        guard let appVersionString = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString"),
            let appBuildString = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") else { return "" }
        
        return "\(appVersionString) build \(appBuildString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionLabel.text = appVersionString
    }
    
    @IBAction func clearCache() {
        URLCache.shared.removeAllCachedResponses()
        
        let alert = UIAlertController(title: "IQUII Gallery App", message: "Cache cleared successfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
