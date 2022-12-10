class DetailCofee {
  int shopnumber;
  String shopname = '';
  String imagehead = '';
  List imagepreview = [];
  int coffeetype;
  List imagemenu = [];
  List detailshop = [
    {
      'address': '',
      'wifi': int,
      'phonenum': int,
      'carpark': int,
      'facebook': '',
      'mapshop': []
    }
  ];
  List feedback = [
    {
      'username': '',
      'date': '',
      'comment': '',
      'score': double,
      'shopnumber': int,
    }
  ];

  DetailCofee({
    required this.shopnumber,
    required this.shopname,
    required this.imagehead,
    required this.imagepreview,
    required this.coffeetype,
    required this.imagemenu,
    required this.detailshop,
    required this.feedback,
  });
}
