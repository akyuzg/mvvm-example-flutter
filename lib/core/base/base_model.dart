abstract class BaseModel<T> {
  BaseModel();

  Map<String, Object?> toJson();
  T fromJson(Map<String, Object> json);
  BaseModel.fromJson(Map<String, Object> json);
}
