# ===== ETAPA 1: BUILD =====
# Usamos una imagen completa con Python para compilar dependencias
FROM python:3.11-slim as builder

WORKDIR /app

# Copiamos SOLO el requirements.txt primero (para aprovechar el cache de Docker)
COPY requirements.txt .

# Instalamos las dependencias en un directorio específico
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ===== ETAPA 2: PRODUCCIÓN =====
# Usamos una imagen minimalista para producción (más pequeña y segura)
FROM python:3.11-alpine

WORKDIR /app

# Creamos un usuario no-root por seguridad
RUN adduser -D appuser
USER appuser

# Copiamos las dependencias compiladas de la etapa anterior
COPY --from=builder /install /usr/local

# Copiamos el código de la aplicación
COPY --chown=appuser:appuser app.py .

# Exponemos el puerto (documentación)
EXPOSE 5000

# Comando para ejecutar la app
CMD ["python", "app.py"]