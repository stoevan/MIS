class Clothes
{
  int id;
  String name;
  String imagePath;
  String description;
  int price;

  Clothes({required this.id, required this.name, required this.imagePath,required this.description,required this.price});



static List<Clothes> listAll(){
  return [Clothes(id: 1,
          name: 'Elegant Black Dress',
          imagePath: "assets/images/blackdress.jpg",
          description: "A timeless black dress with a sleek, body-hugging silhouette and a graceful neckline.Perfect for formal events, date nights, or an evening out, this dress is your ultimate go-to for effortless elegance."
          , price: 1500),
  Clothes(id: 2,
      name: 'Warm Cardigan',
      imagePath: 'assets/images/cardigan.jpg',
      description: "This cozy cardigan is crafted from a soft, breathable knit fabric that provides warmth without the bulk."
      , price: 900),
  Clothes(id: 3,
      name: 'ClassicFit Denim Jeans',
      imagePath: 'assets/images/jeans.jpg',
      description: "These timeless denim jeans combine comfort and style with a classic straight-leg cut that suits any body type."
      , price: 1150),
  Clothes(id: 4,
      name: 'Striped Shirt',
      imagePath: 'assets/images/shirt.jpg',
      description: "This crisp, blue and white striped shirt offers a fresh, nautical-inspired look that is both timeless and versatile"
      , price: 950),







];
}







}