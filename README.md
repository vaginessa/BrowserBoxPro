# Install and Run

:warning: Make sure you're installing from a non-`root` user with `sudo` permissons, because some components aren't intended to be installed as root and probably won't work, but nevertheless require `sudo` to install.

ℹ️ Make sure you have set up your hostname DNS records for your VPS prior to install, as we use LetsEncrypt to get certificates for the web application.

🥇 You need to respond "Y" to some prompts throughout the install, so be sure to sit there and complete it and not let it time out.


1. `git clone https://github.com/dosyago/BrowserBoxPro`
2. `cd BrowserBoxPro`
3. `./deploy-scripts/global_install.sh`
4. `setup_bbpro --port 8080` (this will output the login link)
5. `bbpro`

Then, use the login link output in step 4 to connect to the virtual browser (from a regular mobile or desktop browser). 

ℹ️ You may observe some errors during the install! As long as everything runs, you can safely ignore those, because they're likely branches for different OSes. 

# System Requirements (recommended)

Debian VPS with 2 core, 4 GB RAM, and 100 GB SSD, and at least 10 Mbps connection, *plus a public hostname with a DNS A record pointing to the IP of your VPS, because we provision a TLS certificate for that hostname, and it forms part of the login link!*

Actual requirements depends on what you browse, but the above should give good performance on a range of real-world browsing tasks. If you need better performance, use better hardware.


