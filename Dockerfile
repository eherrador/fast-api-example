# Usa una imagen base oficial de Python
FROM python:3.9-slim-buster

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

RUN pip install "fastapi[standard]"

# Copia el resto de tu código
COPY main.py /app/main.py

# Expone el puerto en el que FastAPI escuchará (Cloud Run usa PORT, que por defecto es 8080)
EXPOSE 8080

# Comando para ejecutar la aplicación usando 'fastapi run'
CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8080"]