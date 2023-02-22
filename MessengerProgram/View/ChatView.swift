//
//  ChatView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI
import CoreData

struct ChatView: View {
    @Environment (\.managedObjectContext) var manageObjectContext
    @Environment (\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [SortDescriptor(\.friendIDNickname, order: .reverse)]) var Friend: FetchedResults<Friend>
    
    @State private var ID = ""
    @State private var friendID = ""
    @State private var friendNickname = "''"
    
    var body: some View {
        VStack {
            
            ForEach(Friend) { item in
                Text(item.friendIDNickname!)
            }
        }
    }
    

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
