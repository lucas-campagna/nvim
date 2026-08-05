# Passo 1: Atualize o Sistema
sudo apt update
sudo apt upgrade -y

# Passo 2: Instale as Dependências
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Passo 3: Adicione a Chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Passo 4: Adicione o Repositório do Docker
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Passo 5: Instale o Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Passo 6: Adicione o Usuário ao Grupo Docker
sudo usermod -aG docker $USER

# Passo 7: Verifique a Instalação
docker --version
