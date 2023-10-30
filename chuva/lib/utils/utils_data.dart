extension DateTimeFormat on String? {
  String toHHmm() {
    var data = DateTime.tryParse(this ?? "");
    return "${data?.hour}:${(data?.minute.toString() ?? "").padLeft(2, "0")}";
  }

  String getDayOfWeek() {
    var data = DateTime.tryParse(this ?? "") ?? DateTime.now();
    int weekday = data.weekday;

    Map<int, String> daysOfWeek = {
      DateTime.monday: "Segunda-feira",
      DateTime.tuesday: "Terça-feira",
      DateTime.wednesday: "Quarta-feira",
      DateTime.thursday: "Quinta-feira",
      DateTime.friday: "Sexta-feira",
      DateTime.saturday: "Sábado",
      DateTime.sunday: "Domingo",
    };

    if (daysOfWeek.containsKey(weekday)) {
      return daysOfWeek[weekday] ?? "";
    } else {
      return "Valor inválido";
    }
  }

  String getInitials() {
    List<String> nameParts = (this ?? "").split(' ');
    String initials = '';

    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }

    return initials;
  }
}
