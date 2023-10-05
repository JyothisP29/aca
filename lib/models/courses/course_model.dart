class CourseModel {
  int? id;
  String? name;
  String? image;
  String? adminName;
  String? description;
  String? students;
  String? duration;
  String? tag;
  List<CourseTag> courseTagList = [];

  CourseModel(this.id, this.name, this.image, this.adminName, this.description,
      this.students, this.duration,this.tag, this.courseTagList);
}

class CourseTag {
  int? id;
  String? tagName;

  CourseTag(this.id, this.tagName);
}
