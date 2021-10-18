import SwiftUI

struct AddPostScreen: View {
    @State var firstname:String = ""
    @State var lastname:String = ""
    @State var isLoading = false
    @State var phone:String = ""
    @Environment(\.presentationMode) var presentation
    @ObservedObject var database = RealtimeStore()
    
    
    func addNewPost(){
        let contact = Contact(firstname: firstname, lastname: lastname, phone: phone)
        database.storePost(contact: contact , completion: { success in
            
            isLoading = false
            if success{
                self.presentation.wrappedValue.dismiss()
                
            }
            
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                 TextField("Firstname", text: $firstname)
                    .frame(height: 60).padding(.leading,10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                TextField("Lastname", text: $lastname)
                   .frame(height: 60).padding(.leading,10)
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                TextField("Phone", text: $phone)
                   .frame(height: 60).padding(.leading,10)
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                 
                Button {
                    addNewPost()
                } label: {
                    Spacer()
                    Text("Add").foregroundColor(.white)
                    Spacer()
                }.frame(height: 45).background(Color.red)
                    .cornerRadius(10)
Spacer()
            }
        }.padding()
    }
}

struct AddPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPostScreen()
    }
}
