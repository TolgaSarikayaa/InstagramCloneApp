//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Tolga Sarikaya on 12.12.22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage


class FeedCell: UITableViewCell {
    
   
    
    // MARK: - UI Elements
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
   @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    // MARK: - Functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    // MARK: - Action
    @IBAction func likeButtonClicked(_ sender: Any) {
       
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
    }
    

}
