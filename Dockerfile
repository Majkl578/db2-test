FROM ibmcom/db2express-c:10.5.0.5-3.10.0

ADD custom-entrypoint.sh /

ENTRYPOINT ["/custom-entrypoint.sh"]
