
/// Full UserProfile
class UserProfile {
  String fName;
  String lName;
  String address;
  String email;
  String mobileNo;

  UserProfile(this.fName, this.lName, this.address, this.email, this.mobileNo);

  UserProfile.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
    address = json['address'];
    email = json['email'];
    mobileNo = json['mobileNo'];
  }
}