# Vault-Kwings

This repository contains configurations for setting up Vault along with NGINX.

## Setup Instructions

### Initial Setup

1. Run the `setup_vault.sh` script to initialize Vault and perform the initial setup.

### Vault Unsealing

2. After setup, follow the steps to unseal Vault to make it operational.

### Running Vault with NGINX

3. Once Vault is unsealed and healthy:

   ```
   docker-compose up -d
   ```

   This command starts Vault along with NGINX configured to proxy requests to Vault.

## Additional Notes

- Ensure Docker and Docker Compose are installed and configured.
- Customize configurations (`vault.json`, NGINX configurations) as needed for your environment.
- Monitor logs (`docker-compose logs -f <service_name>`) to verify startup and operation of services.

---

### Explanation:

- **Setup Instructions**: Provides clear steps to initialize Vault (`setup_vault.sh`), unseal it, and start the Docker services.
- **Running Vault with NGINX**: Shows the command (`docker-compose up -d`) to start the Docker services.
- **Additional Notes**: Includes tips and reminders for customizing configurations and monitoring services.