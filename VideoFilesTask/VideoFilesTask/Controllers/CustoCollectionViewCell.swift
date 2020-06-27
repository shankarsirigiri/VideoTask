//
//  CustoCollectionViewCell.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//


import UIKit

class CustoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgIcon.layer.cornerRadius  = 10
    }

}
