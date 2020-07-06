//
//  Order.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import Foundation

struct Order {
  let number: Int
  let totalAmount: Int
  let payments: [Payment]
  
  init(number: Int, payments: [Payment]) {
    self.number = number
    self.payments = payments
    
    var tmpAmount: Int = 0
    payments.forEach {
      tmpAmount += $0.amount
    }
    
    totalAmount = tmpAmount
  }
  
  static func createDemoData() -> Order {
    var payments = [Payment]()
    payments.append(Payment(amount: 1488,
                            date: Date(timeIntervalSince1970: 8800211),
                            status: Payment.Status.completed))
    payments.append(Payment(amount: 8882,
                            date: Date(timeIntervalSince1970: 8800912),
                            status: Payment.Status.completed))
    payments.append(Payment(amount: 8800,
                            date: Date(timeIntervalSince1970: 8800219),
                            status: Payment.Status.waiting))
    return Order(number: 228, payments: payments)
  }
}

struct Payment {
  enum Status {
    case waiting
    case completed
  }
  
  let amount: Int
  let date: Date
  let status: Status
}
