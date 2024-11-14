import 'package:flutter/material.dart';

class CargoCertificate extends StatelessWidget {
  final String id;
  final String cargoDetails;
  final double weight;
  final String destination;
  final String origin;
  final String timestamp;

  const CargoCertificate({
    super.key,
    required this.id,
    required this.cargoDetails,
    required this.weight,
    required this.destination,
    required this.origin,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            const Text(
              'Certificado Blockchain',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            
            // Logo o imagen (placeholder)
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.local_shipping, size: 50),
            ),
            const SizedBox(height: 20),

            // Detalles del certificado
            _buildDetailRow('ID:', id),
            _buildDetailRow('Detalles de Carga:', cargoDetails),
            _buildDetailRow('Peso:', '$weight kg'),
            _buildDetailRow('Origen:', origin),
            _buildDetailRow('Destino:', destination),
            _buildDetailRow('Fecha y Hora:', timestamp),
            
            const SizedBox(height: 20),
            
            // Footer con hash simulado
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Hash: 0x7d8f...3e2a',
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}