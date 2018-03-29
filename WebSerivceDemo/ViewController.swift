//
//  ViewController.swift
//  WebSerivceDemo
//
//  Created by asmita.borawake on 29/03/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var myResponse  =   JSON()
    var users = [userModel]()
    var userdata = [String]()
    @IBOutlet weak var tablview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()


        
    fetchUserData()
    
    
    
    }
    
    func fetchUserData(){
        
        APIManager.sharedInstance.getUserData(){(userJson) -> Void in
            
            if userJson != nil{
                self.myResponse = userJson
                for i in 0..<self.myResponse.count{
                    let singleuser = userModel(userJson:self.myResponse[i])
                    
                    self.users.append(singleuser)
                    
                }
                
                DispatchQueue.main.async {
                    self.tablview.reloadData()
                }
                
            }
            
        }
        //print("data is",datas!)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
       
        return (self.users.count)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let myuser = users[indexPath.row]
        cell.name.text = myuser.name
        cell.username.text = myuser.username
        cell.email.text = myuser.email
        cell.phone.text = myuser.phone
        cell.companyname.text = myuser.company.companyName
        cell.companypharse.text = myuser.company.phrase
        cell.address.text = "\(myuser.address.city)\(myuser.address.street)\(myuser.address.suite)"
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

