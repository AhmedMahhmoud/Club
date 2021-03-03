import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Screens/OfferScren.dart';
import 'package:demo_club/Screens/QrGateAccess.dart';
import 'package:demo_club/Screens/Restaurant.dart';

import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Screens/SportsScreen.dart';

import 'package:url_launcher/url_launcher.dart';
import '../Screens/Notifications.dart';
import '../Screens/Home.dart';
import 'RestaurantBottomSheet.dart';

List<OffersCard> offersList = [
  OffersCard(
    address: [
      "التجمع الخامس ",
      " 6 أكتوبر التعليمي (الحي الأول امام جهاز المدينة)"
    ],
    phone: ["01112601115", "01011212211"],
    description:
        "كشف على الأسنان وتلميع وتنظيف الجير بخصم 73% في Dr. Ahmed Abu Zeid Dental Clinic! فقط بـ 149 جنيه بدلا من 550 جنيه",
    newsTitle: "عياده دكتور حمزة الجندي للأسنان",
    image:
        "https://s3-eu-west-1.amazonaws.com/forasna/uploads/logos/thumb_clogo_2020-07-28-12-04-48_NulrRVaXSdnLNtzPZQKAoAXX.jpg",
  ),
  OffersCard(
    address: ["مدينة نصر الحي السابع امام ابو رامي "],
    newsTitle: "الجلاء و السرايا سكان",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkyhM7dwFwoPQBbBRWrw4HhuZ2E6YyvHkIlw&usqp=CAU",
    phone: ["01112601115"],
    description:
        "كشف على الأسنان وتلميع وتنظيف الجير بخصم 73% في Dr. Ahmed Abu Zeid Dental Clinic! فقط بـ 149 جنيه بدلا من 550 جنيه",
  ),
  OffersCard(
    phone: ["24595744", "01112405552", "24595711"],
    address: ["شبرا روض الفرج شارع فخر الدين"],
    newsTitle: "صيدليات العزبي",
    description:
        "خليك في البيت و صيدلية سيف هتجيلك لحد البيت لكل طلبات أسرتك من الدواء و مسحضرات التجميل. احصل على خصم 10% على أول طلباتك من صيدليات سيف اون لاين، اكتب برومو كود - First10. الدفع عند الاستلام. أقوى العروض و الخصومات.",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTqdrB8yiwL36E-v91p_PEcl6KUyHKnMVprw&usqp=CAU",
  ),
];
List<NewsCard> newslist = [
  NewsCard(
    description:
        "بعيدًا عن رمال الشواطئ، نقدم لك دليلًا مختلفًا للاستمتاع بأجواء دافئة وجولة ليوم واحد لا تُنسى تبدأ باستقلال القطار، من محطة مصر بميدان رمسيس في الثامنة وعشر دقائق صباحًا، الدرجة الثانية، وتذكرته تبلغ 30 جنيهًا",
    newsTitle:
        " رحلة يوم واحد لسيدات النادي الأهلي الي الأسكندرية في شهر فبراير",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA9hO5TrF6XigqSKtM92Kramw6u4Do3ySM5A&usqp=CAU",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
    description:
        "كشف الجنوب أفريقي بيتسو موسيماني المدير الفني للفريق الأول بالنادي الأهلي، أسباب الدفع بثلاثة لاعبين في خط الوسط أمام سيمبا التنزاني بدوري أبطال أفريقي",
  ),
  NewsCard(
    description:
        "بعيدًا عن رمال الشواطئ، نقدم لك دليلًا مختلفًا للاستمتاع بأجواء دافئة وجولة ليوم واحد لا تُنسى تبدأ باستقلال القطار، من محطة مصر بميدان رمسيس في الثامنة وعشر دقائق صباحًا، الدرجة الثانية، وتذكرته تبلغ 30 جنيهًا",
    newsTitle:
        " رحلة يوم واحد لسيدات النادي الأهلي الي الأسكندرية في شهر فبراير",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA9hO5TrF6XigqSKtM92Kramw6u4Do3ySM5A&usqp=CAU",
  ),
  NewsCard(
    description:
        "كشف الجنوب أفريقي بيتسو موسيماني المدير الفني للفريق الأول بالنادي الأهلي، أسباب الدفع بثلاثة لاعبين في خط الوسط أمام سيمبا التنزاني بدوري أبطال أفريقي",
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    description:
        "بعيدًا عن رمال الشواطئ، نقدم لك دليلًا مختلفًا للاستمتاع بأجواء دافئة وجولة ليوم واحد لا تُنسى تبدأ باستقلال القطار، من محطة مصر بميدان رمسيس في الثامنة وعشر دقائق صباحًا، الدرجة الثانية، وتذكرته تبلغ 30 جنيهًا",
    newsTitle:
        " رحلة يوم واحد لسيدات النادي الأهلي الي الأسكندرية في شهر فبراير",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA9hO5TrF6XigqSKtM92Kramw6u4Do3ySM5A&usqp=CAU",
  ),
];
//////
List<NewsCard> sportsNews = [
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
];
////
List<NewsHeaders> headerList = [
  NewsHeaders(
    headName: "كل الأخبار",
  ),
  NewsHeaders(
    headName: "اخبار الألعاب الرياضية",
  ),
  NewsHeaders(
    headName: "اخبار الأنشطة الأجتماعية",
  )
];
///////
List<SportsActivitiesCard> sportsList = [
  SportsActivitiesCard(
    image:
        "https://activenation.org.uk/wp-content/uploads/2015/11/Football-Activity-Slider-2-730x421.jpg",
    title: "كرة القدم",
  ),
  SportsActivitiesCard(
    image:
        "https://26qwi858rq21jpf4913ehms1-wpengine.netdna-ssl.com/wp-content/uploads/2017/06/Bball.jpg",
    title: "كرة السلة",
  ),
  SportsActivitiesCard(
    image:
        "https://i.pinimg.com/originals/9d/d1/f7/9dd1f7d5da0f53f000bbb4375927925a.jpg",
    title: "كرة الطايرة",
  ),
  SportsActivitiesCard(
    title: "تايكوندو",
    image:
        "https://www.martialtribes.com/wp-content/uploads/2016/05/150123328-1-1-960x480.png",
  )
];
//////////
List<PlaceLocation> placeLocation = [
  PlaceLocation(
    title: "مدينة نصر",
    function: () {
      launch(
          'https://www.google.com/maps/place/An+Nadi+Al+Ahli,+Nasr+City,+Cairo+Governorate/data=!4m2!3m1!1s0x14583def118d7edf:0xa67726dc75420b62?sa=X&ved=2ahUKEwi6n6-0p4XvAhVxpHEKHcT4DWMQ8gEwAHoECAQQAQ');
    },
  ),
  PlaceLocation(
    title: "الشيخ زايد",
    function: () {
      launch(
          "https://www.google.com/search?tbs=lf:1,lf_ui:2&tbm=lcl&sxsrf=ALeKk01QinxhMVKGRltrRBeViyUQ4ymDrQ:1614265882201&q=%D9%86%D8%A7%D8%AF%D9%8A+%D8%A7%D9%84%D8%A3%D9%87%D9%84%D9%8A+%D8%A7%D9%84%D8%B4%D9%8A%D8%AE+%D8%B2%D8%A7%D9%8A%D8%AF&rflfq=1&num=10&ved=2ahUKEwiF4OyDqYXvAhXZShUIHWbXC9wQtgN6BAgEEAc#rlfi=hd:;si:;mv:[[30.085824,30.976490300000002],[30.047087700000002,30.972465000000003]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3,lf:1,lf_ui:2");
    },
  )
];
List<String> imagesGallery = [
  "https://www.getafeinternational.com/images/the-academy-training.jpg",
  "https://static.wixstatic.com/media/ec0b94_8bbfad41dac24649b5b5a4b5334507a7~mv2.jpg/v1/fill/w_560,h_386,al_c,q_80,usm_0.66_1.00_0.01/IMG_9882_edited.webp",
  "https://soccerinteraction.com/wp-content/uploads/2018/02/ClinicWilliam3_SoccerAcademy.jpg"
];
///////////
List<GridViewItemsWidg> gridList = [
  GridViewItemsWidg(
    iconData: "android/app/resources/sport.json",
    title: "الأنشطة الرياضية",
    function: SportsScreen(),
  ),
  GridViewItemsWidg(
    iconData: "android/app/resources/payment.json",
    title: "تجديد الأشتراك",
  ),
  GridViewItemsWidg(
    iconData: "android/app/resources/qr.json",
    title: "تصريح دخول النادى",
    function: GateAccess(),
  ),
  GridViewItemsWidg(
    iconData: "android/app/resources/food.json",
    title: "المطاعم",
    function: RestaurantScreen(),
  ),
  GridViewItemsWidg(
    iconData: "android/app/resources/travel.json",
    title: "الرحلات",
  ),
  GridViewItemsWidg(
    iconData: "android/app/resources/gift.json",
    title: "العروض",
    function: OffersScreen(),
  ),
];
///////////////////
List<FoodItemMenuWidg> mealsList = [
  FoodItemMenuWidg(
    price: 120,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBjiu4IV7mviAAbMdASwTVY_wbCQWWkH207Q&usqp=CAU",
    title: "Grand Share box",
    description:
        "Pick 2 sandwiches from the juicy Big Tasty® (Beef/Chicken) and delicious Grand Chicken (Premier, Spicy) + 2 sandwiches from Beefburger, Cheeseburger and Chicken MACDO + 2 regular Fries + 1.25 liter Coke.",
  ),
  FoodItemMenuWidg(
    price: 130,
    image:
        "https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/images/Menu/large-Image/Share-Box.png",
    title: "Share box",
    description:
        "Share and enjoy our iconic items at a great price! Pick 2 sandwiches from Big Mac® (Beef/Chicken) and McChicken® + 2 sandwiches from Beef Burger, Cheeseburger and Chicken MacDo® + 2 regular Fries + 1.25 liter Coke.",
  ),
  FoodItemMenuWidg(
    price: 140,
    image:
        "https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/images/Menu/large-Image/M2M-700x474.png",
    title: "Mix 2 Meal",
    description:
        "Pick two! Choose among the tasty Cheeseburger, the delicious Chicken MACDO or the juicy Beefburger + Fries + Drink.",
  ),
];
///////////////

List<FoodItemMenuWidg> sandwitchesList = [
  FoodItemMenuWidg(
    price: 40,
    image:
        "https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/images/Menu/large-Image/McRoyal.png",
    title: "McRoyale",
    description:
        "A juicy beef patty accompanied by cheese,covered with our special McRoyale sauce, crispy lettuce, fresh tomatoes, zesty onions and pickles all wrapped in a sesame seed bun.",
  ),
  FoodItemMenuWidg(
    price: 50,
    image:
        "https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/images/Menu/large-Image/Double-Big-Tasty.png",
    title: "Double Big Tasty",
    description:
        "When one Big Tasty just isn’t enough, go for the Double Big Tasty. It's not only one but two juicy beef patties smothered between slices of emmental cheese, topped with sliced tomato, shredded lettuce, onions and that special Big Tasty sauce",
  ),
];
////////////////
List<FoodCategoryModel> foodModel = [
  FoodCategoryModel(catName: "Meals", catMenuItems: mealsList),
  FoodCategoryModel(catName: "Sandwitches", catMenuItems: sandwitchesList)
];
////////////////////
List<NotificationsData> notificationList = [
  NotificationsData(
    notificationTitle: "تم افتتاح مطعم جديد في النادى",
    notoficationSubtitle: "مطعم ماكدونالدز الأن بفرع التجمع ",
    datetime: "22-2-2021",
    isSeen: 0,
    function: RestaurantScreen(),
  ),
  NotificationsData(
    notificationTitle: "تم فتح باب التسجيل في كرة القدم",
    notoficationSubtitle: "يمكنك الألتحاق بفريق النادي الاهلى الأن  ",
    datetime: "22-1-2021",
    isSeen: 0,
    function: SportsScreen(),
  ),
];
