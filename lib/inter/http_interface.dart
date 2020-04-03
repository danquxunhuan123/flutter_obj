
typedef OnSuccess = void Function(Object o);
typedef OnError = void Function(Exception e);

class HttpInterface {
   OnSuccess onSuccess;
   OnError onError;
   HttpInterface ({this.onSuccess, this.onError});

 }