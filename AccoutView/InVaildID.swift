//
//  InVaildID.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/03.
//

import SwiftUI

struct InVaildID: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }.alert("Alert Title", isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text("This is alert dialog sample")
        }
    }
}

struct InVaildID_Previews: PreviewProvider {
    static var previews: some View {
        InVaildID()
    }
}
