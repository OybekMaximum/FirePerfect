import Foundation

struct Contact: Hashable{
    var firstname: String?
    var lastname: String?
    var phone: String?
    var imgUrl: String?
    

//
    init(firstname: String?, lastname: String?, phone: String?){
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone

    }
//
    init(firstname: String?, lastname: String?, phone: String?, imgUrl: String?){
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
        self.imgUrl = imgUrl

    }
}
