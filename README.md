# Cinch Integration Plugin
[![GitHub](https://img.shields.io/badge/github-Xzanth/cinch--integrate-blue.svg)](http://github.com/Xzanth/cinch-integrate)
[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](#license)
[![Dependency Status](https://img.shields.io/gemnasium/Xzanth/cinch-integrate.svg)](https://gemnasium.com/Xzanth/cinch-integrate)
[![Gem Version](https://badge.fury.io/rb/cinch-integrate.svg)](https://badge.fury.io/rb/cinch-integrate)  
Plugin to integrate a cinch bot with other services, currently just works with
slack web integration.

## Usage
install the gem in your application's Gemfile:

    gem 'cinch-integration'

then alter your bot's config to include the following:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ruby
require 'cinch/plugins/integration'

bot = Cinch::Bot.new do
  configure do |c|
    c.plugins.plugins = [Cinch::Plugins::Integrate]
    c.plugins.options[Cinch::Plugins::Integrate] = {
      integrations: [:slack],
      slack_key:    'insert slack key here'
    }
  end
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| Option  | Description |
| ------------- | ------------- |
| `integrations`  | A list of symbols that correspond to specific integrations, currently the only option is `:slack`|
| `slack_key` | Slack API token to pass to slack-ruby-client |

You can then have your bot/plugin integrate with slack by sending `:integrate`
events to the bot like so:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ruby
require 'cinch/plugins/integration'

@bot.handlers.dispatch(
  :integrate,
  nil,
  :slack,
  channel: "#channel_here",
  text: 'put your message here',
  as_user: true
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## License
Copyright (C) 2016 Jonas Osborn

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
