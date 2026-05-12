#include "ConfigManager.h"

ConfigManager::ConfigManager() {}

QString ConfigManager::getServerHost() const { return "localhost"; }
int ConfigManager::getServerPort() const { return 8000; }
