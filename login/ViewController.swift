//
//  ViewController.swift
//  login
//
//  Created by Burak Polat on 24.02.2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var nameArray  = [String] ()
    var passwordArray = [String] ()
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var status: UILabel!
    
    @IBAction func login(_ sender: Any) {
        nameArray.removeAll(keepingCapacity: false)
        passwordArray.removeAll(keepingCapacity: false)
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let fecth = NSFetchRequest<NSFetchRequestResult>(entityName: "Login")
        do {
            let results = try context.fetch(fecth)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String{
                    nameArray.append(name)
                }
                if let password = result.value(forKey: "password") as? String{
                    passwordArray.append(password)
                }
                if nameArray.contains(nameTextfield.text!) && passwordArray.contains(passwordTextfield.text!) {
                    performSegue(withIdentifier: "goto2", sender: nil)
                    status.text = "LOGIN SUCCSESS"
                }else{
                    status.text = "INVALID NAME OR PASSWORD"
                }
            }
        }catch{
            
        }
       
        
        
    }
    
    
    
    @IBAction func signin(_ sender: Any) {
        performSegue(withIdentifier: "goto", sender: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

