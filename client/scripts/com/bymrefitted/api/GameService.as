package com.bymrefitted.api
{
    public class GameService {
        public function GameService() {
            throw new Error("GameService is a singleton and cannot be instantiated.");
        }

        /**
         * Calls the init endpoint of the gameserver.
         */
        public static function init(apiVersion: String, onSuccess: Function, onFail: Function): void {
            new URLLoaderApi().load(GLOBAL.serverUrl + "init", [["apiVersion", apiVersion]], onSuccess, onFail);
        }
    }
}