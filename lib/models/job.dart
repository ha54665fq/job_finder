class Job {
  final int id;
  final String title;
  final String companyName;
  final String companyLogoUrl; // Placeholder, assuming an image URL will be provided by API
  final String duration;
  final String salaryRange;
  final String experience;
  final String daysRemaining;
  final String description;
  final List<String> skills;
  final String expiryDate;
  final String views;
  final String companyId;
  final String jobType;
  final String workField;
  final String countryOfEmployment;
  final String salaryWageDetails;
  final String requiredExperienceDetails;
  final String nationalityRequirements;
  final String countryResidenceRequirements;
  final String genderPreference;

  Job({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogoUrl,
    required this.duration,
    required this.salaryRange,
    required this.experience,
    required this.daysRemaining,
    required this.description,
    required this.skills,
    required this.expiryDate,
    required this.views,
    required this.companyId,
    required this.jobType,
    required this.workField,
    required this.countryOfEmployment,
    required this.salaryWageDetails,
    required this.requiredExperienceDetails,
    required this.nationalityRequirements,
    required this.countryResidenceRequirements,
    required this.genderPreference,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] as int? ?? 0, // Provide a default or handle null
      title: json['title'] as String? ?? '',
      companyName: json['company_name'] as String? ?? '',
      companyLogoUrl: json['company_logo_url'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      salaryRange: json['salary_range'] as String? ?? '',
      experience: json['experience'] as String? ?? '',
      daysRemaining: json['days_remaining'] as String? ?? '',
      description: json['description'] as String? ?? '',
      skills: List<String>.from(json['skills'] as List? ?? []), // Handle null list
      expiryDate: json['expiry_date'] as String? ?? '',
      views: json['views'] as String? ?? '',
      companyId: json['company_id'] as String? ?? '',
      jobType: json['job_type'] as String? ?? '',
      workField: json['work_field'] as String? ?? '',
      countryOfEmployment: json['country_of_employment'] as String? ?? '',
      salaryWageDetails: json['salary_wage_details'] as String? ?? '',
      requiredExperienceDetails: json['required_experience_details'] as String? ?? '',
      nationalityRequirements: json['nationality_requirements'] as String? ?? '',
      countryResidenceRequirements: json['country_residence_requirements'] as String? ?? '',
      genderPreference: json['gender_preference'] as String? ?? '',
    );
  }
} 