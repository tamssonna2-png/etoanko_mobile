import 'package:etoankopay/api/recharge.dart';
import 'package:etoankopay/api/retrait.dart';
import 'package:etoankopay/api/solde.dart';
import 'package:etoankopay/api/transfert.dart';


void main() async{
  print("Interrogation en cour");
  try{
    final solde = await Solde.fetchSolde();
    print("----------------------------------");
    print("Solde disponible : $solde XAF");
    print("----------------------------------");
  }catch (e){
    print("Échec de la récupération du solde. $e");
  }

  Recharge recharge = Recharge(
    amount: 1000, 
    currency: "XAF", 
    custumerPhone: "670000001",
    operator: "MTN_Cameroon"
  );
  await Recharge.rechargeApi(recharge);

  Retrait retrait = Retrait(
    amount: 1000, 
    currency: "XAF", 
    destinationPhone: "670000001", 
    recipientName: "test", 
    operator: "MTN_Cameroon"
    );
  await Retrait.retraitApi(retrait);

  Transfert transfert = Transfert(
    amount: 1000, 
    currency: "XAF", 
    destinationPhone: "694218608",
    );
  await Transfert.transferApi(transfert);
}