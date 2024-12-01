package {
    public class Chat {
        public static var _bymChat: Object;
        public static var _chatServers: Object;
        public static var _chatEnabled: Boolean;
        public static var _chatInited: Boolean;
        public static function flagsShouldChatExist(): Boolean {return false;}
        public static function flagsShouldChatDisplay(): Boolean {return false;}
        public static function initChat(): void {}
        public static function setChatPosition(): void {}
        public static function connectAndLogin(): void {}
        
    }
}