//
//  ContactCell.swift
//  FirePerfect
//
//  Created by Oybek To’laboyev on 17/10/21.
//

import SwiftUI


struct ContactCell: View {
    
    var contact: Contact
    
    var body: some View {
        
        VStack(alignment: .leading){
            if contact.firstname != nil {
            HStack{
                
                Text(contact.firstname!.uppercased())
                    .fontWeight(.bold).foregroundColor(Color.red)
                Text(contact.lastname!.uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            Text(contact.phone!).padding(.top,5)
            } else {
             Text("Good Mood")
            }
        }
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(firstname: "Oybek", lastname: "Tulaboev", phone: "+998998526144"))
    }
}
