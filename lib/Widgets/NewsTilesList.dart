import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Screens/OfferScren.dart';
import 'package:demo_club/Screens/QrGateAccess.dart';
import 'package:demo_club/Screens/RenewalScreen.dart';
import 'package:demo_club/Screens/Restaurant.dart';

import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Screens/SportsScreen.dart';
import 'package:demo_club/Screens/TripsScreen.dart';

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
        "نحتفل اليوم بعيد ميلاد مدربنا المساعد الكابتن سامي قمصان و نتمني له عيد ميلاد سعيد",
    newsTitle:
        " نحتفل اليوم بعيد ميلاد مدربنا المساعد الكابتن سامي قمصان و نتمني له عيد ميلاد سعيد 🎉🥳🎉",
    image:
        "https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/157493269_5441422152566925_4154345039828039115_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeEXZ4rEMekjtgH8T0pDKI45eMT0ecO6CXV4xPR5w7oJdU1VZIkEaUcu_kl9xfxmB_hoUrx5WY_GJrFBaONqEYuy&_nc_ohc=FN14MjmWMIsAX_sCiq4&_nc_ht=scontent.fcai21-1.fna&oh=1d20ffc9ca19b55ba874c06d9d7f90fe&oe=6067F1CC",
  ),
  NewsCard(
    description:
        "⛹🏼‍♂️فريقنا يفوز على الزمالك بنتيجة 106/112 ضمن منافسات بطولة الدوري ",
    newsTitle:
        " ⛹🏼‍♂️فريقنا يفوز على الزمالك بنتيجة 106/112 ضمن منافسات بطولة الدوري ",
    image:
        "https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/157312451_2699685263677684_125693801804879192_o.jpg?_nc_cat=1&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeH3jiB3Z6LptN6DAsmGOXSDop4-t-T5SvSinj635PlK9DHF0L6tlnqU5P_r91lczeDP24Wgm7sUy0afxFBnhqAq&_nc_ohc=z-finS2FKJcAX-D0n5J&_nc_ht=scontent.fcai21-1.fna&oh=302d4b34d944db7053dd2676ad2d3f6d&oe=6068D27F",
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
    description:
        "كشف الجنوب أفريقي بيتسو موسيماني المدير الفني للفريق الأول بالنادي الأهلي، أسباب الدفع بثلاثة لاعبين في خط الوسط أمام سيمبا التنزاني بدوري أبطال أفريقي",
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle:
        " فريق كرة الماء بالنادي الأهلي يتعادل مع نظيره الجزيرة بنتيجة 5 - 5  🤽 ضمن منافسات بطولة الدوري 🏆",
    description:
        " فريق كرة الماء بالنادي الأهلي يتعادل مع نظيره الجزيرة بنتيجة 5 - 5  🤽 ضمن منافسات بطولة الدوري 🏆.",
    image:
        "https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/158013755_5121274961276177_5971021953444906174_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeGHz6jbxWjuYhDdgO-YQ_9HKFAuFMpH-DMoUC4Uykf4Myk4C7KMRfDlY0S2S_GuxziY6slGHa5goO18vxuJWJHr&_nc_ohc=rfMktx1e9ScAX_Xvb_g&_nc_ht=scontent.fcai21-1.fna&oh=04c048e32fe22b21311d8c2a4f0ed9d4&oe=6069BF8E",
  ),
  NewsCard(
    description:
        " ⛹🏼‍♂️فريقنا يفوز على الزمالك بنتيجة 106/112 ضمن منافسات بطولة الدوري ",
    newsTitle:
        " ⛹🏼‍♂️فريقنا يفوز على الزمالك بنتيجة 106/112 ضمن منافسات بطولة الدوري ",
    image:
        "https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/157312451_2699685263677684_125693801804879192_o.jpg?_nc_cat=1&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeH3jiB3Z6LptN6DAsmGOXSDop4-t-T5SvSinj635PlK9DHF0L6tlnqU5P_r91lczeDP24Wgm7sUy0afxFBnhqAq&_nc_ohc=z-finS2FKJcAX-D0n5J&_nc_ht=scontent.fcai21-1.fna&oh=302d4b34d944db7053dd2676ad2d3f6d&oe=6068D27F",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    description: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    description: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
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
    function: RenewalScreen(),
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
    function: TripScreen(),
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
////////////
List<TripsCard> tripsList = [
  TripsCard(
    title: "الوادي الجديد",
    duration: "من 2 الى 9 فبراير",
    image:
        "https://www.agazatclub.travel/uploads/onedaytrips/gallery/201713154354762.jpg",
  ),
  TripsCard(
    title: "رحله نيليه  من القاهرة الى الاقصر واسوان ",
    duration: "من 2 الى 9 يناير",
    image:
        "https://4.bp.blogspot.com/-Ja7vaIKIQxI/WBR_GSGmbnI/AAAAAAAAAGI/wkPdu6XFStk_wYKkwuBzZknyiKE8uX0pgCLcB/s400/Nile-Cruise-MS-Beauty.jpg",
  ),
  TripsCard(
    title: "رحله اسكندرية يوم واحد",
    duration: "من 2 الى 3 فبراير",
    image:
        "https://images.akhbarelyom.com//images/images/medium/20190811154515747.jpg",
  )
];
