#
# Author:: Doug MacEachern <dougm@vmware.com>
# Cookbook Name:: windows
# Recipe:: proxy
#
# Copyright 2010, VMware, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if Chef::Config[:http_proxy]
  proxy = URI.parse(Chef::Config[:http_proxy])
  windows_registry 'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' do
    values "ProxyEnable" => 1, "ProxyServer" => "#{proxy.host}:#{proxy.port}", "ProxyOverride" => "<local>"
  end
end
