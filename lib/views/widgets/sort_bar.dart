import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/sortedby.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/past_jobs/sort_item.dart';

class SortBar extends StatefulWidget {
  const SortBar({
    super.key,
  });

  @override
  State<SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  final screen = locator<ScreenSizes>();
  Sortedby sortedBy = Sortedby.all; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.all; 
              });
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Hepsi",
              isSelected: sortedBy == Sortedby.all ? true : false,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.price; 
              });
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Çok Kazandıran",
              isSelected: sortedBy == Sortedby.price ? true : false,
              icon: Image.asset("assets/icon/tag.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.location; 
              });
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Yakınımda",
              isSelected: sortedBy == Sortedby.location ? true : false,
              icon: Image.asset("assets/icon/placeholder.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.time; 
              });
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "İş Süresi",
              isSelected: sortedBy == Sortedby.time ? true : false,
              icon: Image.asset("assets/icon/time-passing.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.date; 
              });
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "İş Tarihi",
              isSelected: sortedBy == Sortedby.date ? true : false,
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/icon/calendar.png"),
              ),
            ),
          ),
          
      
        ],
      ),
    );
  }
}

