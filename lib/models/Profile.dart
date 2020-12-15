import 'package:flutter/material.dart';

class ProfileModel {
  static final String UID = 'uid';
  static final String AVATAR_URL = 'avatarURL';
  static final String USERNAME = 'username';
  static final String STATUS = 'status';
  static final String FOLLOWERS = 'followers';
  static final String FOLLOWINGS = 'followings';
  static final String IS_FOLLOW = 'isFollow';

  final String uid;
  final String username;
  final String status;
  final String avatarURL;

  int followers;
  int followings;
  bool isFollow;

  ProfileModel({
    @required this.uid,
    @required this.username,
    this.status,
    this.avatarURL,
    this.followers,
    this.followings,
    this.isFollow = false,
  });

  set isFollowed(bool value) => isFollow = value;

  set updateFollowers(int value) => followers = value;

  set updateFollowings(int value) => followings = value;

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      ProfileModel.UID: instance.uid,
      ProfileModel.AVATAR_URL: instance.avatarURL,
      ProfileModel.USERNAME: instance.username,
      ProfileModel.STATUS: instance.status,
      ProfileModel.FOLLOWERS: instance.followers,
      ProfileModel.FOLLOWINGS: instance.followings,
      ProfileModel.IS_FOLLOW: instance.isFollow,
    };
