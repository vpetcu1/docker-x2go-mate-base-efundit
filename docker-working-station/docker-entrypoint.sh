#!/bin/bash
/env.sh
/eclipse_conf.sh
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi
if [ ! -f /.user_conf_set ]; then
	/set_user_conf.sh
fi
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 1>/dev/null
