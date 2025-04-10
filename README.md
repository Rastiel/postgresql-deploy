# PostgreSQL Deploy Script

Bu script, Ubuntu sunucuya PostgreSQL kurulumunu ve varsayılan veritabanı ile kullanıcı oluşturmayı otomatikleştirir.

## Kullanım

```bash
git clone <repo-link>
cd postgresql-deploy
chmod +x install.sh
./install.sh
```

## Ortam Değişkenleri (.env ile opsiyonel)

- `DB_NAME`: Oluşturulacak veritabanı adı (varsayılan: `benimdb`)
- `DB_USER`: Oluşturulacak kullanıcı adı (varsayılan: `benimkullanici`)
- `DB_PASS`: Kullanıcının şifresi (varsayılan: `sifre123`)
