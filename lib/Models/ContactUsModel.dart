import 'package:flutter/cupertino.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';


class ContactUs {
  List<String> numbers;
  String location,
      number1,
      number2,
      number3,
      number4,
      number5,
      websiteURL,
      address,
      fax1,
      fax2,
      fbLink,
      twitterLink,
      linkedInLink,
      instaLink,
      youtubeLink,
      email;

  List<String> fax;
  int id;
  Map<TypIconData, String> socialMediaURLS;

  ContactUs(
      {this.location,
      this.numbers,
      this.fax,
      this.email,
      this.id,
      this.fbLink,
      this.youtubeLink,
      this.linkedInLink,
      this.twitterLink,
      this.instaLink,
      this.address,
      this.number1,
      this.number2,
      this.number3,
      this.number4,
      this.fax1,
      this.fax2,
      this.number5,
      this.websiteURL,
      this.socialMediaURLS});
  factory ContactUs.fromApi(dynamic json) {
    return ContactUs(
      address: json["address"],
      numbers: [
        json["phoneNumber1"],
        json["phoneNumber2"],
        json["phoneNumber3"],
        json["phoneNumber4"],
        json["phoneNumber5"],
      ],
      email: json["email"],
      fax: [
        json["fax1"],
        json["fax2"],
      ],
      socialMediaURLS: {
        Typicons.social_facebook: json["facebookUrl"],
        Typicons.social_twitter: json["twitterUrl"],
        Typicons.social_linkedin: json["linkedInUrl"],
        Typicons.social_instagram: json["instegramUrl"],
        Typicons.social_youtube: json["youtubeUrl"],
      },
      websiteURL: json["websiteUrl"],
      location: json["locationUrl"],
    );
  }
  ContactUs.fromMap(Map<String, dynamic> map) {
    this.websiteURL = map["websiteUrl"];
    this.address = map["address"];
    this.location = map["locationUrl"];
    this.email = map["email"];
    this.fax1 = map["fax1"];
    this.fax2 = map["fax2"];

    this.fbLink = map["facebook"];
    this.instaLink = map["insta"];
    this.linkedInLink = map["linkedIn"];
    this.twitterLink = map["twitter"];
    this.youtubeLink = map["youtube"];
    this.number1 = map["number1"];
    this.number2 = map["number2"];
    this.number3 = map["number3"];
    this.number4 = map["number4"];
    this.number5 = map["number5"];
    this.id = map["id"];
  }
  Map<String, dynamic> toMap() {
    return {
      "websiteUrl": this.websiteURL,
      "address": this.address,
      "locationUrl": this.location,
      "number1": this.number1,
      "number2": this.number2,
      "number3": this.number3,
      "fax1": this.fax1,
      "fax2": this.fax2,
      "email": this.email,
      "number4": this.number4,
      "number5": this.number5,
      "facebook": this.fbLink,
      "insta": this.instaLink,
      "linkedIn": this.linkedInLink,
      "twitter": this.twitterLink,
      "youtube": this.youtubeLink,
    };
  }
}

class ContactUsData with ChangeNotifier {

  ContactUs contactProv = ContactUs();
  Future<ContactUs> getContactData() async {
    try {
      final response = await http.get(
        "${"kBaseUrl"}ContactUs",
        headers: {"Accept": "application/json"},
      );
      var map = json.decode(response.body)["data"];
      print(map);
      if (jsonDecode(response.body)["message"] == "Success") {
        contactProv = ContactUs(
            email: map["email"],
            address: map["address"],
            location: map["locationUrl"],
            fax: [map["fax1"], map["fax2"]],
            fbLink: map["facebookUrl"],
            instaLink: map["instagramUrl"],
            youtubeLink: map["youtubeUrl"],
            websiteURL: map["websiteUrl"],
            linkedInLink: map["linkedIn"],
            twitterLink: map["twitterUrl"],
            numbers: [
              map["number1"],
              map["number2"],
              map["number3"],
              map["number4"],
              map["number5"]
            ]);

        notifyListeners();

        // await db.insertContactDataIfNotExist(ContactUs(
        //   address: contactProv.address,
        //   email: contactProv.email,
        //   fax1: contactProv.fax[0],
        //   fax2: contactProv.fax[1],
        //   fbLink: contactProv.fbLink,
        //   instaLink: contactProv.instaLink,
        //   linkedInLink: contactProv.linkedInLink,
        //   location: contactProv.location,
        //   websiteURL: contactProv.websiteURL,
        //   twitterLink: contactProv.twitterLink,
        //   youtubeLink: contactProv.youtubeLink,
        //   number1: contactProv.numbers[0],
        //   number2: contactProv.numbers[1],
        //   number3: contactProv.numbers[2],
        //   number4: contactProv.numbers[3],
        //   number5: contactProv.numbers[4],
        // ));
        return contactProv;
      }
    } catch (e) {
      print(e);
    }
  }

  ContactUs contactUs = ContactUs(
      address: " 30 شارع رمسيس - القاهرة",
      email: "info@eea.org.eg",
      fax: ["25748634", "25750501"],
      location: "https://goo.gl/maps/jfVRuCH3NWSDgTtMA",
      numbers: ["0225747481", "0225747480", "0225747479"],
      socialMediaURLS: {
        Typicons.social_facebook: "https://facebook.com/",
        Typicons.social_twitter: "https://twitter.com/",
        Typicons.social_linkedin: "https://linkedin.com/",
        Typicons.social_instagram: "https://instagram.com/",
        Typicons.social_youtube: "https://youtube.com/",
      },
      websiteURL: "http://eea.org.eg/contact.aspx");
}
