import 'package:flutter/material.dart';

import '../../../../util.dart';

enum ServiceCategory {
  accountant(Icons.account_balance), // Contador(a)
  alarmServices(Icons.security), // Serviços de Alarme
  applianceRepair(Icons.home_repair_service), // Conserto de Eletrodomésticos
  architect(Icons.architecture), // Arquiteto(a)
  babysitter(Icons.child_care), // Babá
  bicycleRepair(Icons.pedal_bike), // Conserto de Bicicletas
  cableServices(Icons.tv), // Serviços de TV a Cabo
  carpenter(Icons.handyman), // Carpinteiro
  cleaner(Icons.cleaning_services), // Faxineiro(a)
  computerRepair(Icons.computer), // Conserto de Computadores
  deliveryPerson(Icons.delivery_dining), // Entregador(a)
  dogWalker(Icons.pets), // Passeador(a) de Cães
  driver(Icons.drive_eta), // Motorista
  elderCareProvider(Icons.emoji_people), // Cuidador(a) de Idosos
  electrician(Icons.flash_on), // Eletricista
  electricalServices(Icons.electrical_services), // Serviços Elétricos
  eventPlanner(Icons.event), // Organizador(a) de Eventos
  financialPlanner(Icons.attach_money), // Planejador(a) Financeiro(a)
  gardener(Icons.grass), // Jardineiro
  glassRepair(Icons.broken_image), // Conserto de Vidros
  graphicDesigner(Icons.design_services), // Designer Gráfico(a)
  gutterCleaning(Icons.roofing), // Limpeza de Calhas
  hairdresser(Icons.content_cut), // Cabeleireiro
  airConditionerServices(
      Icons.ac_unit), // Serviços de Aquecimento, Ventilação e Ar Condicionado
  insulationServices(Icons.thermostat), // Serviços de Isolamento
  internetServices(Icons.router), // Serviços de Internet
  interpreter(Icons.translate), // Intérprete
  jewelryRepair(Icons.watch), // Conserto de Joias
  lawyer(Icons.gavel), // Advogado(a)
  locksmith(Icons.vpn_key), // Chaveiro
  makeupArtist(Icons.brush), // Maquiador(a)
  marketingConsultant(Icons.campaign), // Consultor(a) de Marketing
  mason(Icons.build), // Pedreiro
  masseurMassagist(Icons.spa), // Massagista
  nails(Icons.spa), // Manicure e Pedicure
  nutritionist(Icons.local_dining), // Nutricionista
  painter(Icons.format_paint), // Pintor(a)
  personalTrainer(Icons.fitness_center), // Personal Trainer
  petGroomer(Icons.pets), // Tosador(a) de Animais
  phoneRepair(Icons.phone_iphone), // Conserto de Telefones
  photographer(Icons.camera_alt), // Fotógrafo(a)
  plumber(Icons.plumbing), // Encanador
  poolCleaning(Icons.pool), // Limpeza de Piscinas
  pressureWashing(Icons.wash), // Lavagem de Pressão
  socialMediaManager(Icons.social_distance), // Gerente de Mídias Sociais
  solarServices(Icons.wb_sunny), // Serviços Solares
  tattooArtist(Icons.brush), // Tatuador(a)
  therapist(Icons.self_improvement), // Terapeuta
  tutor(Icons.school), // Tutor
  upholsteryCleaning(Icons.cleaning_services), // Limpeza de Estofados
  veterinarian(Icons.local_hospital), // Veterinário(a)
  watchRepair(Icons.watch), // Conserto de Relógios
  weddingPlanner(Icons.card_giftcard), // Organizador(a) de Casamentos
  weldingServices(Icons.construction), // Serviços de Soldagem
  windowCleaning(Icons.cleaning_services), // Limpeza de Vidros
  securitySystems(Icons.shield), // Sistemas de Segurança
  solarPanelInstallation(Icons.solar_power); // Instalação de Painéis Solares

  final IconData icon;

  const ServiceCategory(this.icon);

  String getServiceCategoryTranslation(BuildContext context) {
    final localization = getAppLocalizations(context);

    switch (this) {
      case ServiceCategory.accountant:
        return localization.accountant;
      case ServiceCategory.alarmServices:
        return localization.alarmServices;
      case ServiceCategory.applianceRepair:
        return localization.applianceRepair;
      case ServiceCategory.architect:
        return localization.architect;
      case ServiceCategory.babysitter:
        return localization.babysitter;
      case ServiceCategory.bicycleRepair:
        return localization.bicycleRepair;
      case ServiceCategory.cableServices:
        return localization.cableServices;
      case ServiceCategory.carpenter:
        return localization.carpenter;
      case ServiceCategory.cleaner:
        return localization.cleaner;
      case ServiceCategory.computerRepair:
        return localization.computerRepair;
      case ServiceCategory.deliveryPerson:
        return localization.deliveryPerson;
      case ServiceCategory.dogWalker:
        return localization.dogWalker;
      case ServiceCategory.driver:
        return localization.driver;
      case ServiceCategory.elderCareProvider:
        return localization.elderCareProvider;
      case ServiceCategory.electrician:
        return localization.electrician;
      case ServiceCategory.electricalServices:
        return localization.electricalServices;
      case ServiceCategory.eventPlanner:
        return localization.eventPlanner;
      case ServiceCategory.financialPlanner:
        return localization.financialPlanner;
      case ServiceCategory.gardener:
        return localization.gardener;
      case ServiceCategory.glassRepair:
        return localization.glassRepair;
      case ServiceCategory.graphicDesigner:
        return localization.graphicDesigner;
      case ServiceCategory.gutterCleaning:
        return localization.gutterCleaning;
      case ServiceCategory.hairdresser:
        return localization.hairdresser;
      case ServiceCategory.airConditionerServices:
        return localization.airConditionerServices;
      case ServiceCategory.insulationServices:
        return localization.insulationServices;
      case ServiceCategory.internetServices:
        return localization.internetServices;
      case ServiceCategory.interpreter:
        return localization.interpreter;
      case ServiceCategory.jewelryRepair:
        return localization.jewelryRepair;
      case ServiceCategory.lawyer:
        return localization.lawyer;
      case ServiceCategory.locksmith:
        return localization.locksmith;
      case ServiceCategory.makeupArtist:
        return localization.makeupArtist;
      case ServiceCategory.marketingConsultant:
        return localization.marketingConsultant;
      case ServiceCategory.mason:
        return localization.mason;
      case ServiceCategory.masseurMassagist:
        return localization.masseurMassagist;
      case ServiceCategory.nails:
        return localization.nails;
      case ServiceCategory.nutritionist:
        return localization.nutritionist;
      case ServiceCategory.painter:
        return localization.painter;
      case ServiceCategory.personalTrainer:
        return localization.personalTrainer;
      case ServiceCategory.petGroomer:
        return localization.petGroomer;
      case ServiceCategory.phoneRepair:
        return localization.phoneRepair;
      case ServiceCategory.photographer:
        return localization.photographer;
      case ServiceCategory.plumber:
        return localization.plumber;
      case ServiceCategory.poolCleaning:
        return localization.poolCleaning;
      case ServiceCategory.pressureWashing:
        return localization.pressureWashing;
      case ServiceCategory.socialMediaManager:
        return localization.socialMediaManager;
      case ServiceCategory.solarServices:
        return localization.solarServices;
      case ServiceCategory.tattooArtist:
        return localization.tattooArtist;
      case ServiceCategory.therapist:
        return localization.therapist;
      case ServiceCategory.tutor:
        return localization.tutor;
      case ServiceCategory.upholsteryCleaning:
        return localization.upholsteryCleaning;
      case ServiceCategory.veterinarian:
        return localization.veterinarian;
      case ServiceCategory.watchRepair:
        return localization.watchRepair;
      case ServiceCategory.weddingPlanner:
        return localization.weddingPlanner;
      case ServiceCategory.weldingServices:
        return localization.weldingServices;
      case ServiceCategory.windowCleaning:
        return localization.windowCleaning;
      case ServiceCategory.securitySystems:
        return localization.securitySystems;
      case ServiceCategory.solarPanelInstallation:
        return localization.solarPanelInstallation;
    }
  }
}

enum ServicePricingType { fixed, hourly, daily, weekly, monthly, yearly }

final Map<ServicePricingType, String> servicePricingTypeTranslations = {
  ServicePricingType.fixed: 'Fixo',
  ServicePricingType.hourly: 'Por Hora',
  ServicePricingType.daily: 'Diário',
  ServicePricingType.weekly: 'Semanal',
  ServicePricingType.monthly: 'Mensal',
};

enum ServiceType { atSite, atHome, online, atSiteAndAtHome }
