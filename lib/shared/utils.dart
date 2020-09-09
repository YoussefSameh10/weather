String celsius(double temp){
  int x = (temp - 273).round();
  return '$x°C';
}

int kelvin(double temp){
  return (temp + 273).round();
}