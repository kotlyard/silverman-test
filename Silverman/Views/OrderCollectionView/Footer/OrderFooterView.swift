//
//  OrderFooterView.swift
//  Silverman
//
//  Created by Денис Котляр on 06.07.2020.
//

import Foundation
import UIKit

class OrderFooterView: UICollectionReusableView {

  static let size = CGSize(width: 327, height: 66)

  @IBOutlet weak var amountLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    layer.cornerRadius = 12
    layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
  }
}
