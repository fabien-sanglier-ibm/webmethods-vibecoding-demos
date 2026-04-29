ARG BASE_MSR_VERSION=11.1.0.11
ARG WPM_PACKAGES="WmJDBCAdapter:v10.3.10.21 WmMQAdapter:v6.5.6.52"

FROM ibmwebmethods.azurecr.io/webmethods-microservicesruntime:${BASE_MSR_VERSION}

ARG WPM_PACKAGES

USER sagadmin:root

# add product packages
# Access secret WPM_TOKEN at default path /run/secrets/wpm_token_key
RUN --mount=type=secret,id=wpm_token_key,mode=0444 ${SAG_HOME}/wpm/bin/wpm.sh install -ws https://packages.webmethods.io -wr licensed -j $(cat /run/secrets/wpm_token_key) -d ${SAG_HOME}/IntegrationServer ${WPM_PACKAGES}

# add custom package(s)
COPY --chown=sagadmin:root src/packages/WxVibeCodingDemos/ $SAG_HOME/IntegrationServer/packages/WxVibeCodingDemos/

#change the config file to make it writable
RUN chmod +w $SAG_HOME/IntegrationServer/packages/WxVibeCodingDemos/config/globalVariables.cnf

# run Jcode to build the java code
RUN true \
    && $SAG_HOME/IntegrationServer/bin/jcode.sh make WxVibeCodingDemos \
    && true