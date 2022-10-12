//
//  ViewController.swift
//  MVC Trainer Data
//
//  Created by Mac on 21 / 9/ 2022.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var trainerTable: UITableView!

    // created empty array to store the new Data

    var teacher : [trainer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainerTable.dataSource = self
        trainerTable.delegate = self
    
// Registering Nib file
        let nib = UINib(nibName: "TrainerInfoTableViewCell", bundle: nil)
        self.trainerTable.register(nib, forCellReuseIdentifier: "TrainerCell")
    }
    
// Button To Add Data From SeconndViewController
    @IBAction func toAddData(_ sender: Any) {
        
        let secondVc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as! SecondViewController
        
        secondVc.delegateSVC = self // Creating Instance Of Delegate Property
        
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
}

// Extension for using TableView Cell

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teacher.count
    }
    // Function to Access xib file Data and to bind with New Data From SecondViewController
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.trainerTable.dequeueReusableCell(withIdentifier: "TrainerCell", for: indexPath)as! TrainerInfoTableViewCell
        
        let eachTrainer = teacher[indexPath.row]
        cell.noTrainer.text = String(eachTrainer.trainerNo)
        cell.nameTrainer.text = eachTrainer.trainerName
        cell.subjectTrainer.text = eachTrainer.trainerSubject
        cell.salaryTrainer.text = String(eachTrainer.trainerSalary)
        
        return cell
    }
    
}

// Extension To Design Table View Cell
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
func tableView(_ tableView: UITableView, commit editingstyle: UITableViewCell.EditingStyle, forRowAt indexpath:IndexPath)
    {
        if editingstyle == .delete{
            trainerTable.beginUpdates()
           teacher.remove(at: indexpath.row)
            trainerTable.deleteRows(at: [indexpath], with: .left)
            trainerTable.endUpdates()
        }
    }
}
 
// Confroming to Protocol and Appending new Data To Empty Array declared named 'teacher'
extension ViewController: dataProtocol{
    func file(data: trainer) {
         let dataOfTrainer = trainer(trainerNo: data.trainerNo , trainerName: data.trainerName , trainerSubject: data.trainerSubject , trainerSalary: data.trainerSalary )
            
        teacher.append(dataOfTrainer)
        self.trainerTable.reloadData()
    }
}
