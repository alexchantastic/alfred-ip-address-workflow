# alfred-ip-address-workflow

![Screenshot](https://user-images.githubusercontent.com/604167/116506001-16aadf80-a871-11eb-92d5-0b1ac7c8054c.png)

An [Alfred 5](https://www.alfredapp.com/) workflow for getting your local and external IP addresses.

## Installation

1. [Download the workflow](https://github.com/alexchantastic/alfred-ip-address-workflow/releases/latest)
2. Double click the `.alfredworkflow` file to install
3. (Optional) Specify which external IP service you would like to use (see below for more details)

Note that the [Alfred Powerpack](https://www.alfredapp.com/powerpack/) is required to use workflows.

## External IP services

In order to get your external IPv4 and IPv6 addresses, the workflow must query an external IP service. By default, the workflow uses [icanhazip.com](https://icanhazip.com), but any service that returns your external IP in plaintext will work. The following is a non-exhaustive list of free services that you can use. Some of these may be blocked by your firewall or ISP.

* [whatismyip.akamai.com](http://whatismyip.akamai.com)
* [ifcfg.me](http://ifcfg.me)
* [ip.tyk.nu](https://ip.tyk.nu)
* [ident.me](http://ident.me)

To configure the service used:

1. Open Alfred preferences
2. Click **Workflows** on the left
3. Select the **IP Address** workflow
4. Click the **Configure Workflow** button in the header of the workflow builder
5. Enter the HTTP/HTTPS address of the service
6. Click **Save**

## Usage

1. Use the keyword `ip` to trigger the workflow
2. Select IP you would like to copy or paste (local IPv4, external IPv4, local IPv6, external IPv6)
3. Press `enter` to copy to clipboard and paste into the forefront application or just `⌘ + c` to copy to clipboard

## License

Code released under the [MIT License](https://github.com/alexchantastic/alfred-ip-address-workflow/blob/master/LICENSE).
