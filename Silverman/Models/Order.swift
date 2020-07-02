//
//  Order.swift
//  Silverman
//
//  Created by Денис Котляр on 02.07.2020.
//

import Foundation

struct Order {
  let number: Int
  let totalAmount: Double
  let payments: [Payment]
  
  init(number: Int, payments: [Payment]) {
    self.number = number
    self.payments = payments
    
    var tmpAmount: Double = 0
    payments.forEach {
      tmpAmount += $0.amount
    }

    totalAmount = tmpAmount
  }
}

struct Payment {
  enum Status {
    case waitning
    case completed
  }

  let amount: Double
  let date: Date
  let status: Status
}
