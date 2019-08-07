/*
* Copyright 2018-2019 Ruben Talstra and Yvan Watchman
*
* Licensed under the GNU General Public License v3.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*    https://www.gnu.org/licenses/gpl-3.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import 'package:flutter/material.dart';

// AccurateNode
import 'package:pterodactyl_app/page/company/accuratenode/client/home.dart';
import 'package:pterodactyl_app/page/company/accuratenode/client/login.dart';
import 'package:pterodactyl_app/page/company/accuratenode/client/servers.dart';
import 'package:pterodactyl_app/page/company/accuratenode/client/about.dart';
import 'package:pterodactyl_app/page/company/accuratenode/client/settings.dart';

// CodersLight
import 'package:pterodactyl_app/page/company/coderslight/client/home.dart';
import 'package:pterodactyl_app/page/company/coderslight/client/login.dart';
import 'package:pterodactyl_app/page/company/coderslight/client/servers.dart';
import 'package:pterodactyl_app/page/company/coderslight/client/about.dart';
import 'package:pterodactyl_app/page/company/coderslight/client/settings.dart';

// Deploys
import 'package:pterodactyl_app/page/company/deploys/client/home.dart';
import 'package:pterodactyl_app/page/company/deploys/client/login.dart';
import 'package:pterodactyl_app/page/company/deploys/client/about.dart';
import 'package:pterodactyl_app/page/company/deploys/client/settings.dart';

// MiniCenter
import 'package:pterodactyl_app/page/company/minicenter/client/home.dart';
import 'package:pterodactyl_app/page/company/minicenter/client/login.dart';
import 'package:pterodactyl_app/page/company/minicenter/client/servers.dart';
import 'package:pterodactyl_app/page/company/minicenter/client/about.dart';
import 'package:pterodactyl_app/page/company/minicenter/client/settings.dart';

// PlanetNode
import 'package:pterodactyl_app/page/company/planetnode/client/home.dart';
import 'package:pterodactyl_app/page/company/planetnode/client/login.dart';
import 'package:pterodactyl_app/page/company/planetnode/client/servers.dart';
import 'package:pterodactyl_app/page/company/planetnode/client/about.dart';
import 'package:pterodactyl_app/page/company/planetnode/client/settings.dart';

// ReviveNode
import 'package:pterodactyl_app/page/company/revivenode/client/home.dart';
import 'package:pterodactyl_app/page/company/revivenode/client/login.dart';
import 'package:pterodactyl_app/page/company/revivenode/client/servers.dart';
import 'package:pterodactyl_app/page/company/revivenode/client/about.dart';
import 'package:pterodactyl_app/page/company/revivenode/client/settings.dart';

// RoyaleHosting
import 'package:pterodactyl_app/page/company/royalehosting/client/home.dart';
import 'package:pterodactyl_app/page/company/royalehosting/client/login.dart';
import 'package:pterodactyl_app/page/company/royalehosting/client/servers.dart';
import 'package:pterodactyl_app/page/company/royalehosting/client/about.dart';
import 'package:pterodactyl_app/page/company/royalehosting/client/settings.dart';

/// Dart has no functionality to dynamically create class instances
/// Till then, we'll have to manually add every route.
Map companyRoutes() {
  Map c = <String, Map>{};
  c['accuratenode'] = <String, WidgetBuilder>{
    '/accuratenode/home': (BuildContext context) => new MyAccurateNodeHomePage(),
    '/accuratenode/login': (BuildContext context) => new LoginAccurateNodePage(),
    '/accuratenode/servers': (BuildContext context) => new AccurateNodeServerListPage(),
    '/accuratenode/about': (BuildContext context) => new AccurateNodeAboutPage(),
    '/accuratenode/settings': (BuildContext context) => new AccurateNodeSettingsList(),
  };  
  c['coderslight'] = <String, WidgetBuilder>{
    '/coderslight/home': (BuildContext context) => new MyCodersLightHomePage(),
    '/coderslight/login': (BuildContext context) => new LoginCodersLightPage(),
    '/coderslight/servers': (BuildContext context) => new CodersLightServerListPage(),
    '/coderslight/about': (BuildContext context) => new CodersLightAboutPage(),
    '/coderslight/settings': (BuildContext context) => new CodersLightSettingsList(),
  };
  c['deploys'] = <String, WidgetBuilder>{
    '/deploys/home': (BuildContext context) => new MyDeploysHomePage(),
    '/deploys/login': (BuildContext context) => new LoginDeploysPage(),
    '/deploys/about': (BuildContext context) => new DeploysAboutPage(),
    '/deploys/settings': (BuildContext context) => new DeploysSettingsList(),
  };
  c['minicenter'] = <String, WidgetBuilder>{
    '/minicenter/home': (BuildContext context) => new MyMiniCenterHomePage(),
    '/minicenter/login': (BuildContext context) => new LoginMiniCenterPage(),
    '/minicenter/servers': (BuildContext context) => new MiniCenterServerListPage(),
    '/minicenter/about': (BuildContext context) => new MiniCenterAboutPage(),
    '/minicenter/settings': (BuildContext context) => new MiniCenterSettingsList(),
  };
  c['planetnode'] = <String, WidgetBuilder>{
    '/planetnode/home': (BuildContext context) => new MyPlanetNodeHomePage(),
    '/planetnode/login': (BuildContext context) => new LoginPlanetNodePage(),
    '/planetnode/servers': (BuildContext context) => new PlanetNodeServerListPage(),
    '/planetnode/about': (BuildContext context) => new PlanetNodeAboutPage(),
    '/planetnode/settings': (BuildContext context) => new PlanetNodeSettingsList(),
  };
  c['revivenode'] = <String, WidgetBuilder>{
    '/revivenode/home': (BuildContext context) => new MyReviveNodeHomePage(),
    '/revivenode/login': (BuildContext context) => new LoginReviveNodePage(),
    '/revivenode/servers': (BuildContext context) => new ReviveNodeServerListPage(),
    '/revivenode/about': (BuildContext context) => new ReviveNodeAboutPage(),
    '/revivenode/settings': (BuildContext context) => new ReviveNodeSettingsList(),
  };
  c['royalehosting'] = <String, WidgetBuilder>{
    '/royalehosting/home': (BuildContext context) => new MyRoyaleHostingHomePage(),
    '/royalehosting/login': (BuildContext context) => new LoginRoyaleHostingPage(),
    '/royalehosting/servers': (BuildContext context) => new RoyaleHostingServerListPage(),
    '/royalehosting/about': (BuildContext context) => new RoyaleHostingAboutPage(),
    '/royalehosting/settings': (BuildContext context) => new RoyaleHostingSettingsList(),
  };  
  return c;
}


List<String> companies() {
  List<String> companies = [];
  companies.addAll(
      ['deploys', 'coderslight', 'minicenter', 'planetnode', 'revivenode', 'accuratenode', 'royalehosting']);
  return companies;
}
