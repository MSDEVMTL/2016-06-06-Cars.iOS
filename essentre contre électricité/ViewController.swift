//
//  ViewController.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-17.
//  Copyright © 2016 Analystik. All rights reserved.
// FIRST COMMIT

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let postEndpoint: String = "https://secure.bixi.com/data/stations.json"
		
		let url = NSURL(string: postEndpoint)!
		
		let session = NSURLSession.sharedSession()
		session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
			
			do{
				if let webdata = NSString(data:data!, encoding: NSUTF8StringEncoding){
					let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
					//print(jsonDictionary)
					let origin = jsonDictionary["stations"] as! NSArray
					let stationname = origin[9]["s"] as! NSString
					print(stationname)
					dispatch_async(dispatch_get_main_queue(), {
						//self.label.text = stationname.stringByReplacingOccurrencesOfString("/", withString: "-")
					})
					
				}
				
			} catch {
				print("not working")
				
			}
			
			
			
		}).resume()
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

