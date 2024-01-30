
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
    statusRequest==StatusRequest.loading?
    Center(child: Lottie.asset(AppImageAssets.loading,width: 250,height: 250),):
    statusRequest==StatusRequest.offlinefailure?
    Center(child: Lottie.asset(AppImageAssets.offlin,width: 250,height: 250),):
    statusRequest==StatusRequest.serverfailure?
    Center(child: Lottie.asset(AppImageAssets.server,width: 250,height: 250),):
    statusRequest==StatusRequest.failure?
    Center(child:Lottie.asset(AppImageAssets.nodata,width: 250,height: 250),):
    widget;

  }
}


class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
    statusRequest==StatusRequest.loading
    ? Center(child: Lottie.asset(AppImageAssets.loading,width: 250,height: 250),)
    :statusRequest==StatusRequest.offlinefailure
    ?  Center(child: Lottie.asset(AppImageAssets.offlin,width: 250,height: 250),)
    : statusRequest==StatusRequest.serverfailure
    ? Center(child: Lottie.asset(AppImageAssets.server,width: 250,height: 250),)
    :widget;

  }
}