// ignore: camel_case_types
class contactObj {
  String name;
  String serverName;
  bool isInChat;

  contactObj(name, serverName) {
    this.name = name;
    this.serverName = serverName;
    this.isInChat = false;
  }

  setIsInChat() {
    this.isInChat = !this.isInChat;
  }

  getIsInChat() {
    return this.isInChat;
  }

  getUsername() {
    return this.name;
  }

  getServerName() {
    return this.serverName;
  }

  @override
  String toString() {
    return "name: " + this.name + " belongs to server: " + this.serverName;
  }
}