//
//  ViewController.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import UIKit

class ViewController: UIViewController {
  var orderData: Order?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  private func createDemoData() {
    var payments = [Payment]()
    payments.append(Payment(amount: 1231,
                            date: Date(timeIntervalSince1970: 8800211),
                            status: Payment.Status.completed))
    payments.append(Payment(amount: 1231,
                            date: Date(timeIntervalSince1970: 8800912),
                            status: Payment.Status.completed))
    payments.append(Payment(amount: 1231,
                            date: Date(timeIntervalSince1970: 8800219),
                            status: Payment.Status.waitning))
    
    orderData = Order(number: 228, payments: payments)
  }
}

