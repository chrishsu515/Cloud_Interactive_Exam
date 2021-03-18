//
//  TableViewCell.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var stkView: UIStackView!
    @IBOutlet weak var SquareView1: UIView!
    @IBOutlet weak var SquareView2: UIView!
    @IBOutlet weak var SquareView3: UIView!
    @IBOutlet weak var SquareView4: UIView!
    @IBOutlet weak var lblID1: UILabel!
    @IBOutlet weak var lblID2: UILabel!
    @IBOutlet weak var lblID3: UILabel!
    @IBOutlet weak var lblID4: UILabel!
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblTitle3: UILabel!
    @IBOutlet weak var lblTitle4: UILabel!
    
    @IBOutlet weak var imgAlbum1: UIImageView!
    @IBOutlet weak var imgAlbum2: UIImageView!
    @IBOutlet weak var imgAlbum3: UIImageView!
    @IBOutlet weak var imgAlbum4: UIImageView!
    
    @IBOutlet weak var actIndicatorView1: UIActivityIndicatorView!
    @IBOutlet weak var actIndicatorView2: UIActivityIndicatorView!
    @IBOutlet weak var actIndicatorView3: UIActivityIndicatorView!
    @IBOutlet weak var actIndicatorView4: UIActivityIndicatorView!
    
    let dataContainer = DataContainer()
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
