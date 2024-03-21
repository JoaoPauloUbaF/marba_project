enum BusinessCategory {
  // Serviços
  homeServices, // Serviços Residenciais
  automotiveServices, // Serviços Automotivos
  professionalServices, // Serviços Profissionais
  beautyServices, // Serviços de Beleza
  healthServices, // Serviços de Saúde
  entertainmentServices, // Serviços de Entretenimento
  petServices, // Serviços para Animais de Estimação
  eventServices, // Serviços para Eventos
  educationServices, // Serviços Educacionais

  // Comércio
  foodAndBeverage, // Alimentos e Bebidas
  retail, // Varejo
  clothing, // Vestuário
  electronics, // Eletrônicos
  homeAndGarden, // Casa e Jardim
  appliances, // Eletrodomésticos
  toysAndGames, // Brinquedos e Jogos
  booksAndStationery, // Livros e Papelaria
  sportsAndOutdoors, // Esportes e Ar Livre
  automotive, // Automotivo
  beautyAndPersonalCare, // Beleza e Cuidados Pessoais
  healthAndWellness, // Saúde e Bem-estar
  artsAndCrafts, // Artes e Artesanato
  jewelryAndAccessories, // Joias e Acessórios
  petSupplies, // Suprimentos para Animais de Estimação
  eventPlanning, // Planejamento de Eventos
  photography, // Fotografia
  musicAndInstruments, // Música e Instrumentos
  technologyServices, // Serviços de Tecnologia
  financialServices, // Serviços Financeiros
  legalServices, // Serviços Jurídicos
  realEstate, // Imobiliário
  marketingAndAdvertising, // Marketing e Publicidade
  transportationServices, // Serviços de Transporte
  hospitalityServices, // Serviços de Hospitalidade
  construction, // Construção
  repairAndMaintenance, // Reparo e Manutenção
  other // Outros
}

final Map<BusinessCategory, String> businessCategoryTranslations = {
  BusinessCategory.homeServices: 'Serviços Residenciais',
  BusinessCategory.automotiveServices: 'Serviços Automotivos',
  BusinessCategory.professionalServices: 'Serviços Profissionais',
  BusinessCategory.beautyServices: 'Serviços de Beleza',
  BusinessCategory.healthServices: 'Serviços de Saúde',
  BusinessCategory.entertainmentServices: 'Serviços de Entretenimento',
  BusinessCategory.petServices: 'Serviços para Animais de Estimação',
  BusinessCategory.eventServices: 'Serviços para Eventos',
  BusinessCategory.educationServices: 'Serviços Educacionais',
  BusinessCategory.foodAndBeverage: 'Alimentos e Bebidas',
  BusinessCategory.retail: 'Varejo',
  BusinessCategory.clothing: 'Vestuário',
  BusinessCategory.electronics: 'Eletrônicos',
  BusinessCategory.homeAndGarden: 'Casa e Jardim',
  BusinessCategory.appliances: 'Eletrodomésticos',
  BusinessCategory.toysAndGames: 'Brinquedos e Jogos',
  BusinessCategory.booksAndStationery: 'Livros e Papelaria',
  BusinessCategory.sportsAndOutdoors: 'Esportes e Ar Livre',
  BusinessCategory.automotive: 'Automotivo',
  BusinessCategory.beautyAndPersonalCare: 'Beleza e Cuidados Pessoais',
  BusinessCategory.healthAndWellness: 'Saúde e Bem-estar',
  BusinessCategory.artsAndCrafts: 'Artes e Artesanato',
  BusinessCategory.jewelryAndAccessories: 'Joias e Acessórios',
  BusinessCategory.petSupplies: 'Suprimentos para Animais de Estimação',
  BusinessCategory.eventPlanning: 'Planejamento de Eventos',
  BusinessCategory.photography: 'Fotografia',
  BusinessCategory.musicAndInstruments: 'Música e Instrumentos',
  BusinessCategory.technologyServices: 'Serviços de Tecnologia',
  BusinessCategory.financialServices: 'Serviços Financeiros',
  BusinessCategory.legalServices: 'Serviços Jurídicos',
  BusinessCategory.realEstate: 'Imobiliário',
  BusinessCategory.marketingAndAdvertising: 'Marketing e Publicidade',
  BusinessCategory.transportationServices: 'Serviços de Transporte',
  BusinessCategory.hospitalityServices: 'Serviços de Hospitalidade',
  BusinessCategory.construction: 'Construção',
  BusinessCategory.repairAndMaintenance: 'Reparo e Manutenção',
  BusinessCategory.other: 'Outros',
};
