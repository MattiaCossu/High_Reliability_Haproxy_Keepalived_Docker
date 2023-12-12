# Usa l'immagine di base di NGINX
FROM nginx:stable-alpine

RUN chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/conf.d
    
USER nginx

# Esponi la porta 80 (o qualsiasi altra necessaria)
EXPOSE 80
