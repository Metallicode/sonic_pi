from pythonosc import osc_message_builder
from pythonosc import udp_client
import keyboard

def hook_funk(e):
    if e.event_type=="down":      
        sender.send_message('/trigger/change', []) 

sender = udp_client.SimpleUDPClient('127.0.0.1', 4560)

keyboard.hook(hook_funk)
