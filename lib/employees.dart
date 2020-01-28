class Employee{
  int employeeId;
  String employeeFirstName;
  String employeeLastName;
  String employeeEmail;

  Employee({
    this.employeeId,
    this.employeeFirstName,
    this.employeeLastName,
    this.employeeEmail,
  });

  factory Employee.fromJson(Map<String, dynamic> parsedJson){
    return Employee(
      employeeId: parsedJson['id'],
      employeeFirstName: parsedJson['first_name'],
      employeeLastName: parsedJson['last_name'],
      employeeEmail: parsedJson['email'],
    );
  }

}