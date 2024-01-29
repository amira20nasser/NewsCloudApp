import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';

const kNewsBox = 'news_box';

const List<TabItem> bottomNavItems = [
  TabItem(
    icon: Icons.trending_up,
    title: 'Trendy',
  ),
  TabItem(
    icon: Icons.newspaper_sharp,
    title: 'News',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Search',
  ),
  TabItem(
    icon: Icons.thumb_up_alt,
    title: 'Liked',
  ),
  TabItem(
    icon: Icons.settings,
    title: 'Settings',
  ),
];
