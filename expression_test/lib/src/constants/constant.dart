const String SORT_ASC = 'ASC';
const String SORT_DESC = 'DESC';

typedef ExpresionCallBack = dynamic Function(dynamic);
typedef ValueCallBack<T> = dynamic Function(T);
typedef SqlCallBack<T> = String Function(T);
typedef MapCallBack<T> = Map<String, dynamic> Function(T);
