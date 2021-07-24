//
//  CardsScroll.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI

struct CardsScroll: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
               // Card()
                Spacer(minLength: 16)
                //Card()
            }
        }
    }
}

struct CardsScroll_Previews: PreviewProvider {
    static var previews: some View {
        CardsScroll()
    }
}
