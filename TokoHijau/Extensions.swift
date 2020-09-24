//
//  Extensions.swift
//  TokoHijau
//
//  Created by Juansyah - on 18/09/20.
//  Copyright © 2020 Juansyah. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
  func fillParent(alignment: Alignment = .center) -> some View {
    self
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: alignment
    )
  }
}
