class Result<T>
{
  T? value;
  Exception? error;
  bool get isSuccess=>error==null;
  bool get isError=>error!=null;
  bool get hasValue=>value!=null;
  Result({this.value,this.error});
}