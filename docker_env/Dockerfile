FROM hpretl/iic-osic-tools:latest

USER root

ARG USERNAME
ARG USER_UID
ARG USER_GID

# Install ZSH and plugins
RUN apt-get update && \
    apt-get install -y --no-install-recommends zsh fzf git curl nano && \
    rm -rf /var/lib/apt/lists/*

# Bulletproof User Creation: Properly creates the user so Docker daemon finds it
RUN if id -u ${USER_UID} >/dev/null 2>&1; then \
        EXISTING_USER=$(getent passwd ${USER_UID} | cut -d: -f1); \
        usermod -l ${USERNAME} -s /usr/bin/zsh -d /home/${USERNAME} -m ${EXISTING_USER}; \
        groupmod -n ${USERNAME} $(getent group ${USER_GID} | cut -d: -f1); \
    else \
        groupadd --gid ${USER_GID} ${USERNAME} && \
        useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /usr/bin/zsh ${USERNAME}; \
    fi

# Sudo permissions
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# Ensure EDA tools are in the path for ZSH
ENV PATH="/foss/tools/bin:/foss/tools/sak:/foss/tools/kactus2:/foss/tools/klayout:/foss/tools/osic-multitool:/home/${USERNAME}/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PYTHONPATH="/usr/lib/python312.zip:/usr/lib/python3.12:/usr/lib/python3.12/lib-dynload:/usr/local/lib/python3.12/dist-packages:/usr/lib/python3/dist-packages:/foss/tools/ngspyce/local/lib/python3.12/dist-packages:/foss/tools/openems/local/lib/python3.12/dist-packages:/foss/tools/pyopus/local/lib/python3.12/dist-packages:/foss/tools/yosys/share/yosys/python3:/foss/tools/klayout/pymod:/foss/tools/vacask/lib/vacask/python"

# ADD THIS LINE: Force ZSH to look in your mounted folder for its config!
ENV HOME="/home/${USERNAME}"

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENTRYPOINT []
CMD ["zsh"]
