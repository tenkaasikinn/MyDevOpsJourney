from datetime import datetime
from colorama import Fore, Style, init

# init agar colorama bekerja baik di Windows/Linux
init(autoreset=True)

name = "TENKA"
os = "Fedora Workstation"
login = "2025"
like = "Linux"
hate = "Windows"
moto = "Linux the best operating system in the world"

timestamp = datetime.now().strftime("%d/%m/%Y")
print(f"[INFO LOGIN] {timestamp} :: Login Verified\n")

print(f"{Fore.CYAN}[OK] Name : {name}")
print(f"{Fore.GREEN}[OK] Operating System : {os}")
print(f"{Fore.BLUE}[OK] First Linux Login : {login}")
print(f"[OK] My Motto : {moto}")
print(f"{Fore.RED}[LOL] I hate {hate}")