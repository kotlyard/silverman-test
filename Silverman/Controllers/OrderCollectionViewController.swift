//
//  ViewController.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import UIKit

class OrderCollectionViewController: UIViewController {
  let orders: [Order] =  [
    Order.createDemoData()
  ]

  // Key is section index. Value indicates if section is open.
  private var sectionsStatus: [Int: Bool] = [
    0: false
  ]

  @IBOutlet weak var collection: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let nib = UINib(nibName: "PaymentCollectionViewCell", bundle: nil)
    collection.register(nib, forCellWithReuseIdentifier: "PaymentCollectionViewCell")
    
    collection.register(UINib(nibName: "OrderHeaderView", bundle: nil),
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                        withReuseIdentifier: "header")
    collection.register(UINib(nibName: "OrderFooterView", bundle: nil),
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                        withReuseIdentifier: "footer")
  }
}

// MARK: - CollectionView
extension OrderCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width, height: PaymentCollectionViewCell.size.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    OrderHeaderView.size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    OrderFooterView.size
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    orders.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    if sectionsStatus[section] == true {
      return orders[section].payments.count
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView
      .dequeueReusableCell(withReuseIdentifier: "PaymentCollectionViewCell",
                           for: indexPath) as! PaymentCollectionViewCell
    
    cell.amountLabel.text = "\(orders[indexPath.section].payments[indexPath.row].amount) р."
    cell.dateLabel.text = "\(dateToString(orders[indexPath.section].payments[indexPath.row].date))"
    cell.numberLabel.text = "Оплата №\(indexPath.row + 1)"
    cell.status = orders[indexPath.section].payments[indexPath.row].status
    return cell
  }
  
  func dateToString(_ date: Date) -> String {
    let formater = DateFormatter()
    formater.dateFormat = "dd.mm.yy"
    
    return formater.string(from: date)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
      case UICollectionView.elementKindSectionHeader:
        let header = collectionView
          .dequeueReusableSupplementaryView(ofKind: kind,
                                            withReuseIdentifier: "header",
                                            for: indexPath) as! OrderHeaderView
        header.section = indexPath.section
        header.delegate = self
        header.amountLabel.text = "\( orders[indexPath.section].totalAmount) р."
        header.orderNumber.text = "Заказ №\( orders[indexPath.section].number)"
        return header
      case UICollectionView.elementKindSectionFooter:
        let footer =  collectionView
          .dequeueReusableSupplementaryView(ofKind: kind,
                                            withReuseIdentifier: "footer",
                                            for: indexPath) as! OrderFooterView
        footer.amountLabel.text = "\(orders[indexPath.section].totalAmount) р."
        return footer
      default:
        return UICollectionReusableView()
    }
  }
  
}

// MARK: - OrderHeaderDelegate
extension OrderCollectionViewController: OrderHeaderDelegate {
  func headerTapped(_ section: Int) {
    sectionsStatus[section]?.toggle()
    
    let layout = (collection.collectionViewLayout as? UICollectionViewFlowLayout)
    let indexPath = createIndexPath(for: section)
    if sectionsStatus[section] == true {
      layout?.sectionInset = .init(top: 2, left: 0, bottom: 0, right: 0)
      collection.insertItems(at: indexPath)
    } else {
      layout?.sectionInset = .zero
      collection.deleteItems(at: indexPath)
    }
  }
  
  
  func createIndexPath(for section: Int) -> [IndexPath] {
    var paths = [IndexPath]()
    for (index, _) in orders[section].payments.enumerated() {
      paths.append(IndexPath(item: index, section: section))
    }
    return paths
  }
}



