import 'package:flutter/material.dart';
import 'package:project_marba/util.dart';

// Função para obter o AppLocalizations
enum BusinessCategory {
  // Comércio
  appliances(Icons.kitchen), // Eletrodomésticos
  artsAndCrafts(Icons.brush), // Artes e Artesanato
  automotive(Icons.directions_car), // Automotivo
  beautyAndPersonalCare(Icons.spa), // Beleza e Cuidados Pessoais
  booksAndStationery(Icons.book), // Livros e Papelaria
  clothing(Icons.checkroom), // Vestuário
  electronics(Icons.devices), // Eletrônicos
  foodAndBeverage(Icons.restaurant), // Alimentos e Bebidas
  healthAndWellness(Icons.health_and_safety), // Saúde e Bem-estar
  homeAndGarden(Icons.home), // Casa e Jardim
  jewelryAndAccessories(Icons.watch), // Joias e Acessórios
  marketingAndAdvertising(Icons.campaign), // Marketing e Publicidade
  musicAndInstruments(Icons.music_note), // Música e Instrumentos
  other(Icons.more_horiz), // Outros
  petSupplies(Icons.pets), // Suprimentos para Animais de Estimação
  realEstate(Icons.apartment), // Imobiliário
  retail(Icons.store), // Varejo
  sportsAndOutdoors(Icons.sports), // Esportes e Ar Livre
  toysAndGames(Icons.toys), // Brinquedos e Jogos

  // Serviços
  mechanicServices(Icons.build), // Mecânico
  barberServices(Icons.content_cut), // Barbeiro
  hairdresserServices(Icons.cut), // Cabeleireira
  cleanerServices(Icons.cleaning_services), // Faxineira
  painterServices(Icons.format_paint), // Pintor
  electricianServices(Icons.electrical_services), // Eletricista
  plumberServices(Icons.plumbing), // Encanador
  gardenerServices(Icons.local_florist), // Jardineiro
  bricklayerServices(Icons.construction), // Pedreiro
  driverServices(Icons.drive_eta), // Motorista
  cookServices(Icons.restaurant_menu), // Cozinheiro
  waiterServices(Icons.room_service), // Garçom
  itTechnicianServices(Icons.computer), // Técnico de Informática
  personalTrainerServices(Icons.fitness_center), // Personal Trainer
  nutritionistServices(Icons.restaurant), // Nutricionista
  dentistServices(Icons.medical_services), // Dentista
  doctorServices(Icons.local_hospital), // Médico
  lawyerServices(Icons.gavel), // Advogado
  accountantServices(Icons.account_balance_wallet), // Contador
  therapistServices(Icons.psychology), // Terapeuta
  barberShopServices(Icons.store), // Barbearia
  ;

  final IconData icon;

  const BusinessCategory(this.icon);

  String businessCategoryTranslation(BuildContext context) {
    final localizations = getAppLocalizations(context);
    switch (this) {
      case BusinessCategory.appliances:
        return localizations.appliances;
      case BusinessCategory.artsAndCrafts:
        return localizations.artsAndCrafts;
      case BusinessCategory.automotive:
        return localizations.automotive;
      case BusinessCategory.beautyAndPersonalCare:
        return localizations.beautyAndPersonalCare;
      case BusinessCategory.booksAndStationery:
        return localizations.booksAndStationery;
      case BusinessCategory.clothing:
        return localizations.clothing;
      case BusinessCategory.electronics:
        return localizations.electronics;
      case BusinessCategory.foodAndBeverage:
        return localizations.foodAndBeverage;
      case BusinessCategory.healthAndWellness:
        return localizations.healthAndWellness;
      case BusinessCategory.homeAndGarden:
        return localizations.homeAndGarden;
      case BusinessCategory.jewelryAndAccessories:
        return localizations.jewelryAndAccessories;
      case BusinessCategory.marketingAndAdvertising:
        return localizations.marketingAndAdvertising;
      case BusinessCategory.musicAndInstruments:
        return localizations.musicAndInstruments;
      case BusinessCategory.other:
        return localizations.other;
      case BusinessCategory.petSupplies:
        return localizations.petSupplies;
      case BusinessCategory.realEstate:
        return localizations.realEstate;
      case BusinessCategory.retail:
        return localizations.retail;
      case BusinessCategory.sportsAndOutdoors:
        return localizations.sportsAndOutdoors;
      case BusinessCategory.toysAndGames:
        return localizations.toysAndGames;
      case BusinessCategory.mechanicServices:
        return localizations.mechanicServices;
      case BusinessCategory.barberServices:
        return localizations.barberServices;
      case BusinessCategory.hairdresserServices:
        return localizations.hairdresserServices;
      case BusinessCategory.cleanerServices:
        return localizations.cleanerServices;
      case BusinessCategory.painterServices:
        return localizations.painterServices;
      case BusinessCategory.electricianServices:
        return localizations.electricianServices;
      case BusinessCategory.plumberServices:
        return localizations.plumberServices;
      case BusinessCategory.gardenerServices:
        return localizations.gardenerServices;
      case BusinessCategory.bricklayerServices:
        return localizations.bricklayerServices;
      case BusinessCategory.driverServices:
        return localizations.driverServices;
      case BusinessCategory.cookServices:
        return localizations.cookServices;
      case BusinessCategory.waiterServices:
        return localizations.waiterServices;
      case BusinessCategory.itTechnicianServices:
        return localizations.itTechnicianServices;
      case BusinessCategory.personalTrainerServices:
        return localizations.personalTrainerServices;
      case BusinessCategory.nutritionistServices:
        return localizations.nutritionistServices;
      case BusinessCategory.dentistServices:
        return localizations.dentistServices;
      case BusinessCategory.doctorServices:
        return localizations.doctorServices;
      case BusinessCategory.lawyerServices:
        return localizations.lawyerServices;
      case BusinessCategory.accountantServices:
        return localizations.accountantServices;
      case BusinessCategory.therapistServices:
        return localizations.therapistServices;
      case BusinessCategory.barberShopServices:
        return localizations.barberShopServices;
    }
  }
}
