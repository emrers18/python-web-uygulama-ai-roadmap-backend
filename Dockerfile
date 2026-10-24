# Temel İmaj kullanılcağı seçilecek
# python 3.11 kullanalım

FROM python:3.11-slim

# container içinde çalışma klasörü belirle
WORKDIR /app

# requirements.txt kurulsun diye
COPY requirements.txt .

# gerekli python kütüphanelerin kurulumunu yap
RUN pip install --no-cache-dir -r requirements.txt

# projedeki diğer dosyaları container içine kopyala
COPY . .

# conatiner ayağa kalkınca hangi komut çalışacak
# fastapi uvicorn ile 8000 de çalışsın
# 0.0.0.0 yazma sebebi ise container dışından erişilebilir olması için
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


