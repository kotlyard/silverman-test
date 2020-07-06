//
//  PaymentsPresenter.swift
//  Silverman
//
//  Created by Денис Котляр on 05.07.2020.
//

import Foundation
import UIKit

class OrderPresenter: NSObject {
  let order: Order = Order.createDemoData()
}


extension OrderPresenter: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PaymentCollectionViewCell
    
    return cell
  }
  
  
}
