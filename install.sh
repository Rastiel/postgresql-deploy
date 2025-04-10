#!/bin/bash

# .env dosyası varsa değişkenleri içe aktar
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Varsayılan değerler
DB_NAME="${DB_NAME:-benimdb}"
DB_USER="${DB_USER:-benimkullanici}"
DB_PASS="${DB_PASS:-sifre123}"

echo "🔄 Sistemi güncelliyorum..."
sudo apt update && sudo apt upgrade -y

echo "🐘 PostgreSQL kuruluyor..."
sudo apt install postgresql postgresql-contrib -y

echo "✅ PostgreSQL servisi başlatılıyor..."
sudo systemctl enable postgresql
sudo systemctl start postgresql

echo "📦 Veritabanı ve kullanıcı oluşturuluyor..."
sudo -u postgres psql <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

echo "🎉 Kurulum tamamlandı."
echo "🧾 Veritabanı adı: $DB_NAME"
echo "👤 Kullanıcı adı: $DB_USER"
