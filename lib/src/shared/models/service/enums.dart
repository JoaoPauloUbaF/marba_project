enum ServiceCategory {
  accountant, // Contador(a)
  alarmServices, // Serviços de Alarme
  applianceRepair, // Conserto de Eletrodomésticos
  architect, // Arquiteto(a)
  babysitter, // Babá
  bicycleRepair, // Conserto de Bicicletas
  cableServices, // Serviços de TV a Cabo
  carpenter, // Carpinteiro
  cleaner, // Faxineiro(a)
  computerRepair, // Conserto de Computadores
  deliveryPerson, // Entregador(a)
  dogWalker, // Passeador(a) de Cães
  driver, // Motorista
  elderCareProvider, // Cuidador(a) de Idosos
  electrician, // Eletricista
  electricalServices, // Serviços Elétricos
  eventPlanner, // Organizador(a) de Eventos
  financialPlanner, // Planejador(a) Financeiro(a)
  gardener, // Jardineiro
  glassRepair, // Conserto de Vidros
  graphicDesigner, // Designer Gráfico(a)
  gutterCleaning, // Limpeza de Calhas
  hairdresser, // Cabeleireiro
  airConditionerServices, // Serviços de Aquecimento, Ventilação e Ar Condicionado
  insulationServices, // Serviços de Isolamento
  internetServices, // Serviços de Internet
  interpreter, // Intérprete
  jewelryRepair, // Conserto de Joias
  lawyer, // Advogado(a)
  locksmith, // Chaveiro
  makeupArtist, // Maquiador(a)
  marketingConsultant, // Consultor(a) de Marketing
  mason, // Pedreiro
  masseurMassagist, // Massagista
  nails, // Manicure
  nutritionist, // Nutricionista
  painter, // Pintor(a)
  personalTrainer, // Personal Trainer
  petGroomer, // Tosador(a) de Animais
  phoneRepair, // Conserto de Telefones
  photographer, // Fotógrafo(a)
  plumber, // Encanador
  poolCleaning, // Limpeza de Piscinas
  pressureWashing, // Lavagem de Pressão
  socialMediaManager, // Gerente de Mídias Sociais
  solarServices, // Serviços Solares
  tattooArtist, // Tatuador(a)
  therapist, // Terapeuta
  tutor, // Tutor
  upholsteryCleaning, // Limpeza de Estofados
  veterinarian, // Veterinário(a)
  watchRepair, // Conserto de Relógios
  weddingPlanner, // Organizador(a) de Casamentos
  weldingServices, // Serviços de Soldagem
  windowCleaning, // Limpeza de Vidros
  securitySystems, // Sistemas de Segurança
  solarPanelInstallation, // Instalação de Painéis Solares
}

final Map<ServiceCategory, String> serviceCategoryTranslations = {
  ServiceCategory.accountant: 'Contador(a)',
  ServiceCategory.alarmServices: 'Serviços de Alarme',
  ServiceCategory.applianceRepair: 'Conserto de Eletrodomésticos',
  ServiceCategory.architect: 'Arquiteto(a)',
  ServiceCategory.babysitter: 'Babá',
  ServiceCategory.bicycleRepair: 'Conserto de Bicicletas',
  ServiceCategory.cableServices: 'Serviços de TV a Cabo',
  ServiceCategory.carpenter: 'Carpinteiro',
  ServiceCategory.cleaner: 'Faxineiro(a)',
  ServiceCategory.computerRepair: 'Conserto de Computadores',
  ServiceCategory.deliveryPerson: 'Entregador(a)',
  ServiceCategory.dogWalker: 'Passeador(a) de Cães',
  ServiceCategory.driver: 'Motorista',
  ServiceCategory.elderCareProvider: 'Cuidador(a) de Idosos',
  ServiceCategory.electrician: 'Eletricista',
  ServiceCategory.electricalServices: 'Serviços Elétricos',
  ServiceCategory.eventPlanner: 'Organizador(a) de Eventos',
  ServiceCategory.financialPlanner: 'Planejador(a) Financeiro(a)',
  ServiceCategory.gardener: 'Jardineiro',
  ServiceCategory.glassRepair: 'Conserto de Vidros',
  ServiceCategory.graphicDesigner: 'Designer Gráfico(a)',
  ServiceCategory.gutterCleaning: 'Limpeza de Calhas',
  ServiceCategory.hairdresser: 'Cabeleireiro',
  ServiceCategory.airConditionerServices:
      'Serviços de Aquecimento, Ventilação e Ar Condicionado',
  ServiceCategory.insulationServices: 'Serviços de Isolamento',
  ServiceCategory.internetServices: 'Serviços de Internet',
  ServiceCategory.interpreter: 'Intérprete',
  ServiceCategory.jewelryRepair: 'Conserto de Joias',
  ServiceCategory.lawyer: 'Advogado(a)',
  ServiceCategory.locksmith: 'Chaveiro',
  ServiceCategory.mason: 'Pedreiro',
  ServiceCategory.makeupArtist: 'Maquiador(a)',
  ServiceCategory.marketingConsultant: 'Consultor(a) de Marketing',
  ServiceCategory.masseurMassagist: 'Massagista',
  ServiceCategory.nails: 'Manicure',
  ServiceCategory.nutritionist: 'Nutricionista',
  ServiceCategory.painter: 'Pintor(a)',
  ServiceCategory.personalTrainer: 'Personal Trainer',
  ServiceCategory.petGroomer: 'Tosador(a) de Animais',
  ServiceCategory.phoneRepair: 'Conserto de Telefones',
  ServiceCategory.photographer: 'Fotógrafo(a)',
  ServiceCategory.plumber: 'Encanador',
  ServiceCategory.poolCleaning: 'Limpeza de Piscinas',
  ServiceCategory.pressureWashing: 'Lavagem de Pressão',
  ServiceCategory.socialMediaManager: 'Gerente de Mídias Sociais',
  ServiceCategory.solarServices: 'Serviços Solares',
  ServiceCategory.tattooArtist: 'Tatuador(a)',
  ServiceCategory.therapist: 'Terapeuta',
  ServiceCategory.tutor: 'Tutor',
  ServiceCategory.upholsteryCleaning: 'Limpeza de Estofados',
  ServiceCategory.veterinarian: 'Veterinário(a)',
  ServiceCategory.watchRepair: 'Conserto de Relógios',
  ServiceCategory.weddingPlanner: 'Organizador(a) de Casamentos',
  ServiceCategory.weldingServices: 'Serviços de Soldagem',
  ServiceCategory.windowCleaning: 'Limpeza de Vidros',
  ServiceCategory.securitySystems: 'Sistemas de Segurança',
  ServiceCategory.solarPanelInstallation: 'Instalação de Painéis Solares',
};

enum ServicePricingType { fixed, hourly, daily, weekly, monthly, yearly }

final Map<ServicePricingType, String> servicePricingTypeTranslations = {
  ServicePricingType.fixed: 'Fixo',
  ServicePricingType.hourly: 'Por Hora',
  ServicePricingType.daily: 'Diário',
  ServicePricingType.weekly: 'Semanal',
  ServicePricingType.monthly: 'Mensal',
};
