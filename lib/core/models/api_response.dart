class ApiResponse<T>{
  T? data;
  bool haserror = false;
  String? errormessage;

  ApiResponse({this.data,this.haserror=false,this.errormessage});

}