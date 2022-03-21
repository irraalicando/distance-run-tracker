import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distance_run_tracker/utils/device/datetime_utils.dart';
import 'package:flutter/material.dart';

import '../../model/distance.dart';
import '../common/progress_indicator_widget.dart';
import '../constants/theme.dart';

class DistanceListWidget extends StatelessWidget {
  final Stream<QuerySnapshot>? distanceListStream;
  final bool isShowAll;
  final Function delete;
  final Function edit;
  final bool isEditing;
  final Function cancelEdit;
  final Distance? selectedDistance;

  const DistanceListWidget({
    Key? key,
    required this.distanceListStream,
    required this.isShowAll,
    required this.delete,
    required this.edit,
    required this.isEditing,
    required this.cancelEdit,
    required this.selectedDistance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEntryListStream();
  }

  Widget _buildEntryListStream() {
    return StreamBuilder<QuerySnapshot>(
      stream: distanceListStream,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return _buildListBody(snapshot);
        } else {
          return const CustomProgressIndicatorWidget();
        }
      },
    );
  }

  Widget _buildListBody(dynamic snapshot) {
    var list = snapshot.data!.docs;
    return list.isEmpty
        ? _buildNoEntries()
        : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Distance distance =
                Distance.fromDocument(snapshot.data!.docs[index]);
            return _buildDistanceItem(index, distance);
          },
          itemCount: list.length,
        );
  }

  Widget _buildDistanceItem(int index, Distance distance) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
          color: (isEditing && selectedDistance != null) ? (selectedDistance!.timestamp == distance.timestamp) ? AppColors.primaryColor.withOpacity(0.3) : Colors.white.withOpacity(0.10) : Colors.white.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isShowAll ?  Text(
                distance.user.isEmpty ? '' : distance.user.split('-')[1],
                style: AppText.bodyStyle.copyWith(
                    color: AppColors.primaryColor),
              ) : const SizedBox(),
              Text(
                '${distance.distanceInKm}km',
                style: AppText.subTitleStyle,
              ),
              Text(
                DateTimeUtils.getDateTimeFromTimeStamp(distance.timestamp),
                style:  AppText.verySmallBodyStyle,
              ),
            ],
          ),
          isShowAll ?
          const SizedBox():
          Column(
            children: [
              InkWell(
                child: Icon(
                  (isEditing && (selectedDistance!.timestamp == distance.timestamp)) ? Icons.close : Icons.edit,
                  color: Colors.green,
                ),
                onTap: () => isEditing ? cancelEdit() : edit(distance),
              ),
              InkWell(
                child: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onTap: () => delete(distance),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNoEntries() {
    return const Center(child: Text('No data.'));
  }
}
