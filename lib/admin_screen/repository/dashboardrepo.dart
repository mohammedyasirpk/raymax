// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoardRepo {
  DashBoardRepo._internal();
  static DashBoardRepo instance = DashBoardRepo._internal();
  factory DashBoardRepo() {
    return instance;
  }

  // function for get product count for week first graph

  Future<List<int>> getProductCountForWeek() async {
    // final listOfDates = await getPreviousWeekDates();
    List<int> productCountList =
        List.filled(7, 0); // Initialize with zeros for each day

    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int dayOfWeek = 0;

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("items")
        .where('productionDate', isNotEqualTo: null)
        .where('productionDate',
            isGreaterThanOrEqualTo:
                Timestamp.fromDate(today.subtract(const Duration(days: 6))))
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Timestamp timestamp = doc['productionDate'];
        DateTime saleDate = timestamp.toDate();

        print(saleDate.weekday);
        if (saleDate.weekday == 7) {
          dayOfWeek = 0;
        } else {
          dayOfWeek = saleDate.weekday;
        }
        productCountList[dayOfWeek]++;
      }

      return productCountList;
    } else {
      print(productCountList);
      return productCountList = List.filled(7, 0);
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///

  // get dealers sold count for week first graph

  Future<List<int>> getDealersSoldCountPerWeek() async {
    List<int> productCountList =
        List.filled(7, 0); // Initialize with zeros for each day
    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int dayOfWeek = 0;

    DateTime now = DateTime.now();
    int currentDayOfWeek = now.weekday;
    print(currentDayOfWeek);

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("items")
        .where('purchaseDate', isNotEqualTo: null)
        .where('purchaseDate',
            isGreaterThanOrEqualTo:
                Timestamp.fromDate(today.subtract(const Duration(days: 6))))
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Timestamp timestamp = doc['purchaseDate'];
        DateTime saleDate = timestamp.toDate();

        print(saleDate.weekday);
        if (saleDate.weekday == 7) {
          dayOfWeek = 0;
        } else {
          dayOfWeek = saleDate.weekday;
        }
        productCountList[dayOfWeek]++;
      }

      return productCountList;
    } else {
      print(productCountList);
      return productCountList = List.filled(7, 0);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////

  Future<List<int>> getServiceCountForWeek() async {
    // final listOfDates = await getPreviousWeekDates();
    List<int> productCountList =
        List.filled(7, 0); // Initialize with zeros for each day

    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int dayOfWeek = 0;

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("complaints")
        .where('registerDate',
            isGreaterThanOrEqualTo:
                Timestamp.fromDate(today.subtract(const Duration(days: 7))))
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Timestamp timestamp = doc['purchaseDate'];
        DateTime saleDate = timestamp.toDate();

        print(saleDate.weekday);
        if (saleDate.weekday == 7) {
          dayOfWeek = 0;
        } else {
          dayOfWeek = saleDate.weekday;
        }
        productCountList[dayOfWeek]++;
      }

      return productCountList;
    } else {
      print(productCountList);
      return productCountList = List.filled(7, 0);
    }
  }


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<List<int>> getDealersSoldCountPerWeekForIndividual(
      {required String dealerid}) async {
    List<int> productCountList =
        List.filled(7, 0); // Initialize with zeros for each day

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("items")
        .where("dealer", isEqualTo: dealerid)
        .where('purchaseDate', isNotEqualTo: null)
        .where('purchaseDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
                DateTime.now().subtract(const Duration(days: 7))))
        .get();

    int dayOfWeek = 0;
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Timestamp timestamp = doc['purchaseDate'];
        DateTime saleDate = timestamp.toDate();

        print(saleDate.weekday);
        if (saleDate.weekday == 7) {
          dayOfWeek = 0;
        } else {
          dayOfWeek = saleDate.weekday;
        }
        productCountList[dayOfWeek]++;
      }

      return productCountList;
    } else {
      print(productCountList);
      return productCountList = List.filled(7, 0);
    }
  }

  ///get top servicers for second graph
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<List<Map<String, dynamic>>> getTopServicesWithCount() async {
    QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
        await FirebaseFirestore.instance.collection("items").get();

    QuerySnapshot<Map<String, dynamic>> complaintQuerySnapShots =
        await FirebaseFirestore.instance.collection("complaints").get();

    if (itemQuerySnapshot.docs.isNotEmpty) {
      Map<String, int> serviceCount = {};

      for (DocumentSnapshot<Map<String, dynamic>> itemDoc
          in itemQuerySnapshot.docs) {
        final item = itemDoc.data()!;

        if (item.containsKey("qrId")) {
          final qrid = item["qrId"];
          serviceCount[qrid] = (serviceCount[qrid] ?? 0) + 1;
        }
      }

      List<Map<String, dynamic>> topServiceList = [];

      List<MapEntry<String, int>> sortedDealers = serviceCount.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      for (var entry in sortedDealers) {
        String qrId = entry.key;
        int salesCount = entry.value;

        for (var userDoc in complaintQuerySnapShots.docs) {
          if (userDoc.data()["qrCode"] == qrId) {
            topServiceList.add({
              'name': userDoc.data()["name"],
              'salesCount': salesCount,
            });
            break;
          }
        }
      }

      return topServiceList;
    } else {
      return [];
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //get dealer with count for dealer second graph

  Future<List<Map<String, dynamic>>> getTopDealersWithCount() async {
    QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
        await FirebaseFirestore.instance.collection("items").get();

    QuerySnapshot<Map<String, dynamic>> userQuerySnapshot =
        await FirebaseFirestore.instance
            .collection("users")
            .where("role", isEqualTo: "dealer")
            .get();

    if (itemQuerySnapshot.docs.isNotEmpty) {
      Map<String, int> serviceCount = {};

      for (DocumentSnapshot<Map<String, dynamic>> itemDoc
          in itemQuerySnapshot.docs) {
        final item = itemDoc.data()!;

        if (item.containsKey("dealer")) {
          final dealerUid = item["dealer"];
          serviceCount[dealerUid] = (serviceCount[dealerUid] ?? 0) + 1;
        }
      }

      List<Map<String, dynamic>> topDealersList = [];

      List<MapEntry<String, int>> sortedDealers = serviceCount.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      for (var entry in sortedDealers) {
        String dealerUid = entry.key;
        int salesCount = entry.value;

        for (var userDoc in userQuerySnapshot.docs) {
          if (userDoc.id == dealerUid) {
            topDealersList.add({
              'name': userDoc.data()["name"],
              'salesCount': salesCount,
              'dealerId': userDoc.id,
              'dealersTotalCount': sortedDealers.length
            });
            break;
          }
        }
      }

      return topDealersList;
    } else {
      return [];
    }
  }

  //get most sold product for second graph

  // Future<List<Map<String, dynamic>>> getMostSoldProducts() async {
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
  //       .instance
  //       .collection("items")
  //       .where('purchaseDate', isNotEqualTo: null)
  //       .get();

  //   if (querySnapshot.docs.isNotEmpty) {
  //     Map<String, dynamic> productTypeCount = {};

  //     for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
  //       String productType = doc.data()!['productType'];

  //       String productId = doc.id;
  //       productTypeCount["docID"] = ;
        

  //       productTypeCount[productType] =
  //           (productTypeCount[productType] ?? 0) + 1;
  //     }

  //     int maxvalue = 0;

  //     productTypeCount.forEach((key, value) {
  //       if (maxvalue < value) {
  //         maxvalue = value;
  //       }
  //     });

  //     List<Map<String, dynamic>> mostSoldProducts = productTypeCount.entries
  //         .map((entry) => {
  //               'productType': entry.key,
  //               'count': entry.value,
  //               'mostSoldCount': maxvalue,
  //               'docId': 
  //             })
  //         .toList();

  //     return mostSoldProducts;
  //   } else {
  //     return [];
  //   }
  // }

  Future<List<Map<String, dynamic>>> getMostSoldProducts() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("items")
      .where('purchaseDate', isNotEqualTo: null)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    Map<String, dynamic> productTypeCount = {};

    for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
      String productType = doc.data()!['productType'];

      String productId = doc.id;

      productTypeCount[productId] = productTypeCount[productId] ?? {
        'productType': productType,
        'count': 0,
      };

      productTypeCount[productId]['count']++;
    }

    int maxvalue = 0;

    productTypeCount.forEach((key, value) {
      if (maxvalue < value['count']) {
        maxvalue = value['count'];
      }
    });

    List<Map<String, dynamic>> mostSoldProducts = productTypeCount.entries
        .map((entry) => {
              'docId': entry.key,
              'productType': entry.value['productType'],
              'count': entry.value['count'],
              'mostSoldCount': maxvalue,
            })
        .toList();

    return mostSoldProducts;
  } else {
    return [];
  }
}


  // Future<List<String>> getAllDealersNames() async {
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //       await FirebaseFirestore.instance.collection("items").get();

  //   QuerySnapshot<Map<String, dynamic>> userQurySnapshot =
  //       await FirebaseFirestore.instance.collection("users").get();

  //   if (querySnapshot.docs.isNotEmpty) {
  //     String dealerUid = "";

  //     for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
  //       final item = doc.data()!;

  //       if (item.containsKey("dealer")) {
  //         final uid = item["dealer"];
  //         dealerUid = uid;
  //       }
  //     }

  //     List<String> userslist = [];

  //     for (var user in userQurySnapshot.docs) {
  //       if (user.id == dealerUid) {
  //         userslist.add(user.data()["name"]);
  //       }
  //     }
  //     return userslist;
  //   } else {
  //     return [];
  //   }
  // }

  // function for get top dealers names to display

  // Future<List<String>> getTopDealers() async {
  //   QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
  //       await FirebaseFirestore.instance
  //           .collection("items")
  //           .where("isSold", isEqualTo: true)
  //           .get();

  //   QuerySnapshot<Map<String, dynamic>> userQuerySnapshot =
  //       await FirebaseFirestore.instance
  //           .collection("users")
  //           .where("role", isEqualTo: "dealer")
  //           .get();

  //   if (itemQuerySnapshot.docs.isNotEmpty) {
  //     Map<String, int> dealerSalesCount = {};

  //     for (DocumentSnapshot<Map<String, dynamic>> itemDoc
  //         in itemQuerySnapshot.docs) {
  //       final item = itemDoc.data()!;

  //       if (item.containsKey("dealer")) {
  //         final dealerUid = item["dealer"];
  //         dealerSalesCount[dealerUid] = (dealerSalesCount[dealerUid] ?? 0) + 1;
  //       }
  //     }

  //     List<MapEntry<String, int>> sortedDealers = dealerSalesCount.entries
  //         .toList()
  //       ..sort((a, b) => b.value.compareTo(a.value));

  //     List<String> topDealers = [];

  //     for (var entry in sortedDealers) {
  //       String dealerUid = entry.key;

  //       for (var userDoc in userQuerySnapshot.docs) {
  //         if (userDoc.id == dealerUid) {
  //           topDealers.add(userDoc.data()["name"]);
  //           break;
  //         }
  //       }
  //     }

  //     return topDealers;
  //   } else {
  //     return [];
  //   }
  // }

// function for get top five dealers with product count
}
