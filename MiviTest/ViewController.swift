//
//  ViewController.swift
//  MiviTest
//
//  Created by RajkumarThyadi on 5/6/18.
//  Copyright © 2018 RajkumarThyadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtEmail : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var btnLogIn : UIButton!
    @IBOutlet var txtBGView : UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewSetup(){
        self.btnLogIn.layer.cornerRadius = self.btnLogIn.frame.height/2
        self.btnLogIn.titleLabel?.textAlignment = NSTextAlignment.center
        self.txtBGView.layer.cornerRadius = 5.0

    }
    
    
    @IBAction func logInButtonPressed(sender: UIButton) {
        self.view.endEditing(true)
        var valid : Bool = true
        if(txtEmail.text!.characters.count <= 0  )
        {
            valid = false
            self.showAlert(title: "Error", message: "Please input your email address", tag: 0)
        }
        else if(!(txtEmail.text!.isValidEmail)){
            valid = false
            self.showAlert(title: "Error", message: "Invalid email address format", tag: 0)
        }
        else if( txtPassword.text!.length < 5)
        {
            valid = false
            self.showAlert(title: "Error", message: "Invalid password", tag: 0)
        }
        if(valid == true) {
            if let customerDetails = self.getDatafromJson(){
                if let val = customerDetails.data["attributes"] as? NSDictionary {
                    if( ((val.object(forKey: "email-address") ?? "") as! String) == txtEmail.text!){
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomerViewControllerId") as! CustomerViewController
                        nextVC.customerData = customerDetails
                        self.present(nextVC, animated: true, completion: nil)
                    }
                    else{
                        self.showAlert(title: "Error", message: "Invalid email address entered", tag: 0)

                    }
                }

            }
        }
        
    }
    
    func getDatafromJson() -> (data:NSDictionary,included:NSArray)? {
        
        guard let path = Bundle.main.path(forResource: "collection", ofType: "json") else {
            return nil
        }
            do {
                // do stuff

                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let data = jsonResult["data"] as? NSDictionary, let included = jsonResult["included"] as? [NSDictionary]{
                    
                    return (data,included as NSArray)
                }
                else{
                    return nil
                }
            } catch {
                // handle error
                return nil
            }
    }
    
    
    
    //MARK:================ Alertview ===========================================================
    
    func showAlert(title : String, message :String , tag: NSInteger)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    

    
    //MARK:================ TextField KeyBoard Handling ===========================================================
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        switch textField
        {
        case self.txtEmail :
            self.txtPassword.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
        
        
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

