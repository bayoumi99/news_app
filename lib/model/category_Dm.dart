class CategoryDm{
String id;
String nameEn;
String nameAr;
String imageLightPath;
String imageDarkPath;

bool isRtl ;

CategoryDm( this. id, this. nameEn, this.nameAr , this.imageLightPath,this.imageDarkPath , this.isRtl );

}


// قائمة الفئات المستخدمة في التطبيق
List<CategoryDm> categories = [
  CategoryDm(
    'business',
    'Business',
    'أعمال',
    'assets/image/busniess.png',
    'assets/image/busniess_dark.png',
    true,
  ),
  CategoryDm(
    'entertainment',
    'Entertainment',
    'ترفيه',
    'assets/image/entertainment.png',
    'assets/image/entertainment_dark.png',
    false,
  ),
  CategoryDm(
    'general',
    'General',
    'عام',
    'assets/image/general.png',
    'assets/image/general_dark.png',
    false,
  ),
  CategoryDm(
    'health',
    'Health',
    'صحة',
    'assets/image/helth.png',
    'assets/image/helth_dark.png',
    true,
  ),
  CategoryDm(
    'science',
    'Science',
    'علوم',
    'assets/image/science.png',
    'assets/image/science_dark.png',
    true,
  ),
  CategoryDm(
    'sport',
    'Sports',
    'رياضة',
    'assets/image/sport.png',
    'assets/image/sport_dark.png',
    false,
  ),
  CategoryDm(
    'technology',
    'Technology',
    'تكنولوجيا',
    'assets/image/technology.png',
    'assets/image/technology_dark.png',
    true,
  ),
];
