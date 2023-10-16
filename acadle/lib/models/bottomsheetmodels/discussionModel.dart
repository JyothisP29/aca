class DiscussionModel {
  int? id;
  String? name;
  String? img;
  String? discussion;
  String? date;
  String? replyCount;
  List<DiscussionModel> mentionList=[];
  DiscussionModel(this.id, this.name, this.img,this.discussion,this.date,this.replyCount,this.mentionList);
}

