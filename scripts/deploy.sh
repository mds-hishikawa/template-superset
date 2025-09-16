#!/bin/bash
TARGET_USER=$1
TARGET_HOST=$2
# O caminho e a pasta de artefatos mudam para cada serviço
ARTIFACT_FOLDER="./assets" 
REMOTE_PATH="/opt/superset/assets"

echo "🔄 Syncing files to ${TARGET_HOST}..."
rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no" ${ARTIFACT_FOLDER}/ "${TARGET_USER}@${TARGET_HOST}:${REMOTE_PATH}/"
echo "✅ Sync complete."

# Para serviços de API (Nifi, Airbyte, n8n, OpenMetadata), adicione chamadas curl aqui
# echo "📞 Calling API to import configuration..."
# curl -X POST http://${TARGET_HOST}:8080/api/endpoint --data-binary "@${ARTIFACT_FOLDER}/config.json"