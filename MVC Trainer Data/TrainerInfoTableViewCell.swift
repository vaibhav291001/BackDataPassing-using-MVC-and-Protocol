//
//  TrainerInfoTableViewCell.swift
//  MVC Trainer Data
//
//  Created by Mac on 21 / 9/ 2022.
//

import UIKit

class TrainerInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var noTrainer: UILabel!
    @IBOutlet weak var nameTrainer: UILabel!
    @IBOutlet weak var subjectTrainer: UILabel!
    @IBOutlet weak var salaryTrainer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
