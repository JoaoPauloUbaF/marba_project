import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class MockUtils {
  // Singleton instance
  static final MockUtils _instance = MockUtils._internal();

  factory MockUtils() => _instance;

  MockUtils._internal();

  // Método para obter um OrderModel a partir do JSON fornecido
  OfferModel getMockedOfferModel() {
    const json = {
      "id": "00000000-0000-0000-0000-000000000000",
      "businessId": "00000000-0000-0000-0000-000000000000",
      "category": ["ServiceCategory.home"],
      "createdAt": "2024-03-18T00:00:00.000000",
      "updatedAt": "2024-03-18T00:00:00.000000",
      "status": "onDemand",
      "type": "service",
      "service": {
        "title": "Placeholder Title",
        "description":
            "Esta é uma descrição de exemplo para o serviço. Por favor, substitua este texto pelo conteúdo relevante do seu serviço.",
        "price": 0.0,
        "imageUrl": "https://via.placeholder.com/300",
        "status": "OfferStatus.onDemand"
      }
    };

    return OfferModel.fromJson(json);
  }
}
