abstract class BaseModel<T> {
  int? status;
  BaseModel({this.status});

  Map<String, Object?> toJson();
  T fromJson(Map<String, Object> json);
}
