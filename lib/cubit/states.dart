abstract class NewsStates{}
class NewsInitialstate extends NewsStates{}
class NewsBottomnavstate extends NewsStates{}



class NewsgetbusnissSuccessState extends NewsStates{}
class NewsgetbusnissLodingState extends NewsStates{}
class NewsgetbusnissErrorState extends NewsStates
{
  final String error;
  NewsgetbusnissErrorState(this.error);
}

class NewsgetSportsSuccessState extends NewsStates{}
class NewsgetSportsLodingState extends NewsStates{}
class NewsgetsportsErrorState extends NewsStates
{
  final error;
  NewsgetsportsErrorState(this.error);
}


class NewsgetSienceSuccessState extends NewsStates{}
class NewsgetSienceLodingState extends NewsStates{}
class NewsgetSienceErrorState extends NewsStates
{
  final error;
  NewsgetSienceErrorState(this.error);
}


class AppchangeThemeMode extends NewsStates{}


class NewsgetSearshSuccessState extends NewsStates{}
class NewsgetSearshLodingState extends NewsStates{}
class NewsgetSearshErrorState extends NewsStates
{
  final String error;
  NewsgetSearshErrorState(this.error);
}