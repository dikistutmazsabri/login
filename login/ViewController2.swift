//
//  ViewController2.swift
//  login
//
//  Created by Burak Polat on 24.02.2022.
//

import UIKit
import CoreData
class ViewController2: UIViewController {
    
    
    @IBOutlet weak var saveNameTextfield: UITextField!
    
    @IBOutlet weak var savePasswordTextfield: UITextField!
    
    @IBOutlet weak var savePasswordTextfieldAgain: UITextField!
    
    
    @IBOutlet weak var status2: UILabel!
    
    
    
    @IBAction func save2(_ sender: Any) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let login = NSEntityDescription.insertNewObject(forEntityName: "Login", into: context)
        login.setValue(saveNameTextfield.text, forKey: "name")
        login.setValue(savePasswordTextfieldAgain.text, forKey: "password")
        login.setValue(UUID(), forKey: "id")
        do{
            try context.save()
            status2.text = "SAVE SUCCSESS"
        }catch{
            
        }
        
    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if savePasswordTextfield.text! == savePasswordTextfieldAgain.text! && saveNameTextfield.text! != "" {
            
            
            
        }
    }
    

  

}
