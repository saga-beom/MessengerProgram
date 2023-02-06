//
//  isVaildEmail.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/03.
//

import Foundation
import UIKit

func isValidEmail(email:String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return emailTest.evaluate(with: email)
}
