import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Screens/SportsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/Home.dart';

List<NewsCard> newslist = [
  NewsCard(
    newsTitle:
        " رحلة يوم واحد لسيدات النادي الأهلي الي الأسكندرية في شهر فبراير",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA9hO5TrF6XigqSKtM92Kramw6u4Do3ySM5A&usqp=CAU",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
    newsTitle:
        " رحلة يوم واحد لسيدات النادي الأهلي الي الأسكندرية في شهر فبراير",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA9hO5TrF6XigqSKtM92Kramw6u4Do3ySM5A&usqp=CAU",
  ),
  NewsCard(
    newsTitle: " موسيماني يوضح.. لماذا دفع بـثلاثي في وسط الملعب أمام سيمبا؟",
    image:
        "https://media.gemini.media/img/yallakora/Normal//2021/2/8/etutxhdxmaehfxa2021_2_8_20_50.jpg",
  ),
  NewsCard(
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
