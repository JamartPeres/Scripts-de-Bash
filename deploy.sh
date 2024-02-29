systemctl stop nginx

cd nginx
git pull
mv -v * /var/www/html

systemctl start nginx

ngrok config add-authtoken 2cygh7xTCpVe7vg9HIe0xpbQtuE_41YFRLCAMrNRwe1Ft8MFh
ngrok http http://192.168.100.151:80 > /dev/null &

#Para consultar la url
ngrok_url=$(curl -s http://localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)

echo "URL del sitio: $ngrok_url"
