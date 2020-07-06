//
//  PaymentView.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import UIKit

@IBDesignable
class PaymentCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var statusButton: UIButton!
  
  var status: Payment.Status = .waiting {
    didSet {
      updateStatus()
    }
  }
  
  static let size: CGSize = .init(width: 335, height: 64)

  private func updateStatus() {
    if status == .completed {
      dateLabel.textColor = .silverGreen
      amountLabel.textColor = .silverGreen

      statusButton.setTitle("Оплачено", for: .normal)
      statusButton.tintColor = .silverGreen
    } else {
      dateLabel.textColor = .black
      amountLabel.textColor = .black

      statusButton.setTitle("Ожидание", for: .normal)
      statusButton.tintColor = .silverDarkGrey
    }
  }
}
