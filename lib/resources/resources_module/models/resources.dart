class Resource{
  final int id;
  final int resource_type;
  final String name;
  final int category;
  final String resource_file;
  final DateTime created_on;
  final String description;
  final int user_id;

  Resource({this.id, this.resource_type, this.name, this.category, this.resource_file, this.created_on, this.description, this.user_id});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
        id: json['id'],
        resource_type: json['resource_type'],
        name: json['name'],
        category: json['category'],
        resource_file: json['resource_file'],
        created_on: json['created_on'],
        description: json['description'],
        user_id: json['user_id']


    );
  }
}