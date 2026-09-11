#!/bin/bash

# 1. Verificar si se proporcionó un nombre de proyecto
	if [ -z "$1" ]; then
		echo "❌ Error: Debes proporcionar un nombre de proyecto."
		echo "Uso: ./crear_proyecto.sh nombre_del_proyecto"
		exit 1
	fi
    PROYECTO=$1

# 2. Crear la estructura de carpetas
	echo "🚀 Creando estructura para: $PROYECTO..."
	mkdir -p $PROYECTO/{src,tests,docs}

# 3. Entrar a la carpeta e inicializar archivos básicos
	cd $PROYECTO
	touch src/main.py
	touch tests/test_main.py
	echo "# Documentación de $PROYECTO" > docs/README.md

# 4. Inicializar Git y crear un .gitignore básico
	git init
	echo -e "venv/\n__pycache__/\n*.log" > .gitignore

# 5. Primer commit automático
	git add .
	git commit -m "chore: inicializar estructura del proyecto $PROYECTO"
    echo "✅ ¡Proyecto $PROYECTO creado y versionado exitosamente!"
