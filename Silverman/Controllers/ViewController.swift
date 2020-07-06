//
//  ViewController.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import UIKit

class PaymentsViewController: UIViewController {
  let presenter = OrderPresenter()

  @IBOutlet weak var collection: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    collection.delegate = self
  }
  
}


extension PaymentsViewController: UICollectionViewDelegate {
  
}
