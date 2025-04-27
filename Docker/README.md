Sure thing! 🚀 Here's a **simple and clean Bash script** to install **Docker** on **Ubuntu** (any recent version like 20.04, 22.04, etc.):

---

### 📜 `install-docker.sh`

```bash

### 📌 How to use it:

1. Save it as `install-docker.sh`.
2. Make it executable:

   ```bash
   chmod +x install-docker.sh
   ```

3. Run the script:

   ```bash
   ./install-docker.sh
   ```

---

### ⚡ Quick Notes:
- This script **installs the latest stable version** of Docker from Docker's official repository.
- It **enables Docker service** to start on boot.
- After running it, you can optionally add your user to the `docker` group so you don't need `sudo` for docker commands:

  ```bash
  sudo usermod -aG docker $USER
  newgrp docker
  ```

---

Would you also like me to give you a **version that installs Docker Compose** along with Docker?  
(very useful for real-world setups!) 🚀✨