class Utilisateur {
  final String nom;
  final String email;
  final String telephone;
  final String motDePasse;
  final String codePin;
  final bool conditionGenerale;
  double solde;

  Utilisateur({required this.nom, 
  required this.email, 
  required this.telephone, 
  required this.motDePasse, 
  required this.codePin, 
  required this.conditionGenerale,
  this.solde =0
  });
  @override
  String toString() {
    return 'Utilisateur(nom: $nom, email: $email, tel: $telephone, pin: $codePin)';
  }

  Map<String,dynamic> toMap(){
    return{
      'nom': nom,
      'email': email,
      'telephone': telephone,
      'motDePasse': motDePasse,
      'codePin': codePin,
      'conditionGenerale': conditionGenerale,
      'solde': solde,
    };
  }

  factory Utilisateur.fromMap(Map<String,dynamic>map){
    return Utilisateur(
      nom: map['nom'],
      email: map['email'],
      telephone: map['telephone'],
      motDePasse: map['motDePasse'],
      codePin: map['codePin'],
      conditionGenerale: map['conditionGenerale'],
      solde: (map['solde'] as num).toDouble(),
    );
  }
}