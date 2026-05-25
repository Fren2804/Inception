#!/bin/sh

if [ -z "$FTP_USER" ] || [ -z "$FTP_PASS" ]; then
    echo "ERROR: FTP_USER o FTP_PASS no están definidos."
    exit 1
fi

if ! id "$FTP_USER" >/dev/null 2>&1; then
    echo "Creando usuario FTP: $FTP_USER"
    adduser -D -h /var/www/html "$FTP_USER"
    echo "$FTP_USER:$FTP_PASS" | chpasswd
    chown -R "$FTP_USER:$FTP_USER" /var/www/html
fi

echo "Iniciando vsftpd en el puerto 21..."
exec vsftpd /etc/vsftpd/vsftpd.conf