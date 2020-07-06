//
//  OrderHeaderView.swift
//  Silverman
//
//  Created by Денис Котляр on 06.07.2020.
//

import Foundation
import UIKit

protocol OrderHeaderDelegate: class {
  func headerTapped(_ section: Int)
}

class OrderHeaderView: UICollectionReusableView {
  static let size = CGSize(width: 327, height: 98)

  @IBOutlet weak var orderNumber: UILabel!
  @IBOutlet weak var amountLabel: UILabel!

  weak var delegate: OrderHeaderDelegate?
  var section: Int = 0

  override func awakeFromNib() {
    super.awakeFromNib()

    let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
    
    addGestureRecognizer(gesture)
    layer.cornerRadius = 12
    layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

  @objc private func tapped() {
    UIView.animate(withDuration: 0.15, animations: {
      self.alpha = 0.7
    }) { _ in
      UIView.animate(withDuration: 0.15) {
        self.alpha = 1
      }
    }
    delegate?.headerTapped(section)
  }

}
