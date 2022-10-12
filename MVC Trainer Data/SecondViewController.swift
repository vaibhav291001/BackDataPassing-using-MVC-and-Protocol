//
//  SecondViewController.swift
//  MVC Trainer Data
//
//  Created by Mac on 21 / 9/ 2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var trainerNumber: UITextField!
    @IBOutlet weak var trainerName1: UITextField!
    @IBOutlet weak var trainerSubject1: UITextField!
    @IBOutlet weak var trainerSalary1: UITextField!
    
    //created Delegate Property For Protocol
    var delegateSVC : dataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func toFirstVC(_ sender: Any) {
        guard let delegate = delegateSVC
        else
        {
            print("Object Do Not Found")
            return
            
        }
        
        let no = Int(self.trainerNumber.text!)
        let name = self.trainerName1.text
        let subject = self.trainerSubject1.text
        let salary = Int(self.trainerSalary1.text!)
        
        //Adding Alert If Number is Nil
        if ( no == nil){
            let alert = UIAlertController(title: "Alert", message: "Trainer Number is Empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert,animated: true ,completion: {
                return
            })
        }
        // Adding Alert If Name Is Nil
        if let name = self.trainerName1.text, name.isEmpty{
            let nameAlert = UIAlertController(title: "Alert", message: "Trainer Name Is Empty", preferredStyle: .alert)
            nameAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(nameAlert,animated: true,completion: {
                return
            })
        }
        
        //Adding Alert if Subject Is Nil
        if let subject = self.trainerSubject1.text , subject.isEmpty{
            let subjectAlert = UIAlertController(title: "Alert", message: "Subject Is Empty", preferredStyle: .alert)
            subjectAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(subjectAlert, animated: true, completion: {
                return
            })
        }
        
        // Adding Alert if Salary Is Nil
        if let salary = self.trainerSalary1.text, salary.isEmpty{
            let salaryAlert = UIAlertController(title: "Alert", message: "salary Is Empty", preferredStyle: .alert)
            salaryAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(salaryAlert, animated: true, completion: {
                return
            })
        }
       
      
        let infotobepassed = trainer(trainerNo: no ?? 1, trainerName: name ?? "v", trainerSubject: subject ?? "v", trainerSalary: salary ?? 2)
       
        delegate.file(data: infotobepassed )
        self.navigationController?.popViewController(animated: true)
    }
}
