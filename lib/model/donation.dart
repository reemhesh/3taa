class Donation{
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  final String ScanningBarcode ;
  final String MedNameDonated;
  final String MedAmountDonated;

  final   bool expired;
 // final bool delivered;

  Donation(
      this.name,
      this.phoneNumber,
      this.email,
      this.country,

      this.ScanningBarcode,
      this.MedNameDonated,
      this.MedAmountDonated,
      this.expired
      );

factory Donation.fromRTDB(Map<String, dynamic> data){
  return Donation(
      data['name']??'no one'
    , data['phoneNumber']??'no one',
      data['email'] ??'no one',
      data['country'] ??'no one' ,

        data['ScanningBarcode']??'no med'
      ,data['MdNameDonated']??'no med'
      ,data['medAmountDonated']??'no med',
       data['expired']??'false'
  );

}}





class Storage {

  final String ScanningBarcode;
  final String MedNameDonated;
  final String MedAmountDonated;
  final bool expired;

  Storage(this.ScanningBarcode,
      this.MedNameDonated,
      this.MedAmountDonated,
      this.expired);

  factory Storage.fromRTDB(Map<String, dynamic> data ){
    return Storage(
        data['ScanningBarcode'] ?? 'no med'
        , data['MedNameDonated'] ?? 'no med'
        , data['MedAmountDonated'] ?? 'no med',
        data['expired'] ?? 'false'
    );
  }
  String fancyDescription(){
    return'Today \'s specail proccessing  $MedNameDonated :$MedAmountDonated   barcode$ScanningBarcode for not expired med ${expired.toString()}';
  }


}




