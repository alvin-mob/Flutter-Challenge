class Utils{

  static const baseUrl = "https://api.mocklets.com/";


  static convertMinutesToTimeString(String? time){
    if(time==null || time.isEmpty){
      return "Not set";
    }else{
      int minutes = int.parse(time);
      var duration = Duration(minutes: minutes);
      List<String> parts = duration.toString().split(':');
      if(int.parse(parts[0])>0){
         if(int.parse(parts[1])>0)
          return '${parts[0].padLeft(1, '0')}h ${parts[1].padLeft(2, '0')}m';
         return '${parts[0].padLeft(1, '0')}h';
      }

      return '${parts[1].padLeft(2, '0')}m';//'${duration.inHours.toString()}h ${duration.inMinutes.toString()}m';
    }

  }
}